import 'package:flutter/material.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/navigation_style.dart';

class SalesOrderCheckOutPage extends StatefulWidget {
  const SalesOrderCheckOutPage({super.key});

  @override
  _SalesOrderCheckOutPageState createState() => _SalesOrderCheckOutPageState();
}

class _SalesOrderCheckOutPageState extends State<SalesOrderCheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context)!
                .translate('sales_order_checkout_appbar_title') ??
            "Payment"),
        //ToDO put translation
        actions: [
          InkWell(
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        SizeRoute(page: const SalesOrderCheckOutPage()));
                  },
                  child: const Text(
                    "Complete",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(Icons.done_all)
              ],
            ),
          ),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildSalesOrderCardRowTile(
                              heading: 'Shipping Address',
                              title: 'Portmore',
                              trailingWidget: const Icon(Icons.arrow_drop_down),
                              callback: () {}),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildSalesOrderCardRowTile(
                            heading: 'Delivery Charge',
                            title: '\$0.00',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildSalesOrderCardRowTile(
                              heading: 'Type of Discount',
                              title: 'Points',
                              trailingWidget: const Icon(Icons.arrow_drop_down),
                              callback: () {}),
                          const SizedBox(
                            height: 15,
                          ),
                          buildSalesOrderCardRowTile(
                              heading: 'Currency',
                              title: 'JMD',
                              trailingWidget: const Icon(Icons.arrow_drop_down),
                              callback: () {}),
                          const SizedBox(
                            height: 15,
                          ),
                          buildSalesOrderCardRowTile(
                              heading: 'Payment Type',
                              title: 'Credit Card',
                              trailingWidget: const Icon(Icons.arrow_drop_down),
                              callback: () {}),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildSalesOrderCardRowTile(
                            heading: 'Ad hoc Discount',
                            title: '\$0.00',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          buildSalesOrderCardRowTile(
                            heading: 'Exchange Rate',
                            title: '\$0.00',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          buildSalesOrderCardRowTile(
                            heading: 'Payment Amount',
                            title: '\$0.00',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                child: MaterialButton(
                    color: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text('Add Payment'),
                    onPressed: () {}),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8)),
                height: MediaQuery.of(context).size.height * 0.38,
                child: Container(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Payment Type',
                            style: headerstyle(),
                          ),
                          Text(
                            'Currency',
                            style: headerstyle(),
                          ),
                          Text(
                            'Exchange Rate',
                            style: headerstyle(),
                          ),
                          Text(
                            'Payment Amount',
                            style: headerstyle(),
                          ),
                          const SizedBox(
                            width: 15,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            color: (index % 2 == 0)
                                ? Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2)
                                : Theme.of(context).cardColor.withOpacity(0.1),
                            height: 60,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Credit Card'),
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Text('JMD'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 25),
                                    child: Text('\$1.00'),
                                  ),
                                  Text('\$9,000.00'),
                                  Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Points',
                            style: textStyle(),
                          ),
                          Text('\$2,550.00', style: textStyle())
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Amount Tendered', style: textStyle()),
                          Text('\$18,000.00', style: textStyle())
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Amount Due', style: textStyle()),
                          Text('\$2,000.00', style: textStyle())
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textStyle() {
    return const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  }

  TextStyle headerstyle() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 10,
      color: Theme.of(context).textSelectionTheme.selectionHandleColor,
    );
  }

  Widget buildSalesOrderCardRowTile(
      {String? heading,
      String? title,
      Widget? trailingWidget,
      Function? callback}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading!,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textSelectionTheme.selectionHandleColor,
              fontSize: 12),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            InkWell(
                child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: trailingWidget),
                onTap: () {}),
          ],
        ),
      ],
    );
  }
}
