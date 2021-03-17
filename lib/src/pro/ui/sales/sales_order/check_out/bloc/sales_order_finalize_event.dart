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
      {this.customerId,
      this.currencyCode,
      this.exchangeRate,
      this.purchaseOrderNo,
      this.transactionType,
      this.transactionNumber,
      this.transactionStatus,
      this.inventoryCycleNumber,
      this.daySessionNumber,
      this.orderType,
      this.userName,
      this.userId,
      this.tenantId,
      this.soldTo,
      this.billingAddressName,
      this.shippingAddressName,
      this.deliveryDate});
}
