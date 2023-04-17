import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:j3enterprise/src/pro/utils/gps_location.dart';
import 'package:meta/meta.dart';

part 'journey_plan_event.dart';
part 'journey_plan_state.dart';

class JourneyPlanBloc extends Bloc<JourneyPlanEvent, JourneyPlanState> {
  late GeoLocation geolocation;
  JourneyPlanBloc() : super(JourneyPlanInitial()) {
    geolocation = new GeoLocation();
    on<SyncGPSDistancEvent>((event, emit) => _mapSyncGPSDistancEventToState(event, emit));
  }

  void getInitialLocation() {
    print("Intial location called");
    add(SyncGPSDistancEvent());
  }

  @override
  JourneyPlanState get initialState => JourneyPlanInitial();


 
  
  _mapSyncGPSDistancEventToState(SyncGPSDistancEvent event, Emitter<JourneyPlanState> emit) async{
      print("I am getting here");
    await geolocation.getUserLocation();
    await geolocation.getDistance("");
  }
}
