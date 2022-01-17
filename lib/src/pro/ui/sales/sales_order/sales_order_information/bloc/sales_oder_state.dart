part of 'sales_oder_bloc.dart';

abstract class SalesOderState extends Equatable {
  const SalesOderState();

  @override
  List<Object> get props => [];
}

class SalesOderDefaultData extends SalesOderState {
  String defaultCurrency;
  double exchangeRate;
  List<SystemCurrencyData> currenciesData;
  SalesOderDefaultData(
      {this.defaultCurrency, this.currenciesData, this.exchangeRate});
  @override
  List<Object> get props =>
      [this.currenciesData, this.defaultCurrency, this.exchangeRate];
}

class SalesOderLoding extends SalesOderState {}

class SalesOderInitial extends SalesOderState {}
