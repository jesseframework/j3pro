import 'package:flutter/material.dart';
import 'package:j3enterprise/main.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/fullfillment/journey_plan_crud.dart';
import 'package:j3enterprise/src/pro/models/sales/fullfillment/jounery_with_address.dart';
import 'package:j3enterprise/src/pro/ui/service_activities/activities_menu_page.dart';
import 'package:j3enterprise/src/resources/repositories/user_repository.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/navigation_style.dart';
import 'package:j3enterprise/src/resources/shared/widgets/circuler_indicator.dart';
import 'package:j3enterprise/src/resources/shared/widgets/search_bar.dart';

class ServiceActivitiesPage extends StatefulWidget {
  static final route = '/servies_activites';
  var db;
  JourneyPlanDao journeyPlanDao;
  ServiceActivitiesPage() {
    db = AppDatabase();
    journeyPlanDao = JourneyPlanDao(db);
  }
  @override
  _ServiceActivitiesPageState createState() => _ServiceActivitiesPageState();
}

class _ServiceActivitiesPageState extends State<ServiceActivitiesPage> {
  String userName;
  @override
  void didChangeDependencies() async {
    await getIt<UserRepository>().getUserSharedPref().then((value) {
      setState(() {
        userName = value['userName'];
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalization.of(context)
                  .translate('service_activities_appbar_title') ??
              "Service Activities"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 35,
                      child: ListFilter(
                          placeholder: 'Search', onFilterChanged: (search) {}),
                    ),
                  ),
                ],
              ),
            ),
            ExpansionTile(
              title: Text(
                "Dashboard",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
              children: [
                ListTile(
                  leading: Icon(
                    Icons.file_upload,
                    color: Colors.deepPurple,
                  ),
                  title: Text('In Progress'),
                  trailing: Container(
                    height: 30,
                    width: 90,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text('1'),
                        color: Colors.deepPurple,
                        onPressed: () {}),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.done_all,
                    color: Colors.greenAccent,
                  ),
                  title: Text('Complete'),
                  trailing: Container(
                    height: 30,
                    width: 90,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text('1'),
                        color: Colors.green,
                        onPressed: () {}),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.warning_rounded,
                    color: Colors.amber,
                  ),
                  title: Text('In Progress'),
                  trailing: Container(
                    height: 30,
                    width: 90,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text('1'),
                        color: Colors.amber,
                        onPressed: () {}),
                  ),
                )
              ],
            ),
            StreamBuilder(
              stream:
                  widget.journeyPlanDao.watchJourneyWithAddressJoin('username'),
              //  future: widget.journeyPlanDao.getAllJourneyPlanData(),
              builder: (context, snapshot) {
                print(snapshot.data.toString());
                if (snapshot.hasData) {
                  print(snapshot.data.toString());
                  if (snapshot.hasData) {
                    List<JourneyWithAddress> journeyWithAddressData =
                        List<JourneyWithAddress>();
                    journeyWithAddressData = snapshot.data;

                    if (journeyWithAddressData.isEmpty) {
                      return Text("Empty List");
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: journeyWithAddressData.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  EnterExitRoute(
                                      enterPage: ActivitiesMenuPage(
                                    journeyWithAddress:
                                        journeyWithAddressData[index],
                                  )));
                            },
                            child: Container(
                              color: Theme.of(context).cardColor,
                              child: ListTile(
                                leading: Icon(
                                  Icons.image,
                                  size: 30,
                                ),
                                subtitle: Text(
                                  journeyWithAddressData[index]
                                      .addr
                                      .addressLine1,
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        journeyWithAddressData[index]
                                            .jplan
                                            .companyName,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700)),
                                    Text(
                                      journeyWithAddressData[index]
                                          .jplan
                                          .customerId,
                                    ),
                                  ],
                                ),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
                return BuildProgressIndicator();
              },
            )
          ],
        ));
  }
}
