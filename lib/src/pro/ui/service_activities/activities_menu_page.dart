import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:j3enterprise/src/database/crud/desktop/desktop_crud.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/models/sales/fullfillment/jounery_with_address.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/add_item/bloc/add_item_bloc.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';

class ActivitiesMenuPage extends StatefulWidget {
  static final route = '/activities_menu';
  var db;
  DesktopDao desktopDao;
  JourneyWithAddress journeyWithAddress;

  ActivitiesMenuPage({this.journeyWithAddress}) {
    db = AppDatabase();
    desktopDao = DesktopDao(db);
  }

  @override
  _ActivitiesMenuPageState createState() => _ActivitiesMenuPageState();
}

class _ActivitiesMenuPageState extends State<ActivitiesMenuPage> {
  String searchText = 'Sales';
  Completer<GoogleMapController> _controller = Completer();
  bool toggleList = false;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 10.4746,
  );
  @override
  void initState() {
    addItemBloc.setOrderNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Toggle List',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Switch(
              activeColor: Colors.white,
              value: toggleList,
              onChanged: (value) {
                setState(() {
                  toggleList = value;
                });
              })
        ],
      ),
      appBar: AppBar(
        title: Text(AppLocalization.of(context)
                .translate('activities_menu_appbar_title') ??
            "Activities Menu"),
        actions: [Icon(Icons.more_vert)],
//ToDO put translation
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              height: 130,
              child: Stack(
                children: [
                  Platform.isAndroid || Platform.isIOS == true
                      ? Container(
                          child: GoogleMap(
                            zoomControlsEnabled: false,
                            mapType: MapType.normal,
                            initialCameraPosition: _kGooglePlex,
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                          ),
                          constraints: BoxConstraints.expand(),
                        )
                      : Container(
                          constraints: BoxConstraints.expand(),
                          child: Image.asset(
                            'images/road.PNG',
                            fit: BoxFit.fill,
                          )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.journeyWithAddress.jplan.companyName,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                widget.journeyWithAddress.addr.addressLine1,
                                softWrap: true,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.lightGreen,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              '876-555-5555',
                              softWrap: true,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Platform.isAndroid || Platform.isIOS == true
                      ? Positioned(
                          right: 5,
                          bottom: 5,
                          child: MaterialButton(
                              color: Colors.red.withOpacity(0.6),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.map,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Navigate',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              onPressed: () {}))
                      : Container(),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: StreamBuilder(
                      stream: widget.desktopDao.watchAllActivitiesMenu(
                          searchText, false, searchText, ""),
                      builder: (context, snapshot) {
                        print(snapshot.data.toString());
                        if (snapshot.hasData) {
                          List<DesktopData> prefData = snapshot.data;
                          return toggleList
                              ? Center(
                                  child: Wrap(
                                      direction: Axis.horizontal,
                                      alignment: WrapAlignment.start,
                                      children: [
                                        ...prefData.map((e) {
                                          return InkWell(
                                              onTap: () async {
                                                addItemBloc.setOrderNumber();
                                                Navigator.pushNamed(
                                                    context, e.navigationRoute,
                                                    arguments: widget
                                                        .journeyWithAddress);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 8),
                                                child: Container(
                                                  width: 70,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Card(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        child: Container(
                                                          width: 60,
                                                          height: 60,
                                                          color: Color(
                                                              int.parse(e
                                                                  .iconColour)),
                                                          child: Icon(
                                                              IconData(
                                                                  int.parse(e
                                                                      .iconCode),
                                                                  fontFamily: e
                                                                      .iconFamily),
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      Container(
                                                          child: Text(
                                                        e.iconName,
                                                        textAlign:
                                                            TextAlign.center,
                                                        softWrap: true,
                                                      ))
                                                    ],
                                                  ),
                                                ),
                                              ));
                                        }),
                                      ]),
                                )
                              : ListView.separated(
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            prefData[index].navigationRoute,
                                            arguments:
                                                widget.journeyWithAddress);
                                      },
                                      child: ListTile(
                                        leading: Icon(
                                          IconData(
                                              int.parse(
                                                  prefData[index].iconCode),
                                              fontFamily:
                                                  prefData[index].iconFamily),
                                          color: Color(int.parse(
                                              prefData[index].iconColour)),
                                        ),
                                        title: Text(prefData[index].iconName),
                                      ),
                                    );
                                  },
                                  itemCount: prefData.length,
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      thickness: 0.5,
                                      color: Colors.grey,
                                    );
                                  },
                                );
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
                ),
              ),
            )
          ]),
    );
  }
}
