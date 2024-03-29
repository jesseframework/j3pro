/*
 * Jesseframework - Computer Expertz Ltd - https://cpxz.us
 * Copyright (C) 2019-2021 Jesseframework
 *
 * This file is part of Jesseframework - https://github.com/jesseframework/j3.
 *
 * Jesseframework is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version. 
 *
 * Jesseframework is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 */

import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:j3enterprise/src/database/crud/backgroundjob/backgroundjob_schedule_crud.dart';
import 'package:j3enterprise/src/database/crud/desktop/desktop_crud.dart';
import 'package:j3enterprise/src/database/drift_database.dart';
import 'package:j3enterprise/src/pro/resources/repositories/account/currency/currency_repositories.dart';
import 'package:j3enterprise/src/pro/resources/repositories/account/exchnage_rate/exchange_rate.repositories.dart';
import 'package:j3enterprise/src/pro/resources/repositories/account/sales_tax/sales_tax_repositories.dart';
import 'package:j3enterprise/src/pro/resources/repositories/customer/address_repositories.dart';
import 'package:j3enterprise/src/pro/resources/repositories/customer/contacts_repositories.dart';
import 'package:j3enterprise/src/pro/resources/repositories/customer/customer_repositories.dart';
import 'package:j3enterprise/src/pro/resources/repositories/items/item_price_repositories.dart';
import 'package:j3enterprise/src/pro/resources/repositories/items/items_master_repositories.dart';
import 'package:j3enterprise/src/pro/resources/repositories/items/pricing_rule_repositories.dart';
import 'package:j3enterprise/src/pro/resources/repositories/sales/fullfillment/journey_plan_repositories.dart';
import 'package:j3enterprise/src/pro/utils/gps_location.dart';
import 'package:j3enterprise/src/resources/repositories/applogger_repositiry.dart';
import 'package:j3enterprise/src/resources/repositories/business_rule_repositiry.dart';
import 'package:j3enterprise/src/resources/repositories/mobile_desktop_repositiry.dart';
import 'package:j3enterprise/src/resources/repositories/preference_repository.dart';
import 'package:j3enterprise/src/resources/shared/function/schedule_background_jobs.dart';
import 'package:j3enterprise/src/resources/shared/function/update_backgroung_job_schedule_status.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/date_formating.dart';
import 'package:logging/logging.dart';
import 'package:drift/drift.dart' as moor;
part 'backgroundjobs_event.dart';
part 'backgroundjobs_state.dart';

class BackgroundJobsBloc extends Bloc<BackgroundJobsEvent, BackgroundJobsState> {
  late Scheduler scheduler;
  static final _log = Logger('BackgroundJobsBloc');
  var db;

  late String userMessage;
  late AppLoggerRepository appLoggerRepository;
  late BackgroundJobScheduleDao backgroundJobScheduleDao;
  late PreferenceRepository preferenceRepository;
  late BusinessRuleRepository businessRuleRepository;
  late MobileDesktopRepository mobileDesktopRepository;
  late CustomerRepository customerRepository;
  late JourneyPlanRepository journeyPlanRepository;
  late AddressRepository addressRepository;
  late ContactRepository contactRepository;
  late ItemMasterRepository itemMasterRepository;
  late ItemPriceRepository itemPriceRepository;
  late PricingRuleRepository pricingRuleRepository;
  late SalesTaxRepository salesTaxRepository;
  late CurrencyRepository currencyRepository;
  late ExchangeRateRepository exchangeRateRepository;
  late GeoLocation geoLocation;

  late DesktopDao desktopDao;
  late UpdateBackgroundJobStatus updateBackgroundJobStatus;
  BackgroundJobsBloc() : super(BackgroundJobsUninitialized()) {
    db = MyDatabase();
    appLoggerRepository = new AppLoggerRepository();
    preferenceRepository = new PreferenceRepository();
    businessRuleRepository = new BusinessRuleRepository();
    mobileDesktopRepository = new MobileDesktopRepository();
    customerRepository = new CustomerRepository();
    journeyPlanRepository = new JourneyPlanRepository();
    addressRepository = new AddressRepository();
    contactRepository = new ContactRepository();
    itemMasterRepository = new ItemMasterRepository();
    itemPriceRepository = new ItemPriceRepository();
    salesTaxRepository = new SalesTaxRepository();
    pricingRuleRepository = new PricingRuleRepository();
    currencyRepository = new CurrencyRepository();
    exchangeRateRepository = new ExchangeRateRepository();
    updateBackgroundJobStatus = new UpdateBackgroundJobStatus();
    geoLocation = new GeoLocation();
    backgroundJobScheduleDao = new BackgroundJobScheduleDao(db);
    desktopDao = new DesktopDao(db);
    scheduler = new Scheduler();
    on<BackgroundJobsStart>((event, emit) => _mapBackgroundJobsStartToState(event, emit));
    on<BackgroundJobsCancel>((event, emit) => _mapBackgroundJobsCancelToState(event, emit));
    on<BackgroundJobsStartAll>((event, emit) => _mapBackgroundJobsStartAllToState(event, emit));
    
  }
 

  _mapBackgroundJobsStartToState(BackgroundJobsStart event, Emitter<BackgroundJobsState> emit) async {
    emit(BackgroundJobsLoading());

    var data = await backgroundJobScheduleDao.getAllJobs();
    print('Jobb Data Load $data');
    String formatted = await formatDate(DateTime.now().toString());
    var fromEvent = new BackgroundJobScheduleCompanion(
        jobName: moor.Value(event.jobname),
        syncFrequency: moor.Value(event.syncFrequency),
        startDateTime: moor.Value(DateTime.tryParse(event.startDateTime)!),
        enableJob: moor.Value(true),
        jobStatus: moor.Value("Never Run"),
        lastRun: moor.Value(DateTime.tryParse(formatted)!));

    var isJobNameInDb = await backgroundJobScheduleDao.getJob(event.jobname);
    if (isJobNameInDb != null) {
      await backgroundJobScheduleDao.updateBackgroundJob(fromEvent, event.jobname);
      userMessage = AppLocalization.of(event.context)!.translate('user_message') ?? "Job Update Successful";
    } else {
      await backgroundJobScheduleDao.insertJobSchedule(fromEvent);
      userMessage = AppLocalization.of(event.context)!.translate('job_user_message') ?? "Job Added Successful";
    }

    //Set Time condition to false to start timer
    if (event.jobname == "Log Shipping") {
      scheduler.scheduleJobs(event.syncFrequency, event.jobname, (Timer timer) async => await appLoggerRepository.putAppLogOnServer(event.jobname));
    }
    if (event.jobname == "Configuration") {
      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await preferenceRepository.getPreferenceFromServer(event.jobname));

      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await preferenceRepository.getNonGlobalPrefFromServer(event.jobname));

      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await businessRuleRepository.getBusinessRuleFromServer(event.jobname));

      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await businessRuleRepository.getNonGlobalBusinessRuleFromServer(event.jobname));
    }

    if (event.jobname == "Mobile Desktop") {
      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await mobileDesktopRepository.getMobileDesktopFromServer(event.jobname));
    }

    if (event.jobname == "Customer") {
      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await customerRepository.getCustomerFromServer(event.jobname));
    }
    if (event.jobname == "Journey Plan") {
      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await journeyPlanRepository.getJourneyPlanFromServer(event.jobname));
    }

    if (event.jobname == "Address") {
      scheduler.scheduleJobs(event.syncFrequency, event.jobname, (Timer timer) async => addressRepository.getAddressFromServer(event.jobname));
    }
    if (event.jobname == "Contact") {
      scheduler.scheduleJobs(event.syncFrequency, event.jobname, (Timer timer) async => await contactRepository.getContactFromServer(event.jobname));
    }

    if (event.jobname == "Customer All") {
      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await customerRepository.getCustomerFromServer(event.jobname));

      scheduler.scheduleJobs(event.syncFrequency, event.jobname, (Timer timer) async => await contactRepository.getContactFromServer(event.jobname));

      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await journeyPlanRepository.getJourneyPlanFromServer(event.jobname));

      scheduler.scheduleJobs(event.syncFrequency, event.jobname, (Timer timer) async => await addressRepository.getAddressFromServer(event.jobname));
    }

    if (event.jobname == "Items") {
      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await itemMasterRepository.getItemMasterFromServer(event.jobname));
    }

    if (event.jobname == "Item Price") {
      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await itemPriceRepository.getItemPriceFromServer(event.jobname));
    }

    if (event.jobname == "Item Pricing Rule") {
      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await pricingRuleRepository.getPricingRuleFromServer(event.jobname));
    }
    if (event.jobname == "Items All") {
      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await itemMasterRepository.getItemMasterFromServer(event.jobname));

      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await itemPriceRepository.getItemPriceFromServer(event.jobname));

      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await pricingRuleRepository.getPricingRuleFromServer(event.jobname));
    }

    if (event.jobname == "Sales Tax") {
      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await salesTaxRepository.getSalesTaxFromServer(event.jobname));
    }
    if (event.jobname == "Currency") {
      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await currencyRepository.getCurrencyFromServer(event.jobname));
    }
    if (event.jobname == "Exchange Rate") {
      scheduler.scheduleJobs(
          event.syncFrequency, event.jobname, (Timer timer) async => await exchangeRateRepository.getExchnageRateFromServer(event.jobname));
    }

    if (event.jobname == "GPS Location Service") {
      if (Platform.isAndroid || Platform.isIOS)
        scheduler.scheduleJobs(event.syncFrequency, event.jobname, (Timer timer) async => await geoLocation.getDistance(event.jobname));
    }

    emit(BackgroundJobsSuccess(userMessage: userMessage));
  }

  _mapBackgroundJobsCancelToState(BackgroundJobsCancel event, Emitter<BackgroundJobsState> emit) async {
    scheduler.cancel(event.jobName);
    //AppLoggerRepository.isStopped = true;
    appLoggerRepository.isStopped = true;
    preferenceRepository.isStopped = true;
    userMessage = AppLocalization.of(event.context)!.translate('job_cancel_user_message') ?? "Job Cancel Successful";
    String formatted = await formatDate(DateTime.now().toString());
    var fromEvent = new BackgroundJobScheduleCompanion(
        enableJob: moor.Value(false), jobStatus: moor.Value("Cancel"), lastRun: moor.Value(DateTime.tryParse(formatted)!));

    await backgroundJobScheduleDao.updateBackgroundJob(fromEvent, event.jobName);

    emit(BackgroundJobsSuccess(userMessage: userMessage));
  }

  _mapBackgroundJobsStartAllToState(BackgroundJobsStartAll event, Emitter<BackgroundJobsState> emit) async {
    var jobData = await backgroundJobScheduleDao.getAllJobs();
    for (var eachJob in jobData) {
      await updateBackgroundJobStatus.updateJobStatus(eachJob.jobName, "Never Run");

      if (eachJob.jobName == "Log Shipping") {
        scheduler.runNowJobs(
            eachJob.syncFrequency, eachJob.jobName, (Timer timer) async => await appLoggerRepository.putAppLogOnServer(eachJob.jobName));
      }
    }

    userMessage = "Jobs Added Successful";

    emit(BackgroundJobsSuccess(userMessage: userMessage));
  }
}
