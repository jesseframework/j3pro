import 'package:flutter/material.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';

class SalesOrderPage extends StatefulWidget {
  static final route = '/SalesOrderPage';
  @override
  _SalesOrderPageState createState() => _SalesOrderPageState();
}

class _SalesOrderPageState extends State<SalesOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalization.of(context).translate('sales_order_appbar_title') ??
                "Sales Order"),
        actions: [
          InkWell(
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
      body: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 4.0,
            //  height: 150,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSalesOrderCardTile(
                      heading: 'Shipping Address',
                      title:
                          'Head Office, St. Catherine 100 Parkway Boulevard Portmore St. Catherine 00000 Jamaica',
                      trailingWidget: Icon(Icons.edit),
                      callback: () {}),
                  SizedBox(
                    height: 15,
                  ),
                  buildSalesOrderCardTile(
                      heading: 'Contact',
                      title: 'John Doe, 876-845-5063',
                      trailingWidget: Icon(Icons.edit),
                      callback: () {}),
                ],
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 4.0,
            //  height: 150,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSalesOrderCardTile(
                      heading: 'Order Type',
                      title: 'Delivery',
                      trailingWidget: Icon(Icons.arrow_drop_down),
                      callback: () {}),
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
                      trailingWidget: Icon(Icons.calendar_today),
                      callback: () {}),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildSalesOrderCardRowTile(
                                heading: 'Currency',
                                title: 'JMD',
                                trailingWidget: Icon(Icons.arrow_drop_down),
                                callback: () {}),
                            SizedBox(
                              height: 15,
                            ),
                            buildSalesOrderCardRowTile(
                                heading: 'Discount Type',
                                title: 'Percentage',
                                trailingWidget: Icon(Icons.arrow_drop_down),
                                callback: () {}),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              color: Theme.of(context).textSelectionColor,
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
                onTap: callback),
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
              color: Theme.of(context).textSelectionColor,
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
