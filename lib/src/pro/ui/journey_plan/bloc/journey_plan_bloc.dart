import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'journey_plan_event.dart';
part 'journey_plan_state.dart';

class JourneyPlanBloc extends Bloc<JourneyPlanEvent, JourneyPlanState> {
  JourneyPlanBloc() {}

  @override
  JourneyPlanState get initialState => JourneyPlanInitial();

  @override
  Stream<JourneyPlanState> mapEventToState(
    JourneyPlanEvent event,
  ) async* {}
}
