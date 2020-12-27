part of 'journey_plan_bloc.dart';

abstract class JourneyPlanState extends Equatable {
  const JourneyPlanState();
  
  @override
  List<Object> get props => [];
}

class JourneyPlanInitial extends JourneyPlanState {}
class JourneyPlanLoad extends JourneyPlanState {}
