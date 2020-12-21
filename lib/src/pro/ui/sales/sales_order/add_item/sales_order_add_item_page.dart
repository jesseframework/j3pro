import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/add_item/bloc/add_item_bloc.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/add_item/sales_order_add_item_form.dart';

class SalesOrderAddItemPage extends StatefulWidget {
  SalesOrderAddItemPage();
  static final route = '/SalesOrderAddItemPage';

  @override
  _SalesOrderAddItemPageState createState() => _SalesOrderAddItemPageState();
}

class _SalesOrderAddItemPageState extends State<SalesOrderAddItemPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AddItemBloc();
      },
      child: Scaffold(
        body: SalesOrderAddItemForm(),
      ),
    );
  }
}
