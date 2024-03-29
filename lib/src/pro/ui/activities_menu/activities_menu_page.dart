import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j3enterprise/src/pro/models/sales/fullfillment/jounery_with_address.dart';
import 'package:j3enterprise/src/pro/ui/activities_menu/activities_menu_form.dart';
import 'package:j3enterprise/src/pro/ui/activities_menu/bloc/activities_menu_bloc.dart';

// ignore: must_be_immutable
class ActivitiesMenuPage extends StatefulWidget {
 
  JourneyWithAddress journeyWithAddress;

  ActivitiesMenuPage({required this.journeyWithAddress});

  @override
  _ActivitiesMenuPageState createState() => _ActivitiesMenuPageState();
}

class _ActivitiesMenuPageState extends State<ActivitiesMenuPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ActivitiesMenuBloc();
      },
      child: Scaffold(
        body: ActivitiesMenuForm(journeyWithAddress: widget.journeyWithAddress),
      ),
    );
  }
}
