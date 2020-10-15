import 'package:flutter/material.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_master_crud.dart';
import 'package:j3enterprise/src/pro/models/items/ItemsWithPrices.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/sales_order_checkout_page.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/sales_order_item_detail_page.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/navigation_style.dart';
import 'package:j3enterprise/src/resources/shared/widgets/circuler_indicator.dart';
import 'package:j3enterprise/src/resources/shared/widgets/search_bar.dart';

class SalesOrderItemPage extends StatefulWidget {
  static final route = '/SalesOrderItemPage';
  var db;

  ItemsDao itemsDao;

  SalesOrderItemPage() {
    db = AppDatabase();
    itemsDao = ItemsDao(db);
  }
  @override
  _SalesOrderItemPageState createState() => _SalesOrderItemPageState();
}

class _SalesOrderItemPageState extends State<SalesOrderItemPage> {
  TextEditingController controller = TextEditingController(text: '1');

  String searchText = '';
  bool searchFoused = false;

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
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context, SizeRoute(page: SalesOrderCheckOutPage()));
                    },
                    child: Text(
                      "Checkout",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.shopping_cart)
                ],
              ),
            ),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
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
                          width: 35,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            // controller: controller,
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
                    ? buildSearchSreeen()
                    : buildItemList(),
                transitionBuilder: (widget, animation) => ScaleTransition(
                  scale: animation,
                  child: widget,
                ),
              ),
            ),
            ExpansionTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Grand Total:",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "\$20,000",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              children: [
                buildGrandTotalListTile('Subtotal:', "\$17,000.00"),
                buildGrandTotalListTile('Deposit:', "\$0.00"),
                buildGrandTotalListTile('Discount:', "\$0.00"),
                buildGrandTotalListTile('Shipping:', "\$450.00"),
                buildGrandTotalListTile('Tax:', "\$2,550.00"),
                buildGrandTotalListTile('Item Count:', "4"),
                buildGrandTotalListTile('Grand Total:', "\$20,000.00"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildSearchSreeen() {
    return StreamBuilder(
      stream: widget.itemsDao.watchItemsWithPricesJoin(searchText, false),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ItemsWithPrices> itemsWithPrices = snapshot.data;
          return ListView.builder(
            itemCount: itemsWithPrices.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Container(
                    color: (index % 2 == 0)
                        ? Theme.of(context).primaryColor.withOpacity(0.1)
                        : Theme.of(context).cardColor.withOpacity(0.1),
                    child: ListTile(
                      leading: Hero(
                        transitionOnUserGestures: true,
                        tag: 'mask$index',
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/mask.png')),
                          ),
                          height: 84,
                          width: 84,
                        ),
                      ),
                      title: Text(
                        itemsWithPrices[index].item.itemName,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'SKU:${itemsWithPrices[index].item.itemCode}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Flexible(
                              child: Text(
                            '${itemsWithPrices[index].item.itemGroup}\n${itemsWithPrices[index].item.category}',
                            overflow: TextOverflow.ellipsis,
                          )),
                          Flexible(
                            child: Column(
                              children: [
                                Text(
                                  '${itemsWithPrices[index].price.itemPrice.toString()}\$',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(itemsWithPrices[index].item.uom),
                              ],
                            ),
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
                            onTap: () {},
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
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Warehouse'),
                                Text('Last Update')
                              ],
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Store 1'),
                                    Text('Store 2'),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('QOH'),
                                    Text('QOH'),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('100 Each'),
                                    Text('200 Bag'),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('x 10'),
                                    Text('x 10'),
                                  ],
                                ),
                                Text('44144.96528')
                              ],
                            ),
                          )),
                    )
                  ]);
            },
          );
        }
        return BuildProgressIndicator();
      },
    );
  }

  buildItemList() {
    return ListView.builder(
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
                                        image: AssetImage('images/mask.png')),
                                    borderRadius: BorderRadius.circular(5)),
                                height: 42,
                                width: 42,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Covid-19 N95 Face Masks",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "SKU: 0001-202",
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
                          padding: const EdgeInsets.only(top: 20, right: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Unit Price  \$200,000.00',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'List Price  \$190,000.00',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Line Total  \$760,000.00',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Discount    \$10,000.00',
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
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              child: TextField(
                                controller: controller,
                                textAlignVertical: TextAlignVertical.center,
                                // controller: controller,
                                textAlign: TextAlign.center,
                                decoration: new InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    bottom: 25 / 2, // HERE THE IMPORTANT PART
                                  ),
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.teal)),
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
