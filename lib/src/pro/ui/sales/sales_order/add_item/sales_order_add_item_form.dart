import 'dart:io';

import 'package:badges/badges.dart';
import 'package:barcode_keyboard_listener/barcode_keyboard_listener.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_master_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';
import 'package:j3enterprise/src/pro/models/items/ItemsWithPrices.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/add_item/bloc/add_item_bloc.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/sales_order_checkout_page.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/sales_order_item_detail_page.dart';
import 'package:j3enterprise/src/pro/utils/show_flushbar.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/navigation_style.dart';
import 'package:j3enterprise/src/resources/shared/widgets/circuler_indicator.dart';
import 'package:j3enterprise/src/resources/shared/widgets/search_bar.dart';

class SalesOrderAddItemForm extends StatefulWidget {
  var db;

  ItemsDao itemsDao;
  SalesOrderDetailTempDao salesOrderDetailTempDao;

  SalesOrderAddItemForm() {
    db = AppDatabase();
    itemsDao = ItemsDao(db);
    salesOrderDetailTempDao = SalesOrderDetailTempDao(db);
  }

  @override
  _SalesOrderAddItemFormState createState() => _SalesOrderAddItemFormState();
}

class _SalesOrderAddItemFormState extends State<SalesOrderAddItemForm> {
  TextEditingController _qtyController = TextEditingController(text: '1');
  List<ItemsWithPrices> itemsWithPrices = List<ItemsWithPrices>();
  ScrollController _controller;
  List<ItemsWithPrices> pageData = List<ItemsWithPrices>();
  String searchText = '';
  bool searchFoused = false;
  int itemCount = 0;
  bool toggleList = true;
  bool _hasMore = true;
  BarcodeListener _barcodeListener;
  final _tecScanKeyCode = TextEditingController();
  int _scanButtonKeyCode;
  String _scanResult = '';
  String number;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    number = addItemBloc.tempSalesOrderNo;
    super.initState();
    _barcodeListener = BarcodeListener(null, null, _onKeyPress);
  }

  void _onScan(String barcode) async {
    setState(() {
      _scanResult = barcode;
      searchText = _scanResult;
    });
  }

  void _onKeyPress(int keyCode) async {
    setState(() {
      _tecScanKeyCode.text = keyCode.toString();
    });
  }

  void _setScanButtonKeyCode() {
    setState(() {
      if (_barcodeListener != null) {
        _barcodeListener.dispose();
        _barcodeListener = null;
      }

      _scanButtonKeyCode = int.parse(_tecScanKeyCode.text);
      _barcodeListener =
          BarcodeListener(_onScan, _scanButtonKeyCode, _onKeyPress);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _additemForm();
  }

  Widget _additemForm() {
    final widgetList = List<Widget>();
    widgetList.addAll([
      Text(
          'Press the scan button, its code will appear in the text field below'),
      TextField(
        controller: _tecScanKeyCode,
        decoration: InputDecoration(
            suffix: IconButton(
                icon: Icon(Icons.check), onPressed: _setScanButtonKeyCode)),
      )
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context)
                .translate('new_ales_order_detail_appbar_title') ??
            "New Sales Order Detail"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, SizeRoute(page: SalesOrderCheckOutPage()));
            },
            child: Row(
              children: [
                Text(
                  "Checkout",
                  style: TextStyle(fontSize: 20),
                ),
                StreamBuilder(
                    stream: widget.salesOrderDetailTempDao
                        .transactionTotal(number, 'Pending'),
                    builder: (context, snapshot) {
                      print(number);
                      if (snapshot.connectionState == ConnectionState.active) {
                        List<SalesOrderDetailTempData> totalData =
                            snapshot.data;
                        if (totalData.isNotEmpty) {
                          return Badge(
                              badgeContent:
                                  Text(totalData[0].itemCount.toString()),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                child: Icon(Icons.shopping_cart),
                              ));
                        } else {
                          return Badge(
                              badgeContent: Text(itemCount.toString()),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 4),
                                child: Icon(Icons.shopping_cart),
                              ));
                        }
                      }
                      return Badge(
                          badgeContent: Text(itemCount.toString()),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            child: Icon(Icons.shopping_cart),
                          ));
                    }),
                SizedBox(
                  width: 5,
                )
              ],
            ),
          ),
          Icon(Icons.more_vert),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(5)),
                        alignment: Alignment.center,
                        width: 65,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlignVertical: TextAlignVertical.center,
                          controller: _qtyController,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.only(
                              bottom: 25 / 2, // HERE THE IMPORTANT PART
                            ),
                            border: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: new BorderSide(color: Colors.teal)),
                          ),
                        )),
                  ),
                  Expanded(
                    child: Container(
                      child: ListFilter(
                        placeholder: 'Search',
                        onFilterChanged: (search) {
                          setState(() {
                            searchText = search;
                          });
                        },
                        function: (value) {
                          setState(() {
                            if (searchFoused != value) {
                              searchFoused = value;
                            }
                            print(searchFoused);
                          });
                        },
                      ),
                    ),
                  ),
                  searchFoused
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Container(
                            width: 80,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.5,
                                    color: Theme.of(context).iconTheme.color),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        toggleList = false;
                                      });
                                    },
                                    child: Container(
                                      color: toggleList == true
                                          ? Theme.of(context)
                                              .scaffoldBackgroundColor
                                          : Theme.of(context).primaryColorLight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              height: 1.5,
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color,
                                            ),
                                            Container(
                                              height: 1.5,
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color,
                                            ),
                                            Container(
                                              height: 1.5,
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        toggleList = true;
                                      });
                                    },
                                    child: Container(
                                      color: toggleList == true
                                          ? Theme.of(context).primaryColorLight
                                          : Theme.of(context)
                                              .scaffoldBackgroundColor,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7, vertical: 4),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Theme.of(
                                                                    context)
                                                                .iconTheme
                                                                .color,
                                                            width: 1.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2)),
                                                  ),
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Theme.of(
                                                                    context)
                                                                .iconTheme
                                                                .color,
                                                            width: 1.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Theme.of(
                                                                    context)
                                                                .iconTheme
                                                                .color,
                                                            width: 1.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2)),
                                                  ),
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Theme.of(
                                                                    context)
                                                                .iconTheme
                                                                .color,
                                                            width: 1.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2)),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: InkWell(
                      child: Container(
                          width: 60, child: Image.asset('images/bar_code.png')),
                      onTap: () async {
                        if (Platform.isAndroid || Platform.isIOS) {
                          String barcodeScanRes =
                              await FlutterBarcodeScanner.scanBarcode(
                                  "#ff6666", "Cancel", false, ScanMode.DEFAULT);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child:
                  searchFoused == true ? buildSearchScreeen() : buildItemList(),
              transitionBuilder: (widget, animation) => ScaleTransition(
                scale: animation,
                child: widget,
              ),
            ),
          ),
          buildBottomSheet()
        ],
      ),
    );
  }

  buildBottomSheet() {
    return StreamBuilder(
      stream:
          widget.salesOrderDetailTempDao.transactionTotal(number, 'Pending'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<SalesOrderDetailTempData> totalData = snapshot.data;
          // setState(() {
          //   itemCount=totalData[0].itemCount.toInt();
          // });

          return Container(
            color: Theme.of(context).cardColor,
            child: ExpansionTile(
                title: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Grand Total:",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        totalData.isNotEmpty
                            ? '\$ ${totalData[0].grandTotal.toString()}'
                            : '\$0',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                children: [
                  buildGrandTotalListTile(
                      'Subtotal:',
                      totalData.isNotEmpty
                          ? '\$ ${totalData[0].subTotal.toString()}'
                          : '\$0'),
                  buildGrandTotalListTile(
                      'Deposit:',
                      totalData.isNotEmpty
                          ? '\$ ${totalData[0].depositTotal.toString()}'
                          : '\$0'),
                  buildGrandTotalListTile(
                      'Discount:',
                      totalData.isNotEmpty
                          ? '\$ ${totalData[0].lineDiscountTotal.toString()}'
                          : '\$0'),
                  buildGrandTotalListTile(
                      'Shipping:',
                      totalData.isNotEmpty
                          ? '\$ ${totalData[0].shippingTotal.toString()}'
                          : '\$0'),
                  buildGrandTotalListTile(
                      'Tax:',
                      totalData.isNotEmpty
                          ? '\$ ${totalData[0].taxTotal.toString()}'
                          : '\$0'),
                  buildGrandTotalListTile(
                      'Item Count:',
                      totalData.isNotEmpty
                          ? '\$ ${totalData[0].itemCount.toString()}'
                          : '\$0'),
                  buildGrandTotalListTile(
                      'Grand Total:',
                      totalData.isNotEmpty
                          ? '\$ ${totalData[0].grandTotal.toString()}'
                          : '\$0'),
                ]),
          );
        }
        return BuildProgressIndicator();
      },
    );
  }

  buildSearchScreeen() {
    return StreamBuilder(
      stream: widget.itemsDao.watchItemsWithPricesJoin(searchText, false),
      builder: (context, snapshot) {
        print(snapshot.hasData);
        if (snapshot.hasData) {
          itemsWithPrices = snapshot.data;
          return toggleList
              ? Center(
                  child: SingleChildScrollView(
                    controller: _controller,
                    child: Center(
                      child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          children: List.generate(
                              _hasMore &&
                                      pageData.length < itemsWithPrices.length
                                  ? pageData.length + 1
                                  : pageData.length,
                              (index) => index >= pageData.length
                                  ? circularbar()
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 250,
                                        width: 170,
                                        child: Card(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Hero(
                                                transitionOnUserGestures: true,
                                                tag: 'mask${index}',
                                                child: Container(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'images/mask.png')),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  height: 84,
                                                  width: 84,
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  itemsWithPrices[index]
                                                      .item
                                                      .itemName,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                itemsWithPrices[index]
                                                    .item
                                                    .itemCode,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                "IN STOCK: 18",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.green),
                                              ),
                                              Text(
                                                '${itemsWithPrices[index].price.itemPrice.toString()}\$',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Divider(
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  try {
                                                    BlocProvider.of<
                                                                AddItemBloc>(
                                                            context)
                                                        .add(AddItemButtonPress(
                                                            searchText:
                                                                searchText,
                                                            itemNumber:
                                                                itemsWithPrices[
                                                                        index]
                                                                    .item
                                                                    .itemId,
                                                            setQty:
                                                                double.parse(
                                                              _qtyController
                                                                  .text
                                                                  .toString(),
                                                            )));
                                                    showSnackBar(
                                                      context: context,
                                                      value:
                                                          "${itemsWithPrices[index].item.itemName} is saved",
                                                    );
                                                  } catch (e) {
                                                    showSnackBar(
                                                        context: context,
                                                        value:
                                                            "Item is not saved please try again");
                                                  }
                                                },
                                                child: Text(
                                                  "Add",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.green),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))),
                    ),
                  ),
                )
              : ListView.builder(
                  key: UniqueKey(),
                  itemCount: itemsWithPrices.length,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      title: Container(
                        color: (index % 2 == 0)
                            ? Theme.of(context).primaryColor.withOpacity(0.1)
                            : Theme.of(context).cardColor.withOpacity(0.1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Flexible(
                              child: Text(
                                itemsWithPrices[index].item.itemName,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            leading: Hero(
                              transitionOnUserGestures: true,
                              tag: 'mask$index',
                              child: Container(
                                alignment: Alignment.topCenter,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('images/mask.png')),
                                    borderRadius: BorderRadius.circular(5)),
                                height: 84,
                                width: 84,
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    itemsWithPrices[index].item.itemCode,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Flexible(
                                    child: Text(
                                  '${itemsWithPrices[index].item.itemGroup}\n${itemsWithPrices[index].item.category}',
                                  overflow: TextOverflow.ellipsis,
                                )),
                                Column(
                                  children: [
                                    Text(
                                      '${itemsWithPrices[index].price.itemPrice.toString()}\$',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(itemsWithPrices[index].item.uom),
                                  ],
                                ),
                                Container()
                              ],
                            ),
                            trailing: ClipOval(
                              child: Material(
                                color: Colors.green, // button color
                                child: InkWell(
                                  splashColor: Theme.of(context)
                                      .primaryColor, // inkwell color
                                  child: SizedBox(
                                      width: 35,
                                      height: 35,
                                      child: Icon(Icons.add)),
                                  onTap: () {
                                    try {
                                      BlocProvider.of<AddItemBloc>(context).add(
                                          AddItemButtonPress(
                                              searchText: searchText,
                                              itemNumber: itemsWithPrices[index]
                                                  .item
                                                  .itemCode,
                                              setQty: double.parse(
                                                _qtyController.text.toString(),
                                              )));
                                      showSnackBar(
                                        context: context,
                                        value:
                                            "${itemsWithPrices[index].item.itemName} is saved",
                                      );
                                    } catch (e) {
                                      showSnackBar(
                                          context: context,
                                          value:
                                              "Item is not saved please try again");
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Container(
                            color: (index % 2 == 0)
                                ? Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1)
                                : Theme.of(context).cardColor.withOpacity(0.1),
                            //  height: 150,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Covid-19 N95 Face Masks",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "ITEM-0001",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [Text('Each'), Text('1')],
                                        ),
                                        Column(
                                          children: [
                                            Text('Books'),
                                            Text('Studies')
                                          ],
                                        ),
                                        Text('1000.00')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
        }
        return BuildProgressIndicator();
      },
    );
  }

  buildItemList() {
    return StreamBuilder(
      stream: widget.salesOrderDetailTempDao
          .watchAllSalesOrderDetail(number, 'Pending'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<SalesOrderDetailTempData> salesOrderDetailTempData =
              snapshot.data;
          return ListView.builder(
            itemCount: salesOrderDetailTempData.length,
            key: UniqueKey(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      ScaleRoute(
                          page: SalesOrderItemDetailPage(
                        index: index,
                      )));
                },
                child: Container(
                  color: (index % 2 == 0)
                      ? Theme.of(context).primaryColor.withOpacity(0.1)
                      : Theme.of(context).cardColor.withOpacity(0.1),
                  //  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                                                      child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text(
                                            salesOrderDetailTempData[index]
                                           .description,
                                           softWrap: false,
                                           overflow: TextOverflow.ellipsis,
                                           
                                           maxLines: 2,
                                           style: TextStyle(
                                             
                                           fontSize: 20,
                                           fontWeight: FontWeight.normal),
                                            ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "SKU: ${salesOrderDetailTempData[index].itemCode}",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "IN STOCK: 18",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Unit Price  \$${salesOrderDetailTempData[index].unitPrice}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'List Price  \$${salesOrderDetailTempData[index].listPrice}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Line Total  \$${salesOrderDetailTempData[index].subTotal}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Discount    \$${salesOrderDetailTempData[index].lineDiscountTotal}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          alignment: Alignment.centerRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: FloatingActionButton(
                                  backgroundColor: Colors.red,
                                  heroTag: 'Decrement$index',
                                  onPressed: () {},
                                  elevation: 2,
                                  tooltip: 'Decrement',
                                  child: Icon(Icons.remove),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 35,
                                    width: 65,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: TextEditingController(
                                          text: salesOrderDetailTempData[index]
                                              .quantity
                                              .toString()),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      // controller: controller,
                                      textAlign: TextAlign.center,
                                      decoration: new InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          bottom:
                                              25 / 2, // HERE THE IMPORTANT PART
                                        ),
                                        border: new OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.teal)),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: FloatingActionButton(
                                  backgroundColor: Colors.green,
                                  heroTag: 'Increment$index',
                                  onPressed: () {},
                                  elevation: 25,
                                  tooltip: 'Increment',
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        return BuildProgressIndicator();
      },
    );
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        _hasMore = true;
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        print('h the top');
      });
    }
  }

  Widget circularbar() {
    _loadMore();
    return Container(
      height: 250,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _loadMore() {
    Future.delayed(const Duration(milliseconds: 300), () {
      int preLenght = pageData.length + 20;

      for (int i = pageData.length; pageData.length < preLenght; i++) {
        pageData.add(itemsWithPrices[i]);
      }
      setState(() {
        _hasMore = false;
      });
    });
  }

  buildGrandTotalListTile(String title, String amount) {
    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
          Text(
            amount,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
