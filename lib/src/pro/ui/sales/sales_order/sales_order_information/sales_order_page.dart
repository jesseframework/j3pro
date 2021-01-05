import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/sales_order_information/bloc/sales_oder_bloc.dart';
import 'package:j3enterprise/src/pro/ui/sales/sales_order/sales_order_information/sales_order_form.dart';
import 'package:j3enterprise/src/resources/shared/widgets/circuler_indicator.dart';

class SalesOrderPage extends StatelessWidget {
  static final route = '/SalesOrderPage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SalesOderBloc>(create: (context) {
      return SalesOderBloc()..add(FetchDefaultData());
    }, child: BlocBuilder<SalesOderBloc, SalesOderState>(
      builder: (context, state) {
        if (state is SalesOderDefaultData) {
          return SalesOrderForm(
              exchangeRate: state.exchangeRate,
              currenciesData: state.currenciesData,
              defaultCurrency: state.defaultCurrency);
        }

        return Scaffold(
          body: BuildProgressIndicator(),
        );
      },
    ));
  }
}
