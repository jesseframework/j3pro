part of 'journey_plan_bloc.dart';

abstract class JourneyPlanEvent extends Equatable {
  const JourneyPlanEvent();

  @override
  List<Object> get props => [];
}

class SyncGPSDistancEvent extends JourneyPlanEvent {
  //final double data;

  const SyncGPSDistancEvent();
}
