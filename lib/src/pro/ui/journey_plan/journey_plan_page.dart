import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j3enterprise/src/pro/ui/journey_plan/bloc/journey_plan_bloc.dart';
import 'package:j3enterprise/src/pro/ui/journey_plan/journey_plan_form.dart';

class JourneyPlanPage extends StatefulWidget {
   static final route = '/journey_plan_page';
  JourneyPlanPage();

  @override
  _JourneyPlanPageState createState() => _JourneyPlanPageState();
}

class _JourneyPlanPageState extends State<JourneyPlanPage> {
  @override
   Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return JourneyPlanBloc();
      },
      child: Scaffold(
        body: JourneyPlanForm(),
      ),
    );
  }
}
