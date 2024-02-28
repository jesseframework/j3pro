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

import 'package:chopper/chopper.dart';

part 'rest_api_service.chopper.dart';

@ChopperApi(baseUrl: "/api")
abstract class RestApiService extends ChopperService {
  //Authenticate
  //@Post(path: '/TokenAuth/Authenticate')
  //Future<Response> login(@Body() Map<String, dynamic> body);

  @Get(path: '/abp/multi-tenancy/tenants/by-name/{tenantName}')
  Future<Response> isTenantAvailable(@Path() String tenantName);

  @Get(path: '/identity/users/by-email')
  Future<Response> getUser(@Query() String id);

  @Put(path: '/services/app/User/UpdateMobileHash')
  Future<Response> updateUserHash(@Body() Map<String, dynamic> body);

  //AppLogger
  @Post(path: '/services/app/MobileAppLogger/Create')
  Future<Response> mobileAppLogger(@Body() Map<String, dynamic> body);

  //System Setting

  @Get(path: '/services/app/Preference/GetAll?MaxResultCount=30000')
  Future<Response> getPreference();

  @Get(path: '/services/app/NonGlobalPreference/GetAll?MaxResultCount=30000')
  Future<Response> getNonGlobalPreference();

  @Get(path: '/services/app/BusinessRule/GetAll?MaxResultCount=300000')
  Future<Response> getBusinessRule();

  @Get(path: '/services/app/NonGlobalBusinessRule/GetAll?MaxResultCount=30000')
  Future<Response> getNonGlobalBusinessRule();

  //Mobile Desktop
  @Get(path: '/services/app/MobileDesktop/GetAll?MaxResultCount=30000')
  Future<Response> getMobileDesktop();

  //Pro End Posint
  //Sales Order
  @Post(path: '/services/app/SalesOrder/Create')
  Future<Response> createSalesOrder(@Body() Map<String, dynamic> body);

  @Get(path: '/services/app/Customer/GetAll?MaxResultCount=30000')
  Future<Response> getAllCustomer();

  @Get(path: '/services/app/Customer/Get?MaxResultCount=30000')
  Future<Response> getAllCustomerById();

  @Get(path: '/services/app/AddressBook/GetAll?MaxResultCount=30000')
  Future<Response> getAllAddress();

  @Get(path: '/services/app/AddressBook/GetAllByUserId?MaxResultCount=30000')
  Future<Response> getAllAddressByUser();

  @Post(path: '/services/app/Customer/Create')
  Future<Response> createCustomerInServer(@Body() Map<String, dynamic> body);

  @Post(path: '/services/app/Customer/Update')
  Future<Response> updateCustomerInServer(@Body() Map<String, dynamic> body);

  @Get(path: '/services/app/Journey/GetAll?MaxResultCount=30000')
  Future<Response> getAllJourney();

  @Get(path: '/services/app/Journey/GetBySalesRep?MaxResultCount=30000')
  Future<Response> getJourneyPlanBySalesRep();

  @Get(path: '/services/app/Item/GetAll?MaxResultCount=30000')
  Future<Response> getAllItems();

  @Get(path: '/services/app/SalesTax/GetAll?MaxResultCount=30000')
  Future<Response> getAllIsalestax();

  @Get(path: '/services/app/Currency/GetAll?MaxResultCount=30000')
  Future<Response> getAllCurrency();

  @Get(path: '/services/app/ExchangeRate/GetAll?MaxResultCount=30000')
  Future<Response> getAllExchangeRate();

  @Get(path: '/services/app/Item/Get?MaxResultCount=30000')
  Future<Response> getItemById();

  @Post(path: '/services/app/Item/Create')
  Future<Response> createItemInServer(@Body() Map<String, dynamic> body);

  @Post(path: '/services/app/Item/Update')
  Future<Response> updateItemInServer(@Body() Map<String, dynamic> body);

  @Get(path: '/services/app/ItemGroup/GetAll?MaxResultCount=30000')
  Future<Response> getAllItemGroup();

  @Get(path: '/services/app/ItemGroup/Get?MaxResultCount=30000')
  Future<Response> getItemGroup();

  @Post(path: '/services/app/ItemGroup/Create')
  Future<Response> createItemGroupInServer(@Body() Map<String, dynamic> body);

  @Post(path: '/services/app/ItemGroup/Update')
  Future<Response> updateItemGroupInServer(@Body() Map<String, dynamic> body);

  @Get(path: '/services/app/Category/GetAll?MaxResultCount=30000')
  Future<Response> getAllCategory();

  @Get(path: '/services/app/Category/Get?MaxResultCount=30000')
  Future<Response> getCategory();

  @Post(path: '/services/app/Category/Create')
  Future<Response> createCategoryInServer(@Body() Map<String, dynamic> body);

  @Post(path: '/services/app/Category/Update')
  Future<Response> updateCategoryInServer(@Body() Map<String, dynamic> body);

  @Get(path: '/services/app/PriceList/GetAll?MaxResultCount=30000')
  Future<Response> getAllPriceList();

  @Get(path: '/services/app/PricingBundle/Get?MaxResultCount=30000')
  Future<Response> getPriceList();

  @Post(path: '/services/app/PricingMaster/Create')
  Future<Response> createPriceListInServer(@Body() Map<String, dynamic> body);

  @Post(path: '/services/app/PricingMaster/Update')
  Future<Response> updatePriceListInServer(@Body() Map<String, dynamic> body);

  @Get(path: '/services/app/PricingMaster/GetAll?MaxResultCount=30000')
  Future<Response> getAllPrices();

  @Get(path: '/services/app/PricingMaster/Get')
  Future<Response> getPrice();

  @Post(path: '/services/app/PriceList/Create')
  Future<Response> createPriceInServer(@Body() Map<String, dynamic> body);

  @Post(path: '/services/app/PriceList/Update')
  Future<Response> updatePriceInServer(@Body() Map<String, dynamic> body);

  @Get(path: '/services/app/PricingRule/GetAll?MaxResultCount=30000')
  Future<Response> getAllPricingRule();

  @Get(path: '/services/app/PricingRule/Get')
  Future<Response> getPricingRule();

  @Post(path: '/services/app/PricingRule/Create')
  Future<Response> createPricingRuleInServer(@Body() Map<String, dynamic> body);

  @Post(path: '/services/app/PricingRule/Update')
  Future<Response> updatePricingRuleInServer(@Body() Map<String, dynamic> body);

  @Get(path: '/services/app/StockUOM/GetAll?MaxResultCount=30000')
  Future<Response> getAllStockUOM();

  @Get(path: '/services/app/StockUOM/Get')
  Future<Response> getStockUOM();

  @Post(path: '/services/app/StockUOM/Create')
  Future<Response> createStockUOMInServer(@Body() Map<String, dynamic> body);

  @Post(path: '/services/app/StockUOM/Update')
  Future<Response> updateStockUOMInServer(@Body() Map<String, dynamic> body);

  @Get(path: '/services/app/Uom/GetAll?MaxResultCount=30000')
  Future<Response> getAllUom();

  @Get(path: '/services/app/Uom/Get')
  Future<Response> getUom();

  @Post(path: '/services/app/Uom/Create')
  Future<Response> createUomInServer(@Body() Map<String, dynamic> body);

  @Post(path: '/services/app/Uom/Update')
  Future<Response> updateUomInServer(@Body() Map<String, dynamic> body);

  @Get(path: '/services/app/UpcCode/GetAll?MaxResultCount=30000')
  Future<Response> getAllUpcCode();

  @Get(path: '/services/app/UpcCode/Get')
  Future<Response> getUpcCode();

  @Post(path: '/services/app/UpcCode/Create')
  Future<Response> createUpcCodeInServer(@Body() Map<String, dynamic> body);

  @Post(path: '/services/app/UpcCode/Update')
  Future<Response> updateUpcCodeInServer(@Body() Map<String, dynamic> body);

  //End user Point

  @Post(path: '/{url}')
  Future<Response> sampleWithUrlAndQuery(
      @Path() String url, @Query() String page);

  @Get(path: '/get')
  Future<Response> sampleGet();

  @Post(path: '/register')
  Future<Response> register(@Body() Map<String, dynamic> body);

  @Post(path: '/logout')
  Future<Response> logout();

  static RestApiService create([ChopperClient? client]) =>
      _$RestApiService(client);
}
