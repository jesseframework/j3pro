import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:j3enterprise/src/pro/utils/gps_location.dart';
import 'package:meta/meta.dart';

part 'journey_plan_event.dart';
part 'journey_plan_state.dart';

class JourneyPlanBloc extends Bloc<JourneyPlanEvent, JourneyPlanState> {
  GeoLocation geolocation;
  JourneyPlanBloc() {
    geolocation = new GeoLocation();
  }

  void getInitialLocation() {
    print("Intial location called");
    add(SyncGPSDistancEvent());
  }

  @override
  JourneyPlanState get initialState => JourneyPlanInitial();

  @override
  Stream<JourneyPlanState> mapEventToState(
    JourneyPlanEvent event,
  ) async* {
    if (event is SyncGPSDistancEvent) {
      // print("I am getting here");
      // await geolocation.getUserLocation();
      // await geolocation.getDistance("");
    }
  }
}
