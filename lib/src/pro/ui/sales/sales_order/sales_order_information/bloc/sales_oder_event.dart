part of 'sales_oder_bloc.dart';

abstract class SalesOderEvent extends Equatable {
  const SalesOderEvent();

  @override
  List<Object> get props => [];
}

class FetchDefaultData extends SalesOderEvent {}

// ignore: must_be_immutable
class CreateSalesOrderHeader extends SalesOderEvent {
  String customerId;
  String currencyCode;
  double exchangeRate;
  String purchaseOrderNo;
  String transactionType;
  String transactionNumber;
  String transactionStatus;
  String inventoryCycleNumber;
  String daySessionNumber;
  String orderType;
  String userName;
  int userId;
  int tenantId;
  String soldTo;
  String billingAddressName;
  String shippingAddressName;
  DateTime deliveryDate;
  CreateSalesOrderHeader(
      {required this.customerId,
      required this.currencyCode,
      required this.exchangeRate,
      required this.purchaseOrderNo,
      required this.transactionType,
      required this.transactionNumber,
      required this.transactionStatus,
      required this.inventoryCycleNumber,
      required this.daySessionNumber,
      required this.orderType,
      required this.userName,
      required this.userId,
      required this.tenantId,
      required this.soldTo,
      required this.billingAddressName,
      required this.shippingAddressName,
      required this.deliveryDate});
  @override
  List<Object> get props => [
        this.customerId,
        this.currencyCode,
        this.exchangeRate,
        this.purchaseOrderNo,
        this.transactionNumber,
        this.transactionNumber,
        this.transactionStatus,
        this.inventoryCycleNumber,
        this.daySessionNumber,
        this.orderType,
        this.userId,
        this.userName,
        this.tenantId,
        this.soldTo,
        this.billingAddressName,
        this.shippingAddressName,
        this.deliveryDate
      ];
}
