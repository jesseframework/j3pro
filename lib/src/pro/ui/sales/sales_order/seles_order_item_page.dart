import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_master_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/sales/sales_order/sales_order_detail_temp_crud.dart';
import 'package:j3enterprise/src/pro/models/items/ItemsWithPrices.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/bloc/sales_order_bloc.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/sales_order_checkout_page.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/sales_order_item_detail_page.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/navigation_style.dart';
import 'package:j3enterprise/src/resources/shared/widgets/circuler_indicator.dart';
import 'package:j3enterprise/src/resources/shared/widgets/no_data_found.dart';
import 'package:j3enterprise/src/resources/shared/widgets/search_bar.dart';

class SalesOrderItemPage extends StatefulWidget {
  static final route = '/SalesOrderItemPage';
  var db;

  ItemsDao itemsDao;
  SalesOrderDetailTempDao salesOrderDetailTempDao;

  SalesOrderItemPage() {
    db = AppDatabase();
    itemsDao = ItemsDao(db);
    salesOrderDetailTempDao = SalesOrderDetailTempDao(db);
  }
  @override
  _SalesOrderItemPageState createState() => _SalesOrderItemPageState();
}

class _SalesOrderItemPageState extends State<SalesOrderItemPage> {
  TextEditingController _qtyController = TextEditingController(text: '1');


  String searchText = '';
  bool searchFoused = false;
  int itemCount=0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ToDO put translation

      body: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalization.of(context)
                  .translate('sales_order_appbar_title') ??
              "Sales Order"),
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
    stream: widget.salesOrderDetailTempDao.transactionTotal('1001010011', 'Pending'),
    builder: (context,snapshot){
    if(snapshot.hasData) {
      List<SalesOrderDetailTempData> totalData = snapshot.data;
      return Badge(
          badgeContent: Text(totalData[0].itemCount.toString()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
            child: Icon(Icons.shopping_cart),
          ));
    }
    return Badge(
        badgeContent: Text(itemCount.toString()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
          child: Icon(Icons.shopping_cart),
        ));
    }),

                  SizedBox(width: 5,)
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
                                  borderSide:
                                      new BorderSide(color: Colors.teal)),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: InkWell(
                        child: Image.asset('images/bar_code.png'),
                        onTap: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: searchFoused == true
                    ? buildSearchScreeen()
                    : buildItemList(),
                transitionBuilder: (widget, animation) => ScaleTransition(
                  scale: animation,
                  child: widget,
                ),
              ),
            ),
         buildBottomSheet()
          ],
        ),
      ),
    );
  }
 buildBottomSheet(){
    return StreamBuilder(
      stream: widget.salesOrderDetailTempDao.transactionTotal('1001010011', 'Pending'),
      builder: (context,snapshot){
        if(snapshot.hasData){
        List<SalesOrderDetailTempData> totalData=snapshot.data;
        // setState(() {
        //   itemCount=totalData[0].itemCount.toInt();
        // });

             return ExpansionTile(
               title: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Grand Total:",
                     style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                   ),
                   Text(
                     totalData.isNotEmpty?'\$ ${totalData[0].grandTotal.toString()}':'\$0',
                     style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                   ),
                 ],
               ),
               children:[
                 buildGrandTotalListTile('Subtotal:', totalData.isNotEmpty?'\$ ${totalData[0].subTotal.toString()}':'\$0'),
                 buildGrandTotalListTile('Deposit:',totalData.isNotEmpty?'\$ ${totalData[0].depositTotal.toString()}':'\$0'),
                 buildGrandTotalListTile('Discount:', totalData.isNotEmpty?'\$ ${totalData[0].lineDiscountTotal.toString()}':'\$0'),
                 buildGrandTotalListTile('Shipping:',totalData.isNotEmpty? '\$ ${totalData[0].shippingTotal.toString()}':'\$0'),
                 buildGrandTotalListTile('Tax:', totalData.isNotEmpty?'\$ ${totalData[0].taxTotal.toString()}':'\$0'),
                 buildGrandTotalListTile('Item Count:',totalData.isNotEmpty? '\$ ${totalData[0].itemCount.toString()}':'\$0'),
                 buildGrandTotalListTile('Grand Total:', totalData.isNotEmpty?'\$ ${totalData[0].grandTotal.toString()}':'\$0'),

               ]


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
        print(snapshot.data);
        if (snapshot.hasData) {
          List<ItemsWithPrices> itemsWithPrices = snapshot.data;

          return ListView.builder(
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
                      title: Text(
                        itemsWithPrices[index].item.itemName,
                        style: TextStyle(
                          fontSize: 20,
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
                            splashColor:
                                Theme.of(context).primaryColor, // inkwell color
                            child: SizedBox(
                                width: 35, height: 35, child: Icon(Icons.add)),
                            onTap: () {
                              print(salesOderBloc.getCusID);
                              BlocProvider.of<SalesOrderBloc>(context).add(
                                  AddItemButtonPress(
                                      searchText: searchText,
                                      itemNumber:
                                          itemsWithPrices[index].item.itemCode,
                                      setQty: double.parse(
                                        _qtyController.text.toString(),
                                      )));
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
                          ? Theme.of(context).primaryColor.withOpacity(0.1)
                          : Theme.of(context).cardColor.withOpacity(0.1),
                      //  height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    children: [Text('Books'), Text('Studies')],
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
          .watchAllSalesOrderDetail('1001010011', 'Pending'),
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
                                  Hero(
                                    transitionOnUserGestures: true,
                                    tag: 'mask$index',
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'images/mask.png')),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      height: 42,
                                      width: 42,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        salesOrderDetailTempData[index]
                                            .description,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal),
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
