import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/address_crud.dart';
import 'package:j3enterprise/src/pro/models/sales/fullfillment/jounery_with_address.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/seles_order_item_page.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/navigation_style.dart';
import 'package:j3enterprise/src/resources/shared/widgets/circuler_indicator.dart';
import 'package:j3enterprise/src/resources/shared/widgets/dialog.dart';

class SalesOrderPage extends StatefulWidget {
  static final route = '/SalesOrderPage';
  var db;

  AddressDao addressDao;

  SalesOrderPage() {
    db = AppDatabase();
    addressDao = AddressDao(db);
  }
  @override
  _SalesOrderPageState createState() => _SalesOrderPageState();
}

class _SalesOrderPageState extends State<SalesOrderPage> {
  TextEditingController _textFieldController = TextEditingController();
  JourneyWithAddress journeyWithAddress;
  Addres primaryAddress;
  @override
  Widget build(BuildContext context) {
    journeyWithAddress = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalization.of(context).translate('sales_order_information_appbar_title') ??
            'Sales Order Information'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, EnterExitRoute(enterPage: SalesOrderItemPage()));
            },
            child: Row(
              children: [
                Text(
                  "Next",
                  style: TextStyle(fontSize: 20),
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      //ToDO put translation
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: widget.addressDao.watchAllAddressByTitle(
                customerId: journeyWithAddress.jplan.customerId,
                addressType: 'Shipping',
                isDisable: false),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Addres> addres = snapshot.data;
                addres.forEach((element) {
                  if (element.isPrimaryAddress == true) {
                    primaryAddress = element;
                  }
                });
                return Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 4.0,
                      //  height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DropdownSearch(
                                  mode: Mode.MENU,
                                  // backgroundColor: Theme.of(context).cardColor,
                                  // labelStyle: TextStyle(
                                  //     fontWeight: FontWeight.w600,
                                  //     color:
                                  //         Theme.of(context).textSelectionColor,
                                  //     fontSize: 12),
                                  label: "Shipping Address",
                                  selectedItem: primaryAddress.addressLine1,
                                  showSearchBox: true,
                                  items: addres
                                      .map((e) => e.addressLine1)
                                      .toList(),
                                  onChanged: (value) async {
                                    // await widget
                                    //     .businessRuleDao
                                    //     .updateBussinessRule(
                                    //     businessRuleData
                                    //         .copyWith(
                                    //         value:
                                    //         value));
                                  },
                                  // autofocus: true,
                                  searchBoxDecoration: InputDecoration(
                                      suffix: Container(
                                    height: 30,
                                    child: FloatingActionButton(
                                      backgroundColor:
                                          Theme.of(context).accentColor,
                                      child: Icon(Icons.add),
                                    ),
                                  )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            DropdownSearch(


                              label: 'Contact',
                              selectedItem: addres[0].phoneNumber,
                              showSearchBox: false,
                              items: addres
                                  .map((e) =>
                                      e.contactPerson + ' ' + e.phoneNumber)
                                  .toList(),
                              onChanged: (value) async {
                                // await widget
                                //     .businessRuleDao
                                //     .updateBussinessRule(
                                //     businessRuleData
                                //         .copyWith(
                                //         value:
                                //         value));
                              },
                              // autofocus: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 4.0,
                      //  height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropdownSearch(
                              mode: Mode.MENU,
                              // labelStyle: TextStyle(
                              //     color: Theme.of(context).textSelectionColor,
                              //     fontWeight: FontWeight.w600,
                              //     fontSize: 12),
                              label: "Order Type",
                              selectedItem: 'Standard Order',
                              showSearchBox: false,
                              items: [
                                'Standard Order',
                                'Contract',
                                'Cash Sales',
                                'Rush Order',
                                'Free of Charge Delivery',
                                'Returns',
                                'Consignment Order',
                                'Credit Memo Request',
                                'Debit Memo Request',
                                'Pick Up Order',
                                'Ullage Order ',
                              ],
                              onChanged: (value) async {
                                // await widget
                                //     .businessRuleDao
                                //     .updateBussinessRule(
                                //     businessRuleData
                                //         .copyWith(
                                //         value:
                                //         value));
                              },
                              // autofocus: true,
                              // backgroundColor: Theme.of(context).cardColor,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            buildSalesOrderCardTile(
                                heading: 'PO Number',
                                title: 'HJK-00001',
                                trailingWidget: Icon(Icons.edit),
                                callback: () {}),
                            SizedBox(
                              height: 15,
                            ),
                            buildSalesOrderCardTile(
                                heading: 'Delivery Date',
                                title: '14-7-2020',
                                trailingWidget: InkWell(
                                  child: Icon(Icons.date_range),
                                  onTap: () async {
                                    var result = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1970),
                                        lastDate: DateTime(2100));

                                    setState(() {});
                                  },
                                ),
                                callback: (value) {
                                  print(value);
                                }),
                          ],
                        ),
                      ),
                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        elevation: 4.0,
                        //  height: 150,
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      buildSalesOrderCardRowTile(
                                          heading: 'Currency',
                                          title: 'JMD',
                                          trailingWidget:
                                              Icon(Icons.arrow_drop_down),
                                          callback: () {}),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      buildSalesOrderCardRowTile(
                                          heading: 'Discount Type',
                                          title: 'Percentage',
                                          trailingWidget:
                                              Icon(Icons.arrow_drop_down),
                                          callback: () {}),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      buildSalesOrderCardRowTile(
                                        heading: 'Exchange Rate',
                                        title: '1.00',
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      buildSalesOrderCardRowTile(
                                        heading: 'Amount',
                                        title: '5%',
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
//
                            )),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        elevation: 4.0,
                        //  height: 150,
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildSalesOrderCardTile(
                                    heading: 'Delivery Instructions',
                                    title:
                                        'Sales are final. No refund or exchange within 24 hours.',
                                  ),
                                ],
                              ),
                            )
//
                            )),
                  ],
                );
              }
              return BuildProgressIndicator();
            }),
      ),
    );
  }

  Widget buildSalesOrderCardTile(
      {String heading,
      String title,
      Widget trailingWidget,
      Function callback}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              fontSize: 12),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            InkWell(
              child: Container(
                  margin: EdgeInsets.only(left: 8), child: trailingWidget),
              onTap: () {
                displayDialog(
                  context: context,
                  callBack: (value) => callback(value),
                  title: heading,
                  textcontroller: TextEditingController(text: title),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSalesOrderCardRowTile(
      {String heading,
      String title,
      Widget trailingWidget,
      Function callback}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              fontSize: 12),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            InkWell(
                child: Container(
                    margin: EdgeInsets.only(left: 8), child: trailingWidget),
                onTap: callback),
          ],
        ),
      ],
    );
  }
}
