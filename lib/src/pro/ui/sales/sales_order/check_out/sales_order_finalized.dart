import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/address_crud.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/add_item/bloc/add_item_bloc.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/check_out/bloc/sales_order_finalize_bloc.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/check_out/sales_order_checkout_page.dart';
import 'package:j3enterprise/src/resources/shared/lang/appLocalization.dart';
import 'package:j3enterprise/src/resources/shared/utils/navigation_style.dart';
import 'package:j3enterprise/src/resources/shared/widgets/circuler_indicator.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:signature/signature.dart';

class SalesOrderFinslizedPage extends StatefulWidget {
  var db;
  AddressDao addressDao;
  SalesOrderFinslizedPage() {
    db = AppDatabase();
    addressDao = AddressDao(db);
  }
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
                "Finalize  "),
        //ToDO put translation
        actions: [
          InkWell(
            child: Row(
              children: [
                InkWell(
                  onTap: ()async {
                    BlocProvider.of(context).add(CreatePostTransection());
                    Navigator.push(
                        context, SizeRoute(page: SalesOrderCheckOutPage()));
                  },
                  child: Text(
                    " Complete",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.done_all)
              ],
            ),
          ),
          //IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert),
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<String>>[
                new PopupMenuItem<String>(
                    child: ListTile(
                      leading: Icon(Icons.drafts),
                      title: Text('Save as Draft'),
                    ),
                    value: 'Draft'),
              ];
            },
          ),
        ],
      ),
      body: StreamBuilder<Object>(
          stream: widget.addressDao.watchAllAddressByTitleDual(
              customerId: addItemBloc.customerId,
              //addressType: 'Shipping',
              isDisable: false),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              List<Addres> addres = snapshot.data;

              return Padding(
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
                            padding: const EdgeInsets.all(5.0),
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    addItemBloc.tempSalesOrderNo,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25),
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
                                    title: addres
                                        .firstWhere(
                                            (e) => e.isShippingAddress != true)
                                        .addressLine1),
                                SizedBox(
                                  height: 30,
                                ),
                                buildSalesOrderCardRowTile(
                                  heading: 'Shipping To:',
                                  title: addItemBloc
                                      .getShippingAddress.addressLine1,
                                )
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
                                  horizontal: 30, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildSalesOrderDateCardRowTile(
                                      heading: 'Order Date',
                                      title:
                                          '${DateTime.now().day.toString()}/${DateTime.now().month.toString()}/${DateTime.now().year.toString()}'),
                                  buildSalesOrderDateCardRowTile(
                                    heading: 'Dilvery Date',
                                    title:
                                        '${addItemBloc.getDilveryDate.day.toString()}/${addItemBloc.getDilveryDate.month.toString()}/${addItemBloc.getDilveryDate.year.toString()}',
                                  ),
                                ],
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                              height: 200,
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
                                      height: 150,
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    Positioned(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.20,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.20,
                                        bottom: 25,
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
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.20,
                                        bottom: 30,
                                        child: InkWell(
                                            onTap: () {
                                              _controller.clear();
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                              size: 40,
                                            ))),
                                  ]))),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return BuildProgressIndicator();
          }),
      bottomSheet: ExpansionTile(
        title: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TOTAL : ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$0',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        children: [
          buildGrandTotalListTile('DELIVERY CHARGES:', '\$0'),
          buildGrandTotalListTile('TOTAL POINTS:', '\$0'),
          buildGrandTotalListTile('AMOUNT DUE:', '\$0'),
        ],
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
