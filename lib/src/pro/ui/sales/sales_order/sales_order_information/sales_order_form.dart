import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/account/currency/currency_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/account/exchange_rate/exchange_rate.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/address_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/customer_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_header_crud.dart';
import 'package:j3enterprise/src/pro/models/customer/address_model.dart';
import 'package:j3enterprise/src/pro/models/sales/fullfillment/jounery_with_address.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/add_item/bloc/add_item_bloc.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/add_item/sales_order_add_item_page.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/sales_order_information/bloc/sales_oder_bloc.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/navigation_style.dart';
import 'package:j3enterprise/src/resources/shared/widgets/circuler_indicator.dart';
import 'package:j3enterprise/src/resources/shared/widgets/dialog.dart';

class SalesOrderForm extends StatefulWidget {
  List<Addres> address;
  String defaultCurrency;
  double exchangeRate;
  List<SystemCurrencyData> currenciesData;

  var db;

  AddressDao addressDao;
  CustomerDao customerDao;
  SystemCurrencyDao systemCurrencyDao;
  ExchangeRateDao exchangeRateDao;
  SalesOrderHeaderDao salesOrderHeaderDao;
  SalesOrderForm(
      {this.defaultCurrency,
      this.currenciesData,
      this.exchangeRate,
      this.address}) {
    db = AppDatabase();
    addressDao = AddressDao(db);
    customerDao = CustomerDao(db);
    salesOrderHeaderDao = SalesOrderHeaderDao(db);
    systemCurrencyDao = SystemCurrencyDao(db);
    exchangeRateDao = ExchangeRateDao(db);
  }
  @override
  _SalesOrderFormState createState() => _SalesOrderFormState();
}

class _SalesOrderFormState extends State<SalesOrderForm> {
  TextEditingController _textFieldController = TextEditingController();
  JourneyWithAddress journeyWithAddress;
  Addres primaryAddress;

  String poNumber = '';
  double exchangeRate;
  String percentageAmount = '';
  String defaultAmount;
  String swipeDiscountTpye = 'Percentage';
  String defaultCurrency = 'JMD';
  String deliveryInstructions = '';
  List<SystemCurrencyData> defaultCurrencyList = [];
  DateTime dateTime = DateTime.now();
  @override
  void initState() {
    exchangeRate = widget.exchangeRate;
    defaultCurrency = widget.defaultCurrency;
    defaultCurrencyList = widget.currenciesData;
    if (widget.address.isNotEmpty) {
      widget.address.forEach((element) {
        if (element.isPrimaryAddress == true) {
          primaryAddress = element;
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // journeyWithAddress = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalization.of(context)
                  .translate('sales_order_information_appbar_title') ??
              'Sales Order Information'),
          actions: [
            InkWell(
              onTap: () {
                BlocProvider.of<SalesOderBloc>(context)
                    .add(CreateSalesOrderHeader(
                  currencyCode: defaultCurrency,
                  exchangeRate: exchangeRate,
                  orderType: swipeDiscountTpye,
                  deliveryDate: dateTime,
                  transactionType: 'Sales Order',
                  customerId: addItemBloc.customerId,
                  transactionStatus: 'InProgress',
                ));
                Navigator.push(context,
                    EnterExitRoute(enterPage: SalesOrderAddItemPage()));
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
          child: Column(
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
                            selectedItem: widget.address.isEmpty
                                ? 'No address found '
                                : primaryAddress.addressLine1,
                            showSearchBox: true,
                            items:widget.address.isEmpty
                                ? null
                                : widget.address.map((e) => e.addressLine1).toList(),
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
                                onPressed: () {},
                                backgroundColor: Theme.of(context).accentColor,
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
                        mode: Mode.MENU,
                        showSearchBox: true,
                        label: 'Contact',
                        selectedItem: widget.address.isEmpty
                            ? 'No Contact Found'
                            : widget.address[0].phoneNumber,

                        items:widget.address.isEmpty
                            ? null
                            : widget.address
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
                        searchBoxDecoration: InputDecoration(
                            suffix: Container(
                          height: 30,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: Theme.of(context).accentColor,
                            child: Icon(Icons.add),
                          ),
                        )),
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
                        searchBoxDecoration: InputDecoration(
                            suffix: Container(
                          height: 30,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: Theme.of(context).accentColor,
                            child: Icon(Icons.add),
                          ),
                        )),
                        // autofocus: true,
                        // backgroundColor: Theme.of(context).cardColor,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      buildSalesOrderCardTile(
                          heading: 'PO Number',
                          title: poNumber,
                          trailingWidget: Icon(Icons.edit),
                          callback: (value) {
                            setState(() {
                              poNumber = value;
                            });
                          }),
                      SizedBox(
                        height: 15,
                      ),
                      buildSalesOrderCardTile(
                          heading: 'Delivery Date',
                          title:
                              '${dateTime.year}-${dateTime.month}-${dateTime.day}',
                          trailingWidget: InkWell(
                            child: Icon(Icons.date_range),
                            onTap: () async {
                              DateTime result = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1970),
                                  lastDate: DateTime(2100));

                              setState(() {
                                dateTime = result;
                              });
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropdownSearch(
                                    mode: Mode.MENU,

                                    label: "Currency",
                                    selectedItem: defaultCurrency,

                                    items: defaultCurrencyList
                                        .map((e) => e.currencyName)
                                        .toList(),
                                    onChanged: (value) async {
                                      List<ExchangeRateData> exchangeRateData =
                                          await widget.exchangeRateDao
                                              .getAllExchnageRateByCurrency(
                                                  'JMD', value);
                                      setState(() {
                                        defaultCurrency = value;
                                        exchangeRate =
                                            exchangeRateData[0].exchangeRate;
                                      });
                                    },
                                    searchBoxDecoration: InputDecoration(
                                        suffix: Container(
                                      height: 30,
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        backgroundColor:
                                            Theme.of(context).accentColor,
                                        child: Icon(Icons.add),
                                      ),
                                    )),
                                    // autofocus: true,
                                    // backgroundColor: Theme.of(context).cardColor,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: buildSalesOrderCardTile(
                                        heading: 'Exchange Rate',
                                        formatter: true,
                                        title: exchangeRate.toString(),
                                        trailingWidget: Icon(Icons.edit),
                                        callback: (value) {
                                          setState(() {
                                            exchangeRate = double.parse(value);
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropdownSearch(
                                    mode: Mode.MENU,

                                    label: "Discount Type",
                                    selectedItem: swipeDiscountTpye,

                                    items: [
                                      'Percentage',
                                      'Amount',
                                    ],
                                    onChanged: (value) async {
                                      setState(() {
                                        swipeDiscountTpye = value;
                                      });
                                    },
                                    searchBoxDecoration: InputDecoration(
                                        suffix: Container(
                                      height: 30,
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        backgroundColor:
                                            Theme.of(context).accentColor,
                                        child: Icon(Icons.add),
                                      ),
                                    )),
                                    // autofocus: true,
                                    // backgroundColor: Theme.of(context).cardColor,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: buildSalesOrderCardTile(
                                        heading: swipeDiscountTpye,
                                        formatter: true,
                                        title: percentageAmount,
                                        trailingWidget: Icon(Icons.edit),
                                        callback: (value) {
                                          setState(() {
                                            percentageAmount = value;
                                          });
                                        }),
                                  ),
                                ],
                              ),
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
                        child: buildSalesOrderCardTile(
                            heading: 'Delivery Instructions',
                            title: deliveryInstructions,
                            trailingWidget: Icon(Icons.edit),
                            callback: (value) {
                              setState(() {
                                deliveryInstructions = value;
                              });
                            }),
                      )
//
                      )),
            ],
          ),
        ));
  }

  Widget buildSalesOrderCardTile(
      {String heading,
      String title,
      bool formatter = false,
      Widget trailingWidget,
      Function callback}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.grey, fontSize: 12),
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
                  doubleOnly: formatter,
                  callBack: (value) => callback(value),
                  title: heading,
                  textcontroller: TextEditingController(
                    text: title,
                  ),
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
              fontWeight: FontWeight.w600, color: Colors.grey, fontSize: 12),
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
