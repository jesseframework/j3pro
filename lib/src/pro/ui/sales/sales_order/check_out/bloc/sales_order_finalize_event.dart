part of 'sales_order_finalize_bloc.dart';

abstract class SalesOrderFinalizeEvent extends Equatable {
  const SalesOrderFinalizeEvent();

  @override
  List<Object> get props => [];
}

class CreatePostTransection extends SalesOrderFinalizeEvent {
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
  CreatePostTransection(
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
}
