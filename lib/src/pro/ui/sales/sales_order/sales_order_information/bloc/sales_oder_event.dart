part of 'sales_oder_bloc.dart';

abstract class SalesOderEvent extends Equatable {
  const SalesOderEvent();

  @override
  List<Object> get props => [];
}
class FetchDefaultData extends SalesOderEvent{
  
}