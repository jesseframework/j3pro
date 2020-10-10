import 'package:flutter/material.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';

class SalesOrderItemDetailPage extends StatelessWidget {
  static final route = '/SalesOrderItemDetailPage';
  int index;

  SalesOrderItemDetailPage({this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalization.of(context)
                  .translate('sales_order_item_appbar_title') ??
              "Sales Order"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Hero(
                            tag: 'mask$index',
                            child: Image.asset('images/mask.png')),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            "Covid-19 N95 Face Masks",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Text(
                          "SKU: 0001-202",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTextWidget('Quantity   4'),
                              buildTextWidget('UOM         EACH'),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTextWidget('Unit Price    \$200,000.00'),
                              buildTextWidget('List Price    \$200,000.00'),
                              buildTextWidget('Line Total   \$200,000.00'),
                              buildTextWidget('Discount     \$200,000.00'),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          buildTextWidget('Inventory'),
                          buildRowTextWidget('Main Store', '10'),
                          buildRowTextWidget('In Transit', '4'),
                          buildRowTextWidget('Damage', '0'),
                        ],
                      ),
                    ),
                  )),

              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5)),
                                width: 85,
                                height: 85,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    Text('New Price')
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5)),
                                width: 85,
                                height: 85,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    Text('Void')
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(5)),
                                width: 85,
                                height: 85,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.settings_remote,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    Text('Remote Void')
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))

              //  height)
            ],
          ),
        ));
  }

  buildTextWidget(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Text(
        text,
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  buildRowTextWidget(String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: TextStyle(fontSize: 14),
          ),
          Text(
            text2,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
