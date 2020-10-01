import 'package:flutter/material.dart';
import 'package:j3enterprise/main.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/fullfillment/journey_plan_crud.dart';
import 'package:j3enterprise/src/pro/ui/service_activities/activities_menu_page.dart';
import 'package:j3enterprise/src/resources/repositories/user_repository.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/navigation_style.dart';
import 'package:j3enterprise/src/resources/shared/widgets/circuler_indicator.dart';
import 'package:j3enterprise/src/resources/shared/widgets/search_bar.dart';

class ServiceActivitiesPage extends StatefulWidget {
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
                    child: ListFilter(
                        placeholder: 'Search', onFilterChanged: (search) {}),
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
              stream: widget.journeyPlanDao.watchAllJourneyPlanByUser('admin'),
              //  future: widget.journeyPlanDao.getAllJourneyPlanData(),
              builder: (context, snapshot) {
                print(snapshot.data.toString());
                if (snapshot.hasData) {
                  print(snapshot.data.toString());
                  if (snapshot.hasData) {
                    List<JourneyPlanData> journeyPlanData =
                        List<JourneyPlanData>();
                    journeyPlanData = snapshot.data;

                    if (journeyPlanData.isEmpty) {
                      return Text("Empty List");
                    }
                    return Expanded(
                      child: ListView.separated(
                        itemCount: journeyPlanData.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  EnterExitRoute(
                                      enterPage: ActivitiesMenuPage(
                                    journeyPlanData: journeyPlanData[index],
                                  )));
                            },
                            child: Container(
                              color: Theme.of(context).cardColor,
                              child: ListTile(
                                leading: Icon(
                                  Icons.image,
                                  size: 30,
                                ),
                                title: Text(journeyPlanData[index].companyName,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                                subtitle: Text(
                                  journeyPlanData[index].billingAddressName,
                                ),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.grey,
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
