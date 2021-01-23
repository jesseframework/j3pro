import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/check_out/sales_order_checkout_page.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/navigation_style.dart';
import 'package:signature/signature.dart';

class SalesOrderFinslizedPage extends StatefulWidget {
  @override
  _SalesOrderFinslizedPageState createState() =>
      _SalesOrderFinslizedPageState();
}

class _SalesOrderFinslizedPageState extends State<SalesOrderFinslizedPage> {
  final SignatureController _controller =
      SignatureController(exportBackgroundColor: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalization.of(context).translate('sales_order_finalized') ??
                "Finalize Sales Order "),
        //ToDO put translation
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
                    "Save as Draft",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.drafts)
              ],
            ),
          ),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'Order No:',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                                fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'LRD000',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 36),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildSalesOrderCardRowTile(
                          heading: 'Billing To:',
                          title:
                              'jermaine grey \nhouse 1 street no 2 sunvillias opp wapda office qasim pur multan pakistan ',
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        buildSalesOrderCardRowTile(
                          heading: 'Shipping To:',
                          title:
                              'Irfan Bashir \nhouse 1 street no 2 sunvillias opp wapda office qasim pur multan pakistan ',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8)),
                    // height: MediaQuery.of(context).size.height * 0.08,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildSalesOrderDateCardRowTile(
                            heading: 'Order Date',
                            title: '1/22/2021',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          buildSalesOrderDateCardRowTile(
                            heading: 'Dilvery Date',
                            title: '1/26/2021',
                          ),
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                      height: 300,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(8)),
                      // height: MediaQuery.of(context).size.height * 0.08,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(children: [
                            Signature(
                              controller: _controller,
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.6,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                            ),
                            Positioned(
                                left: MediaQuery.of(context).size.width * 0.2,
                                right: MediaQuery.of(context).size.width * 0.2,
                                bottom: 60,
                                child: DottedLine()),
                            Container(
                              child: Text(
                                'Signature',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    fontSize: 12),
                              ),
                            ),
                            Positioned(
                                
                                right: MediaQuery.of(context).size.width * 0.2,
                                bottom: 60,
                                child: InkWell(
                                    onTap: () {
                                      _controller.clear();
                                    },
                                    child: Icon(Icons.delete,color: Colors.red,size: 40,))),
                          ]))),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              child: MaterialButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Complete And Send',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  onPressed: () {}),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Theme.of(context).cardColor,
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TOTAL :",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$0',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  buildGrandTotalListTile('DELIVERY CHARGES:', '\$0'),
                  buildGrandTotalListTile('TOTAL POINTS:', '\$0'),
                  buildGrandTotalListTile('AMOUNT DUE:', '\$0'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildGrandTotalListTile(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            amount,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  TextStyle textStyle() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  }

  TextStyle headerstyle() {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 10,
      color: Colors.grey,
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

  Widget buildSalesOrderDateCardRowTile({
    String heading,
    String title,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          heading,
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.grey, fontSize: 12),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
