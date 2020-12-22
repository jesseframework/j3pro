import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'activities_menu_event.dart';
part 'activities_menu_state.dart';

class ActivitiesMenuBloc extends Bloc<ActivitiesMenuEvent, ActivitiesMenuState> {
  ActivitiesMenuBloc();

  @override
  ActivitiesMenuState get initialState => ActivitiesMenuInitial();

  @override
  Stream<ActivitiesMenuState> mapEventToState(
    ActivitiesMenuEvent event,
  ) async* {}
}
