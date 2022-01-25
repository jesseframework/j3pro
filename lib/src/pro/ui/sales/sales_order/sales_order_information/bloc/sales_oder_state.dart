part of 'sales_oder_bloc.dart';

abstract class SalesOderState extends Equatable {
  const SalesOderState();

  @override
  List<Object> get props => [];
}

class SalesOderDefaultData extends SalesOderState {
  late String defaultCurrency;
  late double exchangeRate;
  late List<SystemCurrencyData> currenciesData;
  SalesOderDefaultData(
      {required this.defaultCurrency,
      required this.currenciesData,
      required this.exchangeRate});
  @override
  List<Object> get props =>
      [this.currenciesData, this.defaultCurrency, this.exchangeRate];
}

class SalesOderLoding extends SalesOderState {}

class SalesOderInitial extends SalesOderState {}
