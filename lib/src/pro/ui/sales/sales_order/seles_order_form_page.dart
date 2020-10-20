import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/bloc/sales_order_bloc.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/seles_order_item_page.dart';

class SalesOrderFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>SalesOrderBloc(),
    child:SalesOrderItemPage(),
    );
  }
}