// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_order_detail_crud_custquery.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class SalesOrderHeaderData extends DataClass
    implements Insertable<SalesOrderHeaderData> {
  final int tenantId;
  final String userName;
  final int userId;
  final int id;
  final String transactionNumber;
  final String transactionStatus;
  final String inventoryCycleNumber;
  final String daySessionNumber;
  final String customerId;
  final String soldTo;
  final DateTime orderDate;
  final DateTime deliveryDate;
  final String orderType;
  final String orderStatus;
  final String purchaseOrderNo;
  final String currency;
  final double exchangeRate;
  final int couponCode;
  final String billingAddressName;
  final String shippingAddressName;
  final String yourInitial;
  final double subTotal;
  final double taxTotal;
  final double depositTotal;
  final double discountTotal;
  final double shippingTotal;
  final int itemCount;
  final double grandTotal;
  final String discountType;
  final double discountPercentage;
  final double discountAmount;
  final double latitude;
  final double longitude;
  final DateTime transactionStart;
  final DateTime transactionEnd;
  SalesOrderHeaderData(
      {this.tenantId,
      @required this.userName,
      @required this.userId,
      @required this.id,
      @required this.transactionNumber,
      this.transactionStatus,
      @required this.inventoryCycleNumber,
      @required this.daySessionNumber,
      @required this.customerId,
      this.soldTo,
      @required this.orderDate,
      @required this.deliveryDate,
      @required this.orderType,
      @required this.orderStatus,
      this.purchaseOrderNo,
      @required this.currency,
      @required this.exchangeRate,
      this.couponCode,
      this.billingAddressName,
      this.shippingAddressName,
      this.yourInitial,
      @required this.subTotal,
      @required this.taxTotal,
      @required this.depositTotal,
      @required this.discountTotal,
      @required this.shippingTotal,
      @required this.itemCount,
      @required this.grandTotal,
      @required this.discountType,
      @required this.discountPercentage,
      @required this.discountAmount,
      this.latitude,
      this.longitude,
      this.transactionStart,
      this.transactionEnd});
  factory SalesOrderHeaderData.fromData(Map<String, dynamic> data,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return SalesOrderHeaderData(
      tenantId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tenant_id']),
      userName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name']),
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      transactionNumber: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}transaction_number']),
      transactionStatus: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}transaction_status']),
      inventoryCycleNumber: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}inventory_cycle_number']),
      daySessionNumber: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}day_session_number']),
      customerId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}customer_id']),
      soldTo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sold_to']),
      orderDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order_date']),
      deliveryDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}delivery_date']),
      orderType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order_type']),
      orderStatus: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order_status']),
      purchaseOrderNo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}purchase_order_no']),
      currency: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}currency']),
      exchangeRate: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}exchange_rate']),
      couponCode: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}coupon_code']),
      billingAddressName: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}billing_address_name']),
      shippingAddressName: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}shipping_address_name']),
      yourInitial: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}your_initial']),
      subTotal: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sub_total']),
      taxTotal: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tax_total']),
      depositTotal: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deposit_total']),
      discountTotal: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}discount_total']),
      shippingTotal: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}shipping_total']),
      itemCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}item_count']),
      grandTotal: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}grand_total']),
      discountType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}discount_type']),
      discountPercentage: const RealType().mapFromDatabaseResponse(
          data['${effectivePrefix}discount_percentage']),
      discountAmount: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}discount_amount']),
      latitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      transactionStart: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}transaction_start']),
      transactionEnd: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}transaction_end']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    if (!nullToAbsent || userName != null) {
      map['user_name'] = Variable<String>(userName);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || transactionNumber != null) {
      map['transaction_number'] = Variable<String>(transactionNumber);
    }
    if (!nullToAbsent || transactionStatus != null) {
      map['transaction_status'] = Variable<String>(transactionStatus);
    }
    if (!nullToAbsent || inventoryCycleNumber != null) {
      map['inventory_cycle_number'] = Variable<String>(inventoryCycleNumber);
    }
    if (!nullToAbsent || daySessionNumber != null) {
      map['day_session_number'] = Variable<String>(daySessionNumber);
    }
    if (!nullToAbsent || customerId != null) {
      map['customer_id'] = Variable<String>(customerId);
    }
    if (!nullToAbsent || soldTo != null) {
      map['sold_to'] = Variable<String>(soldTo);
    }
    if (!nullToAbsent || orderDate != null) {
      map['order_date'] = Variable<DateTime>(orderDate);
    }
    if (!nullToAbsent || deliveryDate != null) {
      map['delivery_date'] = Variable<DateTime>(deliveryDate);
    }
    if (!nullToAbsent || orderType != null) {
      map['order_type'] = Variable<String>(orderType);
    }
    if (!nullToAbsent || orderStatus != null) {
      map['order_status'] = Variable<String>(orderStatus);
    }
    if (!nullToAbsent || purchaseOrderNo != null) {
      map['purchase_order_no'] = Variable<String>(purchaseOrderNo);
    }
    if (!nullToAbsent || currency != null) {
      map['currency'] = Variable<String>(currency);
    }
    if (!nullToAbsent || exchangeRate != null) {
      map['exchange_rate'] = Variable<double>(exchangeRate);
    }
    if (!nullToAbsent || couponCode != null) {
      map['coupon_code'] = Variable<int>(couponCode);
    }
    if (!nullToAbsent || billingAddressName != null) {
      map['billing_address_name'] = Variable<String>(billingAddressName);
    }
    if (!nullToAbsent || shippingAddressName != null) {
      map['shipping_address_name'] = Variable<String>(shippingAddressName);
    }
    if (!nullToAbsent || yourInitial != null) {
      map['your_initial'] = Variable<String>(yourInitial);
    }
    if (!nullToAbsent || subTotal != null) {
      map['sub_total'] = Variable<double>(subTotal);
    }
    if (!nullToAbsent || taxTotal != null) {
      map['tax_total'] = Variable<double>(taxTotal);
    }
    if (!nullToAbsent || depositTotal != null) {
      map['deposit_total'] = Variable<double>(depositTotal);
    }
    if (!nullToAbsent || discountTotal != null) {
      map['discount_total'] = Variable<double>(discountTotal);
    }
    if (!nullToAbsent || shippingTotal != null) {
      map['shipping_total'] = Variable<double>(shippingTotal);
    }
    if (!nullToAbsent || itemCount != null) {
      map['item_count'] = Variable<int>(itemCount);
    }
    if (!nullToAbsent || grandTotal != null) {
      map['grand_total'] = Variable<double>(grandTotal);
    }
    if (!nullToAbsent || discountType != null) {
      map['discount_type'] = Variable<String>(discountType);
    }
    if (!nullToAbsent || discountPercentage != null) {
      map['discount_percentage'] = Variable<double>(discountPercentage);
    }
    if (!nullToAbsent || discountAmount != null) {
      map['discount_amount'] = Variable<double>(discountAmount);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || transactionStart != null) {
      map['transaction_start'] = Variable<DateTime>(transactionStart);
    }
    if (!nullToAbsent || transactionEnd != null) {
      map['transaction_end'] = Variable<DateTime>(transactionEnd);
    }
    return map;
  }

  SalesOrderHeaderCompanion toCompanion(bool nullToAbsent) {
    return SalesOrderHeaderCompanion(
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      transactionNumber: transactionNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionNumber),
      transactionStatus: transactionStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionStatus),
      inventoryCycleNumber: inventoryCycleNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(inventoryCycleNumber),
      daySessionNumber: daySessionNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(daySessionNumber),
      customerId: customerId == null && nullToAbsent
          ? const Value.absent()
          : Value(customerId),
      soldTo:
          soldTo == null && nullToAbsent ? const Value.absent() : Value(soldTo),
      orderDate: orderDate == null && nullToAbsent
          ? const Value.absent()
          : Value(orderDate),
      deliveryDate: deliveryDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryDate),
      orderType: orderType == null && nullToAbsent
          ? const Value.absent()
          : Value(orderType),
      orderStatus: orderStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(orderStatus),
      purchaseOrderNo: purchaseOrderNo == null && nullToAbsent
          ? const Value.absent()
          : Value(purchaseOrderNo),
      currency: currency == null && nullToAbsent
          ? const Value.absent()
          : Value(currency),
      exchangeRate: exchangeRate == null && nullToAbsent
          ? const Value.absent()
          : Value(exchangeRate),
      couponCode: couponCode == null && nullToAbsent
          ? const Value.absent()
          : Value(couponCode),
      billingAddressName: billingAddressName == null && nullToAbsent
          ? const Value.absent()
          : Value(billingAddressName),
      shippingAddressName: shippingAddressName == null && nullToAbsent
          ? const Value.absent()
          : Value(shippingAddressName),
      yourInitial: yourInitial == null && nullToAbsent
          ? const Value.absent()
          : Value(yourInitial),
      subTotal: subTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(subTotal),
      taxTotal: taxTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(taxTotal),
      depositTotal: depositTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(depositTotal),
      discountTotal: discountTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(discountTotal),
      shippingTotal: shippingTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(shippingTotal),
      itemCount: itemCount == null && nullToAbsent
          ? const Value.absent()
          : Value(itemCount),
      grandTotal: grandTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(grandTotal),
      discountType: discountType == null && nullToAbsent
          ? const Value.absent()
          : Value(discountType),
      discountPercentage: discountPercentage == null && nullToAbsent
          ? const Value.absent()
          : Value(discountPercentage),
      discountAmount: discountAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(discountAmount),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      transactionStart: transactionStart == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionStart),
      transactionEnd: transactionEnd == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionEnd),
    );
  }

  factory SalesOrderHeaderData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalesOrderHeaderData(
      tenantId: serializer.fromJson<int>(json['tenantId']),
      userName: serializer.fromJson<String>(json['userName']),
      userId: serializer.fromJson<int>(json['userId']),
      id: serializer.fromJson<int>(json['id']),
      transactionNumber: serializer.fromJson<String>(json['transactionNumber']),
      transactionStatus: serializer.fromJson<String>(json['transactionStatus']),
      inventoryCycleNumber:
          serializer.fromJson<String>(json['inventoryCycleNumber']),
      daySessionNumber: serializer.fromJson<String>(json['daySessionNumber']),
      customerId: serializer.fromJson<String>(json['customerId']),
      soldTo: serializer.fromJson<String>(json['soldTo']),
      orderDate: serializer.fromJson<DateTime>(json['orderDate']),
      deliveryDate: serializer.fromJson<DateTime>(json['deliveryDate']),
      orderType: serializer.fromJson<String>(json['orderType']),
      orderStatus: serializer.fromJson<String>(json['orderStatus']),
      purchaseOrderNo: serializer.fromJson<String>(json['purchaseOrderNo']),
      currency: serializer.fromJson<String>(json['currency']),
      exchangeRate: serializer.fromJson<double>(json['exchangeRate']),
      couponCode: serializer.fromJson<int>(json['couponCode']),
      billingAddressName:
          serializer.fromJson<String>(json['billingAddressName']),
      shippingAddressName:
          serializer.fromJson<String>(json['shippingAddressName']),
      yourInitial: serializer.fromJson<String>(json['yourInitial']),
      subTotal: serializer.fromJson<double>(json['subTotal']),
      taxTotal: serializer.fromJson<double>(json['taxTotal']),
      depositTotal: serializer.fromJson<double>(json['depositTotal']),
      discountTotal: serializer.fromJson<double>(json['discountTotal']),
      shippingTotal: serializer.fromJson<double>(json['shippingTotal']),
      itemCount: serializer.fromJson<int>(json['itemCount']),
      grandTotal: serializer.fromJson<double>(json['grandTotal']),
      discountType: serializer.fromJson<String>(json['discountType']),
      discountPercentage:
          serializer.fromJson<double>(json['discountPercentage']),
      discountAmount: serializer.fromJson<double>(json['discountAmount']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      transactionStart: serializer.fromJson<DateTime>(json['transactionStart']),
      transactionEnd: serializer.fromJson<DateTime>(json['transactionEnd']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tenantId': serializer.toJson<int>(tenantId),
      'userName': serializer.toJson<String>(userName),
      'userId': serializer.toJson<int>(userId),
      'id': serializer.toJson<int>(id),
      'transactionNumber': serializer.toJson<String>(transactionNumber),
      'transactionStatus': serializer.toJson<String>(transactionStatus),
      'inventoryCycleNumber': serializer.toJson<String>(inventoryCycleNumber),
      'daySessionNumber': serializer.toJson<String>(daySessionNumber),
      'customerId': serializer.toJson<String>(customerId),
      'soldTo': serializer.toJson<String>(soldTo),
      'orderDate': serializer.toJson<DateTime>(orderDate),
      'deliveryDate': serializer.toJson<DateTime>(deliveryDate),
      'orderType': serializer.toJson<String>(orderType),
      'orderStatus': serializer.toJson<String>(orderStatus),
      'purchaseOrderNo': serializer.toJson<String>(purchaseOrderNo),
      'currency': serializer.toJson<String>(currency),
      'exchangeRate': serializer.toJson<double>(exchangeRate),
      'couponCode': serializer.toJson<int>(couponCode),
      'billingAddressName': serializer.toJson<String>(billingAddressName),
      'shippingAddressName': serializer.toJson<String>(shippingAddressName),
      'yourInitial': serializer.toJson<String>(yourInitial),
      'subTotal': serializer.toJson<double>(subTotal),
      'taxTotal': serializer.toJson<double>(taxTotal),
      'depositTotal': serializer.toJson<double>(depositTotal),
      'discountTotal': serializer.toJson<double>(discountTotal),
      'shippingTotal': serializer.toJson<double>(shippingTotal),
      'itemCount': serializer.toJson<int>(itemCount),
      'grandTotal': serializer.toJson<double>(grandTotal),
      'discountType': serializer.toJson<String>(discountType),
      'discountPercentage': serializer.toJson<double>(discountPercentage),
      'discountAmount': serializer.toJson<double>(discountAmount),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'transactionStart': serializer.toJson<DateTime>(transactionStart),
      'transactionEnd': serializer.toJson<DateTime>(transactionEnd),
    };
  }

  SalesOrderHeaderData copyWith(
          {int tenantId,
          String userName,
          int userId,
          int id,
          String transactionNumber,
          String transactionStatus,
          String inventoryCycleNumber,
          String daySessionNumber,
          String customerId,
          String soldTo,
          DateTime orderDate,
          DateTime deliveryDate,
          String orderType,
          String orderStatus,
          String purchaseOrderNo,
          String currency,
          double exchangeRate,
          int couponCode,
          String billingAddressName,
          String shippingAddressName,
          String yourInitial,
          double subTotal,
          double taxTotal,
          double depositTotal,
          double discountTotal,
          double shippingTotal,
          int itemCount,
          double grandTotal,
          String discountType,
          double discountPercentage,
          double discountAmount,
          double latitude,
          double longitude,
          DateTime transactionStart,
          DateTime transactionEnd}) =>
      SalesOrderHeaderData(
        tenantId: tenantId ?? this.tenantId,
        userName: userName ?? this.userName,
        userId: userId ?? this.userId,
        id: id ?? this.id,
        transactionNumber: transactionNumber ?? this.transactionNumber,
        transactionStatus: transactionStatus ?? this.transactionStatus,
        inventoryCycleNumber: inventoryCycleNumber ?? this.inventoryCycleNumber,
        daySessionNumber: daySessionNumber ?? this.daySessionNumber,
        customerId: customerId ?? this.customerId,
        soldTo: soldTo ?? this.soldTo,
        orderDate: orderDate ?? this.orderDate,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        orderType: orderType ?? this.orderType,
        orderStatus: orderStatus ?? this.orderStatus,
        purchaseOrderNo: purchaseOrderNo ?? this.purchaseOrderNo,
        currency: currency ?? this.currency,
        exchangeRate: exchangeRate ?? this.exchangeRate,
        couponCode: couponCode ?? this.couponCode,
        billingAddressName: billingAddressName ?? this.billingAddressName,
        shippingAddressName: shippingAddressName ?? this.shippingAddressName,
        yourInitial: yourInitial ?? this.yourInitial,
        subTotal: subTotal ?? this.subTotal,
        taxTotal: taxTotal ?? this.taxTotal,
        depositTotal: depositTotal ?? this.depositTotal,
        discountTotal: discountTotal ?? this.discountTotal,
        shippingTotal: shippingTotal ?? this.shippingTotal,
        itemCount: itemCount ?? this.itemCount,
        grandTotal: grandTotal ?? this.grandTotal,
        discountType: discountType ?? this.discountType,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        discountAmount: discountAmount ?? this.discountAmount,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        transactionStart: transactionStart ?? this.transactionStart,
        transactionEnd: transactionEnd ?? this.transactionEnd,
      );
  @override
  String toString() {
    return (StringBuffer('SalesOrderHeaderData(')
          ..write('tenantId: $tenantId, ')
          ..write('userName: $userName, ')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('transactionNumber: $transactionNumber, ')
          ..write('transactionStatus: $transactionStatus, ')
          ..write('inventoryCycleNumber: $inventoryCycleNumber, ')
          ..write('daySessionNumber: $daySessionNumber, ')
          ..write('customerId: $customerId, ')
          ..write('soldTo: $soldTo, ')
          ..write('orderDate: $orderDate, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('orderType: $orderType, ')
          ..write('orderStatus: $orderStatus, ')
          ..write('purchaseOrderNo: $purchaseOrderNo, ')
          ..write('currency: $currency, ')
          ..write('exchangeRate: $exchangeRate, ')
          ..write('couponCode: $couponCode, ')
          ..write('billingAddressName: $billingAddressName, ')
          ..write('shippingAddressName: $shippingAddressName, ')
          ..write('yourInitial: $yourInitial, ')
          ..write('subTotal: $subTotal, ')
          ..write('taxTotal: $taxTotal, ')
          ..write('depositTotal: $depositTotal, ')
          ..write('discountTotal: $discountTotal, ')
          ..write('shippingTotal: $shippingTotal, ')
          ..write('itemCount: $itemCount, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('discountType: $discountType, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('transactionStart: $transactionStart, ')
          ..write('transactionEnd: $transactionEnd')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        tenantId,
        userName,
        userId,
        id,
        transactionNumber,
        transactionStatus,
        inventoryCycleNumber,
        daySessionNumber,
        customerId,
        soldTo,
        orderDate,
        deliveryDate,
        orderType,
        orderStatus,
        purchaseOrderNo,
        currency,
        exchangeRate,
        couponCode,
        billingAddressName,
        shippingAddressName,
        yourInitial,
        subTotal,
        taxTotal,
        depositTotal,
        discountTotal,
        shippingTotal,
        itemCount,
        grandTotal,
        discountType,
        discountPercentage,
        discountAmount,
        latitude,
        longitude,
        transactionStart,
        transactionEnd
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesOrderHeaderData &&
          other.tenantId == this.tenantId &&
          other.userName == this.userName &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.transactionNumber == this.transactionNumber &&
          other.transactionStatus == this.transactionStatus &&
          other.inventoryCycleNumber == this.inventoryCycleNumber &&
          other.daySessionNumber == this.daySessionNumber &&
          other.customerId == this.customerId &&
          other.soldTo == this.soldTo &&
          other.orderDate == this.orderDate &&
          other.deliveryDate == this.deliveryDate &&
          other.orderType == this.orderType &&
          other.orderStatus == this.orderStatus &&
          other.purchaseOrderNo == this.purchaseOrderNo &&
          other.currency == this.currency &&
          other.exchangeRate == this.exchangeRate &&
          other.couponCode == this.couponCode &&
          other.billingAddressName == this.billingAddressName &&
          other.shippingAddressName == this.shippingAddressName &&
          other.yourInitial == this.yourInitial &&
          other.subTotal == this.subTotal &&
          other.taxTotal == this.taxTotal &&
          other.depositTotal == this.depositTotal &&
          other.discountTotal == this.discountTotal &&
          other.shippingTotal == this.shippingTotal &&
          other.itemCount == this.itemCount &&
          other.grandTotal == this.grandTotal &&
          other.discountType == this.discountType &&
          other.discountPercentage == this.discountPercentage &&
          other.discountAmount == this.discountAmount &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.transactionStart == this.transactionStart &&
          other.transactionEnd == this.transactionEnd);
}

class SalesOrderHeaderCompanion extends UpdateCompanion<SalesOrderHeaderData> {
  final Value<int> tenantId;
  final Value<String> userName;
  final Value<int> userId;
  final Value<int> id;
  final Value<String> transactionNumber;
  final Value<String> transactionStatus;
  final Value<String> inventoryCycleNumber;
  final Value<String> daySessionNumber;
  final Value<String> customerId;
  final Value<String> soldTo;
  final Value<DateTime> orderDate;
  final Value<DateTime> deliveryDate;
  final Value<String> orderType;
  final Value<String> orderStatus;
  final Value<String> purchaseOrderNo;
  final Value<String> currency;
  final Value<double> exchangeRate;
  final Value<int> couponCode;
  final Value<String> billingAddressName;
  final Value<String> shippingAddressName;
  final Value<String> yourInitial;
  final Value<double> subTotal;
  final Value<double> taxTotal;
  final Value<double> depositTotal;
  final Value<double> discountTotal;
  final Value<double> shippingTotal;
  final Value<int> itemCount;
  final Value<double> grandTotal;
  final Value<String> discountType;
  final Value<double> discountPercentage;
  final Value<double> discountAmount;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<DateTime> transactionStart;
  final Value<DateTime> transactionEnd;
  const SalesOrderHeaderCompanion({
    this.tenantId = const Value.absent(),
    this.userName = const Value.absent(),
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.transactionNumber = const Value.absent(),
    this.transactionStatus = const Value.absent(),
    this.inventoryCycleNumber = const Value.absent(),
    this.daySessionNumber = const Value.absent(),
    this.customerId = const Value.absent(),
    this.soldTo = const Value.absent(),
    this.orderDate = const Value.absent(),
    this.deliveryDate = const Value.absent(),
    this.orderType = const Value.absent(),
    this.orderStatus = const Value.absent(),
    this.purchaseOrderNo = const Value.absent(),
    this.currency = const Value.absent(),
    this.exchangeRate = const Value.absent(),
    this.couponCode = const Value.absent(),
    this.billingAddressName = const Value.absent(),
    this.shippingAddressName = const Value.absent(),
    this.yourInitial = const Value.absent(),
    this.subTotal = const Value.absent(),
    this.taxTotal = const Value.absent(),
    this.depositTotal = const Value.absent(),
    this.discountTotal = const Value.absent(),
    this.shippingTotal = const Value.absent(),
    this.itemCount = const Value.absent(),
    this.grandTotal = const Value.absent(),
    this.discountType = const Value.absent(),
    this.discountPercentage = const Value.absent(),
    this.discountAmount = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.transactionStart = const Value.absent(),
    this.transactionEnd = const Value.absent(),
  });
  SalesOrderHeaderCompanion.insert({
    this.tenantId = const Value.absent(),
    @required String userName,
    @required int userId,
    this.id = const Value.absent(),
    @required String transactionNumber,
    this.transactionStatus = const Value.absent(),
    @required String inventoryCycleNumber,
    @required String daySessionNumber,
    @required String customerId,
    this.soldTo = const Value.absent(),
    @required DateTime orderDate,
    @required DateTime deliveryDate,
    @required String orderType,
    @required String orderStatus,
    this.purchaseOrderNo = const Value.absent(),
    @required String currency,
    @required double exchangeRate,
    this.couponCode = const Value.absent(),
    this.billingAddressName = const Value.absent(),
    this.shippingAddressName = const Value.absent(),
    this.yourInitial = const Value.absent(),
    @required double subTotal,
    @required double taxTotal,
    @required double depositTotal,
    @required double discountTotal,
    @required double shippingTotal,
    @required int itemCount,
    @required double grandTotal,
    @required String discountType,
    @required double discountPercentage,
    @required double discountAmount,
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.transactionStart = const Value.absent(),
    this.transactionEnd = const Value.absent(),
  })  : userName = Value(userName),
        userId = Value(userId),
        transactionNumber = Value(transactionNumber),
        inventoryCycleNumber = Value(inventoryCycleNumber),
        daySessionNumber = Value(daySessionNumber),
        customerId = Value(customerId),
        orderDate = Value(orderDate),
        deliveryDate = Value(deliveryDate),
        orderType = Value(orderType),
        orderStatus = Value(orderStatus),
        currency = Value(currency),
        exchangeRate = Value(exchangeRate),
        subTotal = Value(subTotal),
        taxTotal = Value(taxTotal),
        depositTotal = Value(depositTotal),
        discountTotal = Value(discountTotal),
        shippingTotal = Value(shippingTotal),
        itemCount = Value(itemCount),
        grandTotal = Value(grandTotal),
        discountType = Value(discountType),
        discountPercentage = Value(discountPercentage),
        discountAmount = Value(discountAmount);
  static Insertable<SalesOrderHeaderData> custom({
    Expression<int> tenantId,
    Expression<String> userName,
    Expression<int> userId,
    Expression<int> id,
    Expression<String> transactionNumber,
    Expression<String> transactionStatus,
    Expression<String> inventoryCycleNumber,
    Expression<String> daySessionNumber,
    Expression<String> customerId,
    Expression<String> soldTo,
    Expression<DateTime> orderDate,
    Expression<DateTime> deliveryDate,
    Expression<String> orderType,
    Expression<String> orderStatus,
    Expression<String> purchaseOrderNo,
    Expression<String> currency,
    Expression<double> exchangeRate,
    Expression<int> couponCode,
    Expression<String> billingAddressName,
    Expression<String> shippingAddressName,
    Expression<String> yourInitial,
    Expression<double> subTotal,
    Expression<double> taxTotal,
    Expression<double> depositTotal,
    Expression<double> discountTotal,
    Expression<double> shippingTotal,
    Expression<int> itemCount,
    Expression<double> grandTotal,
    Expression<String> discountType,
    Expression<double> discountPercentage,
    Expression<double> discountAmount,
    Expression<double> latitude,
    Expression<double> longitude,
    Expression<DateTime> transactionStart,
    Expression<DateTime> transactionEnd,
  }) {
    return RawValuesInsertable({
      if (tenantId != null) 'tenant_id': tenantId,
      if (userName != null) 'user_name': userName,
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (transactionNumber != null) 'transaction_number': transactionNumber,
      if (transactionStatus != null) 'transaction_status': transactionStatus,
      if (inventoryCycleNumber != null)
        'inventory_cycle_number': inventoryCycleNumber,
      if (daySessionNumber != null) 'day_session_number': daySessionNumber,
      if (customerId != null) 'customer_id': customerId,
      if (soldTo != null) 'sold_to': soldTo,
      if (orderDate != null) 'order_date': orderDate,
      if (deliveryDate != null) 'delivery_date': deliveryDate,
      if (orderType != null) 'order_type': orderType,
      if (orderStatus != null) 'order_status': orderStatus,
      if (purchaseOrderNo != null) 'purchase_order_no': purchaseOrderNo,
      if (currency != null) 'currency': currency,
      if (exchangeRate != null) 'exchange_rate': exchangeRate,
      if (couponCode != null) 'coupon_code': couponCode,
      if (billingAddressName != null)
        'billing_address_name': billingAddressName,
      if (shippingAddressName != null)
        'shipping_address_name': shippingAddressName,
      if (yourInitial != null) 'your_initial': yourInitial,
      if (subTotal != null) 'sub_total': subTotal,
      if (taxTotal != null) 'tax_total': taxTotal,
      if (depositTotal != null) 'deposit_total': depositTotal,
      if (discountTotal != null) 'discount_total': discountTotal,
      if (shippingTotal != null) 'shipping_total': shippingTotal,
      if (itemCount != null) 'item_count': itemCount,
      if (grandTotal != null) 'grand_total': grandTotal,
      if (discountType != null) 'discount_type': discountType,
      if (discountPercentage != null) 'discount_percentage': discountPercentage,
      if (discountAmount != null) 'discount_amount': discountAmount,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (transactionStart != null) 'transaction_start': transactionStart,
      if (transactionEnd != null) 'transaction_end': transactionEnd,
    });
  }

  SalesOrderHeaderCompanion copyWith(
      {Value<int> tenantId,
      Value<String> userName,
      Value<int> userId,
      Value<int> id,
      Value<String> transactionNumber,
      Value<String> transactionStatus,
      Value<String> inventoryCycleNumber,
      Value<String> daySessionNumber,
      Value<String> customerId,
      Value<String> soldTo,
      Value<DateTime> orderDate,
      Value<DateTime> deliveryDate,
      Value<String> orderType,
      Value<String> orderStatus,
      Value<String> purchaseOrderNo,
      Value<String> currency,
      Value<double> exchangeRate,
      Value<int> couponCode,
      Value<String> billingAddressName,
      Value<String> shippingAddressName,
      Value<String> yourInitial,
      Value<double> subTotal,
      Value<double> taxTotal,
      Value<double> depositTotal,
      Value<double> discountTotal,
      Value<double> shippingTotal,
      Value<int> itemCount,
      Value<double> grandTotal,
      Value<String> discountType,
      Value<double> discountPercentage,
      Value<double> discountAmount,
      Value<double> latitude,
      Value<double> longitude,
      Value<DateTime> transactionStart,
      Value<DateTime> transactionEnd}) {
    return SalesOrderHeaderCompanion(
      tenantId: tenantId ?? this.tenantId,
      userName: userName ?? this.userName,
      userId: userId ?? this.userId,
      id: id ?? this.id,
      transactionNumber: transactionNumber ?? this.transactionNumber,
      transactionStatus: transactionStatus ?? this.transactionStatus,
      inventoryCycleNumber: inventoryCycleNumber ?? this.inventoryCycleNumber,
      daySessionNumber: daySessionNumber ?? this.daySessionNumber,
      customerId: customerId ?? this.customerId,
      soldTo: soldTo ?? this.soldTo,
      orderDate: orderDate ?? this.orderDate,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      orderType: orderType ?? this.orderType,
      orderStatus: orderStatus ?? this.orderStatus,
      purchaseOrderNo: purchaseOrderNo ?? this.purchaseOrderNo,
      currency: currency ?? this.currency,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      couponCode: couponCode ?? this.couponCode,
      billingAddressName: billingAddressName ?? this.billingAddressName,
      shippingAddressName: shippingAddressName ?? this.shippingAddressName,
      yourInitial: yourInitial ?? this.yourInitial,
      subTotal: subTotal ?? this.subTotal,
      taxTotal: taxTotal ?? this.taxTotal,
      depositTotal: depositTotal ?? this.depositTotal,
      discountTotal: discountTotal ?? this.discountTotal,
      shippingTotal: shippingTotal ?? this.shippingTotal,
      itemCount: itemCount ?? this.itemCount,
      grandTotal: grandTotal ?? this.grandTotal,
      discountType: discountType ?? this.discountType,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      discountAmount: discountAmount ?? this.discountAmount,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      transactionStart: transactionStart ?? this.transactionStart,
      transactionEnd: transactionEnd ?? this.transactionEnd,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (transactionNumber.present) {
      map['transaction_number'] = Variable<String>(transactionNumber.value);
    }
    if (transactionStatus.present) {
      map['transaction_status'] = Variable<String>(transactionStatus.value);
    }
    if (inventoryCycleNumber.present) {
      map['inventory_cycle_number'] =
          Variable<String>(inventoryCycleNumber.value);
    }
    if (daySessionNumber.present) {
      map['day_session_number'] = Variable<String>(daySessionNumber.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (soldTo.present) {
      map['sold_to'] = Variable<String>(soldTo.value);
    }
    if (orderDate.present) {
      map['order_date'] = Variable<DateTime>(orderDate.value);
    }
    if (deliveryDate.present) {
      map['delivery_date'] = Variable<DateTime>(deliveryDate.value);
    }
    if (orderType.present) {
      map['order_type'] = Variable<String>(orderType.value);
    }
    if (orderStatus.present) {
      map['order_status'] = Variable<String>(orderStatus.value);
    }
    if (purchaseOrderNo.present) {
      map['purchase_order_no'] = Variable<String>(purchaseOrderNo.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (exchangeRate.present) {
      map['exchange_rate'] = Variable<double>(exchangeRate.value);
    }
    if (couponCode.present) {
      map['coupon_code'] = Variable<int>(couponCode.value);
    }
    if (billingAddressName.present) {
      map['billing_address_name'] = Variable<String>(billingAddressName.value);
    }
    if (shippingAddressName.present) {
      map['shipping_address_name'] =
          Variable<String>(shippingAddressName.value);
    }
    if (yourInitial.present) {
      map['your_initial'] = Variable<String>(yourInitial.value);
    }
    if (subTotal.present) {
      map['sub_total'] = Variable<double>(subTotal.value);
    }
    if (taxTotal.present) {
      map['tax_total'] = Variable<double>(taxTotal.value);
    }
    if (depositTotal.present) {
      map['deposit_total'] = Variable<double>(depositTotal.value);
    }
    if (discountTotal.present) {
      map['discount_total'] = Variable<double>(discountTotal.value);
    }
    if (shippingTotal.present) {
      map['shipping_total'] = Variable<double>(shippingTotal.value);
    }
    if (itemCount.present) {
      map['item_count'] = Variable<int>(itemCount.value);
    }
    if (grandTotal.present) {
      map['grand_total'] = Variable<double>(grandTotal.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>(discountType.value);
    }
    if (discountPercentage.present) {
      map['discount_percentage'] = Variable<double>(discountPercentage.value);
    }
    if (discountAmount.present) {
      map['discount_amount'] = Variable<double>(discountAmount.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (transactionStart.present) {
      map['transaction_start'] = Variable<DateTime>(transactionStart.value);
    }
    if (transactionEnd.present) {
      map['transaction_end'] = Variable<DateTime>(transactionEnd.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesOrderHeaderCompanion(')
          ..write('tenantId: $tenantId, ')
          ..write('userName: $userName, ')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('transactionNumber: $transactionNumber, ')
          ..write('transactionStatus: $transactionStatus, ')
          ..write('inventoryCycleNumber: $inventoryCycleNumber, ')
          ..write('daySessionNumber: $daySessionNumber, ')
          ..write('customerId: $customerId, ')
          ..write('soldTo: $soldTo, ')
          ..write('orderDate: $orderDate, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('orderType: $orderType, ')
          ..write('orderStatus: $orderStatus, ')
          ..write('purchaseOrderNo: $purchaseOrderNo, ')
          ..write('currency: $currency, ')
          ..write('exchangeRate: $exchangeRate, ')
          ..write('couponCode: $couponCode, ')
          ..write('billingAddressName: $billingAddressName, ')
          ..write('shippingAddressName: $shippingAddressName, ')
          ..write('yourInitial: $yourInitial, ')
          ..write('subTotal: $subTotal, ')
          ..write('taxTotal: $taxTotal, ')
          ..write('depositTotal: $depositTotal, ')
          ..write('discountTotal: $discountTotal, ')
          ..write('shippingTotal: $shippingTotal, ')
          ..write('itemCount: $itemCount, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('discountType: $discountType, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('transactionStart: $transactionStart, ')
          ..write('transactionEnd: $transactionEnd')
          ..write(')'))
        .toString();
  }
}

class $SalesOrderHeaderTable extends SalesOrderHeader
    with TableInfo<$SalesOrderHeaderTable, SalesOrderHeaderData> {
  final GeneratedDatabase _db;
  final String _alias;
  $SalesOrderHeaderTable(this._db, [this._alias]);
  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  GeneratedColumn<int> _tenantId;
  @override
  GeneratedColumn<int> get tenantId =>
      _tenantId ??= GeneratedColumn<int>('tenant_id', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  GeneratedColumn<String> _userName;
  @override
  GeneratedColumn<String> get userName =>
      _userName ??= GeneratedColumn<String>('user_name', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedColumn<int> _userId;
  @override
  GeneratedColumn<int> get userId =>
      _userId ??= GeneratedColumn<int>('user_id', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _transactionNumberMeta =
      const VerificationMeta('transactionNumber');
  GeneratedColumn<String> _transactionNumber;
  @override
  GeneratedColumn<String> get transactionNumber => _transactionNumber ??=
      GeneratedColumn<String>('transaction_number', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _transactionStatusMeta =
      const VerificationMeta('transactionStatus');
  GeneratedColumn<String> _transactionStatus;
  @override
  GeneratedColumn<String> get transactionStatus => _transactionStatus ??=
      GeneratedColumn<String>('transaction_status', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _inventoryCycleNumberMeta =
      const VerificationMeta('inventoryCycleNumber');
  GeneratedColumn<String> _inventoryCycleNumber;
  @override
  GeneratedColumn<String> get inventoryCycleNumber => _inventoryCycleNumber ??=
      GeneratedColumn<String>('inventory_cycle_number', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _daySessionNumberMeta =
      const VerificationMeta('daySessionNumber');
  GeneratedColumn<String> _daySessionNumber;
  @override
  GeneratedColumn<String> get daySessionNumber => _daySessionNumber ??=
      GeneratedColumn<String>('day_session_number', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _customerIdMeta = const VerificationMeta('customerId');
  GeneratedColumn<String> _customerId;
  @override
  GeneratedColumn<String> get customerId =>
      _customerId ??= GeneratedColumn<String>('customer_id', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _soldToMeta = const VerificationMeta('soldTo');
  GeneratedColumn<String> _soldTo;
  @override
  GeneratedColumn<String> get soldTo =>
      _soldTo ??= GeneratedColumn<String>('sold_to', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _orderDateMeta = const VerificationMeta('orderDate');
  GeneratedColumn<DateTime> _orderDate;
  @override
  GeneratedColumn<DateTime> get orderDate =>
      _orderDate ??= GeneratedColumn<DateTime>('order_date', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _deliveryDateMeta =
      const VerificationMeta('deliveryDate');
  GeneratedColumn<DateTime> _deliveryDate;
  @override
  GeneratedColumn<DateTime> get deliveryDate => _deliveryDate ??=
      GeneratedColumn<DateTime>('delivery_date', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _orderTypeMeta = const VerificationMeta('orderType');
  GeneratedColumn<String> _orderType;
  @override
  GeneratedColumn<String> get orderType =>
      _orderType ??= GeneratedColumn<String>('order_type', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _orderStatusMeta =
      const VerificationMeta('orderStatus');
  GeneratedColumn<String> _orderStatus;
  @override
  GeneratedColumn<String> get orderStatus => _orderStatus ??=
      GeneratedColumn<String>('order_status', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _purchaseOrderNoMeta =
      const VerificationMeta('purchaseOrderNo');
  GeneratedColumn<String> _purchaseOrderNo;
  @override
  GeneratedColumn<String> get purchaseOrderNo => _purchaseOrderNo ??=
      GeneratedColumn<String>('purchase_order_no', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _currencyMeta = const VerificationMeta('currency');
  GeneratedColumn<String> _currency;
  @override
  GeneratedColumn<String> get currency =>
      _currency ??= GeneratedColumn<String>('currency', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _exchangeRateMeta =
      const VerificationMeta('exchangeRate');
  GeneratedColumn<double> _exchangeRate;
  @override
  GeneratedColumn<double> get exchangeRate => _exchangeRate ??=
      GeneratedColumn<double>('exchange_rate', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _couponCodeMeta = const VerificationMeta('couponCode');
  GeneratedColumn<int> _couponCode;
  @override
  GeneratedColumn<int> get couponCode =>
      _couponCode ??= GeneratedColumn<int>('coupon_code', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _billingAddressNameMeta =
      const VerificationMeta('billingAddressName');
  GeneratedColumn<String> _billingAddressName;
  @override
  GeneratedColumn<String> get billingAddressName => _billingAddressName ??=
      GeneratedColumn<String>('billing_address_name', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _shippingAddressNameMeta =
      const VerificationMeta('shippingAddressName');
  GeneratedColumn<String> _shippingAddressName;
  @override
  GeneratedColumn<String> get shippingAddressName => _shippingAddressName ??=
      GeneratedColumn<String>('shipping_address_name', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _yourInitialMeta =
      const VerificationMeta('yourInitial');
  GeneratedColumn<String> _yourInitial;
  @override
  GeneratedColumn<String> get yourInitial => _yourInitial ??=
      GeneratedColumn<String>('your_initial', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _subTotalMeta = const VerificationMeta('subTotal');
  GeneratedColumn<double> _subTotal;
  @override
  GeneratedColumn<double> get subTotal =>
      _subTotal ??= GeneratedColumn<double>('sub_total', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _taxTotalMeta = const VerificationMeta('taxTotal');
  GeneratedColumn<double> _taxTotal;
  @override
  GeneratedColumn<double> get taxTotal =>
      _taxTotal ??= GeneratedColumn<double>('tax_total', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _depositTotalMeta =
      const VerificationMeta('depositTotal');
  GeneratedColumn<double> _depositTotal;
  @override
  GeneratedColumn<double> get depositTotal => _depositTotal ??=
      GeneratedColumn<double>('deposit_total', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _discountTotalMeta =
      const VerificationMeta('discountTotal');
  GeneratedColumn<double> _discountTotal;
  @override
  GeneratedColumn<double> get discountTotal => _discountTotal ??=
      GeneratedColumn<double>('discount_total', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _shippingTotalMeta =
      const VerificationMeta('shippingTotal');
  GeneratedColumn<double> _shippingTotal;
  @override
  GeneratedColumn<double> get shippingTotal => _shippingTotal ??=
      GeneratedColumn<double>('shipping_total', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _itemCountMeta = const VerificationMeta('itemCount');
  GeneratedColumn<int> _itemCount;
  @override
  GeneratedColumn<int> get itemCount =>
      _itemCount ??= GeneratedColumn<int>('item_count', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _grandTotalMeta = const VerificationMeta('grandTotal');
  GeneratedColumn<double> _grandTotal;
  @override
  GeneratedColumn<double> get grandTotal =>
      _grandTotal ??= GeneratedColumn<double>('grand_total', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _discountTypeMeta =
      const VerificationMeta('discountType');
  GeneratedColumn<String> _discountType;
  @override
  GeneratedColumn<String> get discountType => _discountType ??=
      GeneratedColumn<String>('discount_type', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _discountPercentageMeta =
      const VerificationMeta('discountPercentage');
  GeneratedColumn<double> _discountPercentage;
  @override
  GeneratedColumn<double> get discountPercentage => _discountPercentage ??=
      GeneratedColumn<double>('discount_percentage', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _discountAmountMeta =
      const VerificationMeta('discountAmount');
  GeneratedColumn<double> _discountAmount;
  @override
  GeneratedColumn<double> get discountAmount => _discountAmount ??=
      GeneratedColumn<double>('discount_amount', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  GeneratedColumn<double> _latitude;
  @override
  GeneratedColumn<double> get latitude =>
      _latitude ??= GeneratedColumn<double>('latitude', aliasedName, true,
          type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  GeneratedColumn<double> _longitude;
  @override
  GeneratedColumn<double> get longitude =>
      _longitude ??= GeneratedColumn<double>('longitude', aliasedName, true,
          type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _transactionStartMeta =
      const VerificationMeta('transactionStart');
  GeneratedColumn<DateTime> _transactionStart;
  @override
  GeneratedColumn<DateTime> get transactionStart => _transactionStart ??=
      GeneratedColumn<DateTime>('transaction_start', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _transactionEndMeta =
      const VerificationMeta('transactionEnd');
  GeneratedColumn<DateTime> _transactionEnd;
  @override
  GeneratedColumn<DateTime> get transactionEnd => _transactionEnd ??=
      GeneratedColumn<DateTime>('transaction_end', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        tenantId,
        userName,
        userId,
        id,
        transactionNumber,
        transactionStatus,
        inventoryCycleNumber,
        daySessionNumber,
        customerId,
        soldTo,
        orderDate,
        deliveryDate,
        orderType,
        orderStatus,
        purchaseOrderNo,
        currency,
        exchangeRate,
        couponCode,
        billingAddressName,
        shippingAddressName,
        yourInitial,
        subTotal,
        taxTotal,
        depositTotal,
        discountTotal,
        shippingTotal,
        itemCount,
        grandTotal,
        discountType,
        discountPercentage,
        discountAmount,
        latitude,
        longitude,
        transactionStart,
        transactionEnd
      ];
  @override
  String get aliasedName => _alias ?? 'sales_order_header';
  @override
  String get actualTableName => 'sales_order_header';
  @override
  VerificationContext validateIntegrity(
      Insertable<SalesOrderHeaderData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id'], _tenantIdMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name'], _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('transaction_number')) {
      context.handle(
          _transactionNumberMeta,
          transactionNumber.isAcceptableOrUnknown(
              data['transaction_number'], _transactionNumberMeta));
    } else if (isInserting) {
      context.missing(_transactionNumberMeta);
    }
    if (data.containsKey('transaction_status')) {
      context.handle(
          _transactionStatusMeta,
          transactionStatus.isAcceptableOrUnknown(
              data['transaction_status'], _transactionStatusMeta));
    }
    if (data.containsKey('inventory_cycle_number')) {
      context.handle(
          _inventoryCycleNumberMeta,
          inventoryCycleNumber.isAcceptableOrUnknown(
              data['inventory_cycle_number'], _inventoryCycleNumberMeta));
    } else if (isInserting) {
      context.missing(_inventoryCycleNumberMeta);
    }
    if (data.containsKey('day_session_number')) {
      context.handle(
          _daySessionNumberMeta,
          daySessionNumber.isAcceptableOrUnknown(
              data['day_session_number'], _daySessionNumberMeta));
    } else if (isInserting) {
      context.missing(_daySessionNumberMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id'], _customerIdMeta));
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('sold_to')) {
      context.handle(_soldToMeta,
          soldTo.isAcceptableOrUnknown(data['sold_to'], _soldToMeta));
    }
    if (data.containsKey('order_date')) {
      context.handle(_orderDateMeta,
          orderDate.isAcceptableOrUnknown(data['order_date'], _orderDateMeta));
    } else if (isInserting) {
      context.missing(_orderDateMeta);
    }
    if (data.containsKey('delivery_date')) {
      context.handle(
          _deliveryDateMeta,
          deliveryDate.isAcceptableOrUnknown(
              data['delivery_date'], _deliveryDateMeta));
    } else if (isInserting) {
      context.missing(_deliveryDateMeta);
    }
    if (data.containsKey('order_type')) {
      context.handle(_orderTypeMeta,
          orderType.isAcceptableOrUnknown(data['order_type'], _orderTypeMeta));
    } else if (isInserting) {
      context.missing(_orderTypeMeta);
    }
    if (data.containsKey('order_status')) {
      context.handle(
          _orderStatusMeta,
          orderStatus.isAcceptableOrUnknown(
              data['order_status'], _orderStatusMeta));
    } else if (isInserting) {
      context.missing(_orderStatusMeta);
    }
    if (data.containsKey('purchase_order_no')) {
      context.handle(
          _purchaseOrderNoMeta,
          purchaseOrderNo.isAcceptableOrUnknown(
              data['purchase_order_no'], _purchaseOrderNoMeta));
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency'], _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('exchange_rate')) {
      context.handle(
          _exchangeRateMeta,
          exchangeRate.isAcceptableOrUnknown(
              data['exchange_rate'], _exchangeRateMeta));
    } else if (isInserting) {
      context.missing(_exchangeRateMeta);
    }
    if (data.containsKey('coupon_code')) {
      context.handle(
          _couponCodeMeta,
          couponCode.isAcceptableOrUnknown(
              data['coupon_code'], _couponCodeMeta));
    }
    if (data.containsKey('billing_address_name')) {
      context.handle(
          _billingAddressNameMeta,
          billingAddressName.isAcceptableOrUnknown(
              data['billing_address_name'], _billingAddressNameMeta));
    }
    if (data.containsKey('shipping_address_name')) {
      context.handle(
          _shippingAddressNameMeta,
          shippingAddressName.isAcceptableOrUnknown(
              data['shipping_address_name'], _shippingAddressNameMeta));
    }
    if (data.containsKey('your_initial')) {
      context.handle(
          _yourInitialMeta,
          yourInitial.isAcceptableOrUnknown(
              data['your_initial'], _yourInitialMeta));
    }
    if (data.containsKey('sub_total')) {
      context.handle(_subTotalMeta,
          subTotal.isAcceptableOrUnknown(data['sub_total'], _subTotalMeta));
    } else if (isInserting) {
      context.missing(_subTotalMeta);
    }
    if (data.containsKey('tax_total')) {
      context.handle(_taxTotalMeta,
          taxTotal.isAcceptableOrUnknown(data['tax_total'], _taxTotalMeta));
    } else if (isInserting) {
      context.missing(_taxTotalMeta);
    }
    if (data.containsKey('deposit_total')) {
      context.handle(
          _depositTotalMeta,
          depositTotal.isAcceptableOrUnknown(
              data['deposit_total'], _depositTotalMeta));
    } else if (isInserting) {
      context.missing(_depositTotalMeta);
    }
    if (data.containsKey('discount_total')) {
      context.handle(
          _discountTotalMeta,
          discountTotal.isAcceptableOrUnknown(
              data['discount_total'], _discountTotalMeta));
    } else if (isInserting) {
      context.missing(_discountTotalMeta);
    }
    if (data.containsKey('shipping_total')) {
      context.handle(
          _shippingTotalMeta,
          shippingTotal.isAcceptableOrUnknown(
              data['shipping_total'], _shippingTotalMeta));
    } else if (isInserting) {
      context.missing(_shippingTotalMeta);
    }
    if (data.containsKey('item_count')) {
      context.handle(_itemCountMeta,
          itemCount.isAcceptableOrUnknown(data['item_count'], _itemCountMeta));
    } else if (isInserting) {
      context.missing(_itemCountMeta);
    }
    if (data.containsKey('grand_total')) {
      context.handle(
          _grandTotalMeta,
          grandTotal.isAcceptableOrUnknown(
              data['grand_total'], _grandTotalMeta));
    } else if (isInserting) {
      context.missing(_grandTotalMeta);
    }
    if (data.containsKey('discount_type')) {
      context.handle(
          _discountTypeMeta,
          discountType.isAcceptableOrUnknown(
              data['discount_type'], _discountTypeMeta));
    } else if (isInserting) {
      context.missing(_discountTypeMeta);
    }
    if (data.containsKey('discount_percentage')) {
      context.handle(
          _discountPercentageMeta,
          discountPercentage.isAcceptableOrUnknown(
              data['discount_percentage'], _discountPercentageMeta));
    } else if (isInserting) {
      context.missing(_discountPercentageMeta);
    }
    if (data.containsKey('discount_amount')) {
      context.handle(
          _discountAmountMeta,
          discountAmount.isAcceptableOrUnknown(
              data['discount_amount'], _discountAmountMeta));
    } else if (isInserting) {
      context.missing(_discountAmountMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude'], _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude'], _longitudeMeta));
    }
    if (data.containsKey('transaction_start')) {
      context.handle(
          _transactionStartMeta,
          transactionStart.isAcceptableOrUnknown(
              data['transaction_start'], _transactionStartMeta));
    }
    if (data.containsKey('transaction_end')) {
      context.handle(
          _transactionEndMeta,
          transactionEnd.isAcceptableOrUnknown(
              data['transaction_end'], _transactionEndMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesOrderHeaderData map(Map<String, dynamic> data, {String tablePrefix}) {
    return SalesOrderHeaderData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SalesOrderHeaderTable createAlias(String alias) {
    return $SalesOrderHeaderTable(_db, alias);
  }
}

class SalesOrderDetailData extends DataClass
    implements Insertable<SalesOrderDetailData> {
  final int tenantId;
  final String userName;
  final int userId;
  final int id;
  final String transactionNumber;
  final String inventoryCycleNumber;
  final String daySessionNumber;
  final DateTime deliveryDate;
  final String currency;
  final double exchangeRate;
  final String transactionStatus;
  final String itemId;
  final String itemCode;
  final String upcCode;
  final String description;
  final String itemGroup;
  final String category;
  final String salesUOM;
  final String stockUOM;
  final String taxGroup;
  final String warehouse;
  final String discountType;
  final double discountPercentage;
  final double discountAmount;
  final double lineDiscountTotal;
  final String taxIndicator;
  final double unitPrice;
  final double costPrice;
  final double listPrice;
  final double quantity;
  final double subTotal;
  final double grandTotal;
  final double fxGrandTotal;
  final int itemCount;
  final double depositTotal;
  final int lineId;
  final double taxTotal;
  final double shippingTotal;
  final double conversionFactor;
  SalesOrderDetailData(
      {this.tenantId,
      @required this.userName,
      @required this.userId,
      @required this.id,
      @required this.transactionNumber,
      @required this.inventoryCycleNumber,
      @required this.daySessionNumber,
      @required this.deliveryDate,
      @required this.currency,
      @required this.exchangeRate,
      this.transactionStatus,
      this.itemId,
      @required this.itemCode,
      @required this.upcCode,
      @required this.description,
      @required this.itemGroup,
      @required this.category,
      @required this.salesUOM,
      @required this.stockUOM,
      @required this.taxGroup,
      @required this.warehouse,
      @required this.discountType,
      @required this.discountPercentage,
      @required this.discountAmount,
      @required this.lineDiscountTotal,
      this.taxIndicator,
      @required this.unitPrice,
      @required this.costPrice,
      @required this.listPrice,
      @required this.quantity,
      @required this.subTotal,
      @required this.grandTotal,
      @required this.fxGrandTotal,
      this.itemCount,
      this.depositTotal,
      this.lineId,
      @required this.taxTotal,
      @required this.shippingTotal,
      @required this.conversionFactor});
  factory SalesOrderDetailData.fromData(Map<String, dynamic> data,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return SalesOrderDetailData(
      tenantId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tenant_id']),
      userName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name']),
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      transactionNumber: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}transaction_number']),
      inventoryCycleNumber: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}inventory_cycle_number']),
      daySessionNumber: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}day_session_number']),
      deliveryDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}delivery_date']),
      currency: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}currency']),
      exchangeRate: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}exchange_rate']),
      transactionStatus: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}transaction_status']),
      itemId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}item_id']),
      itemCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}item_code']),
      upcCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}upc_code']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      itemGroup: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}item_group']),
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
      salesUOM: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sales_u_o_m']),
      stockUOM: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stock_u_o_m']),
      taxGroup: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tax_group']),
      warehouse: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}warehouse']),
      discountType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}discount_type']),
      discountPercentage: const RealType().mapFromDatabaseResponse(
          data['${effectivePrefix}discount_percentage']),
      discountAmount: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}discount_amount']),
      lineDiscountTotal: const RealType().mapFromDatabaseResponse(
          data['${effectivePrefix}line_discount_total']),
      taxIndicator: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tax_indicator']),
      unitPrice: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unit_price']),
      costPrice: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cost_price']),
      listPrice: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}list_price']),
      quantity: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantity']),
      subTotal: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sub_total']),
      grandTotal: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}grand_total']),
      fxGrandTotal: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fx_grand_total']),
      itemCount: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}item_count']),
      depositTotal: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}deposit_total']),
      lineId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}line_id']),
      taxTotal: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tax_total']),
      shippingTotal: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}shipping_total']),
      conversionFactor: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}conversion_factor']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || tenantId != null) {
      map['tenant_id'] = Variable<int>(tenantId);
    }
    if (!nullToAbsent || userName != null) {
      map['user_name'] = Variable<String>(userName);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || transactionNumber != null) {
      map['transaction_number'] = Variable<String>(transactionNumber);
    }
    if (!nullToAbsent || inventoryCycleNumber != null) {
      map['inventory_cycle_number'] = Variable<String>(inventoryCycleNumber);
    }
    if (!nullToAbsent || daySessionNumber != null) {
      map['day_session_number'] = Variable<String>(daySessionNumber);
    }
    if (!nullToAbsent || deliveryDate != null) {
      map['delivery_date'] = Variable<DateTime>(deliveryDate);
    }
    if (!nullToAbsent || currency != null) {
      map['currency'] = Variable<String>(currency);
    }
    if (!nullToAbsent || exchangeRate != null) {
      map['exchange_rate'] = Variable<double>(exchangeRate);
    }
    if (!nullToAbsent || transactionStatus != null) {
      map['transaction_status'] = Variable<String>(transactionStatus);
    }
    if (!nullToAbsent || itemId != null) {
      map['item_id'] = Variable<String>(itemId);
    }
    if (!nullToAbsent || itemCode != null) {
      map['item_code'] = Variable<String>(itemCode);
    }
    if (!nullToAbsent || upcCode != null) {
      map['upc_code'] = Variable<String>(upcCode);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || itemGroup != null) {
      map['item_group'] = Variable<String>(itemGroup);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || salesUOM != null) {
      map['sales_u_o_m'] = Variable<String>(salesUOM);
    }
    if (!nullToAbsent || stockUOM != null) {
      map['stock_u_o_m'] = Variable<String>(stockUOM);
    }
    if (!nullToAbsent || taxGroup != null) {
      map['tax_group'] = Variable<String>(taxGroup);
    }
    if (!nullToAbsent || warehouse != null) {
      map['warehouse'] = Variable<String>(warehouse);
    }
    if (!nullToAbsent || discountType != null) {
      map['discount_type'] = Variable<String>(discountType);
    }
    if (!nullToAbsent || discountPercentage != null) {
      map['discount_percentage'] = Variable<double>(discountPercentage);
    }
    if (!nullToAbsent || discountAmount != null) {
      map['discount_amount'] = Variable<double>(discountAmount);
    }
    if (!nullToAbsent || lineDiscountTotal != null) {
      map['line_discount_total'] = Variable<double>(lineDiscountTotal);
    }
    if (!nullToAbsent || taxIndicator != null) {
      map['tax_indicator'] = Variable<String>(taxIndicator);
    }
    if (!nullToAbsent || unitPrice != null) {
      map['unit_price'] = Variable<double>(unitPrice);
    }
    if (!nullToAbsent || costPrice != null) {
      map['cost_price'] = Variable<double>(costPrice);
    }
    if (!nullToAbsent || listPrice != null) {
      map['list_price'] = Variable<double>(listPrice);
    }
    if (!nullToAbsent || quantity != null) {
      map['quantity'] = Variable<double>(quantity);
    }
    if (!nullToAbsent || subTotal != null) {
      map['sub_total'] = Variable<double>(subTotal);
    }
    if (!nullToAbsent || grandTotal != null) {
      map['grand_total'] = Variable<double>(grandTotal);
    }
    if (!nullToAbsent || fxGrandTotal != null) {
      map['fx_grand_total'] = Variable<double>(fxGrandTotal);
    }
    if (!nullToAbsent || itemCount != null) {
      map['item_count'] = Variable<int>(itemCount);
    }
    if (!nullToAbsent || depositTotal != null) {
      map['deposit_total'] = Variable<double>(depositTotal);
    }
    if (!nullToAbsent || lineId != null) {
      map['line_id'] = Variable<int>(lineId);
    }
    if (!nullToAbsent || taxTotal != null) {
      map['tax_total'] = Variable<double>(taxTotal);
    }
    if (!nullToAbsent || shippingTotal != null) {
      map['shipping_total'] = Variable<double>(shippingTotal);
    }
    if (!nullToAbsent || conversionFactor != null) {
      map['conversion_factor'] = Variable<double>(conversionFactor);
    }
    return map;
  }

  SalesOrderDetailCompanion toCompanion(bool nullToAbsent) {
    return SalesOrderDetailCompanion(
      tenantId: tenantId == null && nullToAbsent
          ? const Value.absent()
          : Value(tenantId),
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      transactionNumber: transactionNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionNumber),
      inventoryCycleNumber: inventoryCycleNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(inventoryCycleNumber),
      daySessionNumber: daySessionNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(daySessionNumber),
      deliveryDate: deliveryDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryDate),
      currency: currency == null && nullToAbsent
          ? const Value.absent()
          : Value(currency),
      exchangeRate: exchangeRate == null && nullToAbsent
          ? const Value.absent()
          : Value(exchangeRate),
      transactionStatus: transactionStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionStatus),
      itemId:
          itemId == null && nullToAbsent ? const Value.absent() : Value(itemId),
      itemCode: itemCode == null && nullToAbsent
          ? const Value.absent()
          : Value(itemCode),
      upcCode: upcCode == null && nullToAbsent
          ? const Value.absent()
          : Value(upcCode),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      itemGroup: itemGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(itemGroup),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      salesUOM: salesUOM == null && nullToAbsent
          ? const Value.absent()
          : Value(salesUOM),
      stockUOM: stockUOM == null && nullToAbsent
          ? const Value.absent()
          : Value(stockUOM),
      taxGroup: taxGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(taxGroup),
      warehouse: warehouse == null && nullToAbsent
          ? const Value.absent()
          : Value(warehouse),
      discountType: discountType == null && nullToAbsent
          ? const Value.absent()
          : Value(discountType),
      discountPercentage: discountPercentage == null && nullToAbsent
          ? const Value.absent()
          : Value(discountPercentage),
      discountAmount: discountAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(discountAmount),
      lineDiscountTotal: lineDiscountTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(lineDiscountTotal),
      taxIndicator: taxIndicator == null && nullToAbsent
          ? const Value.absent()
          : Value(taxIndicator),
      unitPrice: unitPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(unitPrice),
      costPrice: costPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(costPrice),
      listPrice: listPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(listPrice),
      quantity: quantity == null && nullToAbsent
          ? const Value.absent()
          : Value(quantity),
      subTotal: subTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(subTotal),
      grandTotal: grandTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(grandTotal),
      fxGrandTotal: fxGrandTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(fxGrandTotal),
      itemCount: itemCount == null && nullToAbsent
          ? const Value.absent()
          : Value(itemCount),
      depositTotal: depositTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(depositTotal),
      lineId:
          lineId == null && nullToAbsent ? const Value.absent() : Value(lineId),
      taxTotal: taxTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(taxTotal),
      shippingTotal: shippingTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(shippingTotal),
      conversionFactor: conversionFactor == null && nullToAbsent
          ? const Value.absent()
          : Value(conversionFactor),
    );
  }

  factory SalesOrderDetailData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalesOrderDetailData(
      tenantId: serializer.fromJson<int>(json['tenantId']),
      userName: serializer.fromJson<String>(json['userName']),
      userId: serializer.fromJson<int>(json['userId']),
      id: serializer.fromJson<int>(json['id']),
      transactionNumber: serializer.fromJson<String>(json['transactionNumber']),
      inventoryCycleNumber:
          serializer.fromJson<String>(json['inventoryCycleNumber']),
      daySessionNumber: serializer.fromJson<String>(json['daySessionNumber']),
      deliveryDate: serializer.fromJson<DateTime>(json['deliveryDate']),
      currency: serializer.fromJson<String>(json['currency']),
      exchangeRate: serializer.fromJson<double>(json['exchangeRate']),
      transactionStatus: serializer.fromJson<String>(json['transactionStatus']),
      itemId: serializer.fromJson<String>(json['itemId']),
      itemCode: serializer.fromJson<String>(json['itemCode']),
      upcCode: serializer.fromJson<String>(json['upcCode']),
      description: serializer.fromJson<String>(json['description']),
      itemGroup: serializer.fromJson<String>(json['itemGroup']),
      category: serializer.fromJson<String>(json['category']),
      salesUOM: serializer.fromJson<String>(json['salesUOM']),
      stockUOM: serializer.fromJson<String>(json['stockUOM']),
      taxGroup: serializer.fromJson<String>(json['taxGroup']),
      warehouse: serializer.fromJson<String>(json['warehouse']),
      discountType: serializer.fromJson<String>(json['discountType']),
      discountPercentage:
          serializer.fromJson<double>(json['discountPercentage']),
      discountAmount: serializer.fromJson<double>(json['discountAmount']),
      lineDiscountTotal: serializer.fromJson<double>(json['lineDiscountTotal']),
      taxIndicator: serializer.fromJson<String>(json['taxIndicator']),
      unitPrice: serializer.fromJson<double>(json['unitPrice']),
      costPrice: serializer.fromJson<double>(json['costPrice']),
      listPrice: serializer.fromJson<double>(json['listPrice']),
      quantity: serializer.fromJson<double>(json['quantity']),
      subTotal: serializer.fromJson<double>(json['subTotal']),
      grandTotal: serializer.fromJson<double>(json['grandTotal']),
      fxGrandTotal: serializer.fromJson<double>(json['fxGrandTotal']),
      itemCount: serializer.fromJson<int>(json['itemCount']),
      depositTotal: serializer.fromJson<double>(json['depositTotal']),
      lineId: serializer.fromJson<int>(json['lineId']),
      taxTotal: serializer.fromJson<double>(json['taxTotal']),
      shippingTotal: serializer.fromJson<double>(json['shippingTotal']),
      conversionFactor: serializer.fromJson<double>(json['conversionFactor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tenantId': serializer.toJson<int>(tenantId),
      'userName': serializer.toJson<String>(userName),
      'userId': serializer.toJson<int>(userId),
      'id': serializer.toJson<int>(id),
      'transactionNumber': serializer.toJson<String>(transactionNumber),
      'inventoryCycleNumber': serializer.toJson<String>(inventoryCycleNumber),
      'daySessionNumber': serializer.toJson<String>(daySessionNumber),
      'deliveryDate': serializer.toJson<DateTime>(deliveryDate),
      'currency': serializer.toJson<String>(currency),
      'exchangeRate': serializer.toJson<double>(exchangeRate),
      'transactionStatus': serializer.toJson<String>(transactionStatus),
      'itemId': serializer.toJson<String>(itemId),
      'itemCode': serializer.toJson<String>(itemCode),
      'upcCode': serializer.toJson<String>(upcCode),
      'description': serializer.toJson<String>(description),
      'itemGroup': serializer.toJson<String>(itemGroup),
      'category': serializer.toJson<String>(category),
      'salesUOM': serializer.toJson<String>(salesUOM),
      'stockUOM': serializer.toJson<String>(stockUOM),
      'taxGroup': serializer.toJson<String>(taxGroup),
      'warehouse': serializer.toJson<String>(warehouse),
      'discountType': serializer.toJson<String>(discountType),
      'discountPercentage': serializer.toJson<double>(discountPercentage),
      'discountAmount': serializer.toJson<double>(discountAmount),
      'lineDiscountTotal': serializer.toJson<double>(lineDiscountTotal),
      'taxIndicator': serializer.toJson<String>(taxIndicator),
      'unitPrice': serializer.toJson<double>(unitPrice),
      'costPrice': serializer.toJson<double>(costPrice),
      'listPrice': serializer.toJson<double>(listPrice),
      'quantity': serializer.toJson<double>(quantity),
      'subTotal': serializer.toJson<double>(subTotal),
      'grandTotal': serializer.toJson<double>(grandTotal),
      'fxGrandTotal': serializer.toJson<double>(fxGrandTotal),
      'itemCount': serializer.toJson<int>(itemCount),
      'depositTotal': serializer.toJson<double>(depositTotal),
      'lineId': serializer.toJson<int>(lineId),
      'taxTotal': serializer.toJson<double>(taxTotal),
      'shippingTotal': serializer.toJson<double>(shippingTotal),
      'conversionFactor': serializer.toJson<double>(conversionFactor),
    };
  }

  SalesOrderDetailData copyWith(
          {int tenantId,
          String userName,
          int userId,
          int id,
          String transactionNumber,
          String inventoryCycleNumber,
          String daySessionNumber,
          DateTime deliveryDate,
          String currency,
          double exchangeRate,
          String transactionStatus,
          String itemId,
          String itemCode,
          String upcCode,
          String description,
          String itemGroup,
          String category,
          String salesUOM,
          String stockUOM,
          String taxGroup,
          String warehouse,
          String discountType,
          double discountPercentage,
          double discountAmount,
          double lineDiscountTotal,
          String taxIndicator,
          double unitPrice,
          double costPrice,
          double listPrice,
          double quantity,
          double subTotal,
          double grandTotal,
          double fxGrandTotal,
          int itemCount,
          double depositTotal,
          int lineId,
          double taxTotal,
          double shippingTotal,
          double conversionFactor}) =>
      SalesOrderDetailData(
        tenantId: tenantId ?? this.tenantId,
        userName: userName ?? this.userName,
        userId: userId ?? this.userId,
        id: id ?? this.id,
        transactionNumber: transactionNumber ?? this.transactionNumber,
        inventoryCycleNumber: inventoryCycleNumber ?? this.inventoryCycleNumber,
        daySessionNumber: daySessionNumber ?? this.daySessionNumber,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        currency: currency ?? this.currency,
        exchangeRate: exchangeRate ?? this.exchangeRate,
        transactionStatus: transactionStatus ?? this.transactionStatus,
        itemId: itemId ?? this.itemId,
        itemCode: itemCode ?? this.itemCode,
        upcCode: upcCode ?? this.upcCode,
        description: description ?? this.description,
        itemGroup: itemGroup ?? this.itemGroup,
        category: category ?? this.category,
        salesUOM: salesUOM ?? this.salesUOM,
        stockUOM: stockUOM ?? this.stockUOM,
        taxGroup: taxGroup ?? this.taxGroup,
        warehouse: warehouse ?? this.warehouse,
        discountType: discountType ?? this.discountType,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        discountAmount: discountAmount ?? this.discountAmount,
        lineDiscountTotal: lineDiscountTotal ?? this.lineDiscountTotal,
        taxIndicator: taxIndicator ?? this.taxIndicator,
        unitPrice: unitPrice ?? this.unitPrice,
        costPrice: costPrice ?? this.costPrice,
        listPrice: listPrice ?? this.listPrice,
        quantity: quantity ?? this.quantity,
        subTotal: subTotal ?? this.subTotal,
        grandTotal: grandTotal ?? this.grandTotal,
        fxGrandTotal: fxGrandTotal ?? this.fxGrandTotal,
        itemCount: itemCount ?? this.itemCount,
        depositTotal: depositTotal ?? this.depositTotal,
        lineId: lineId ?? this.lineId,
        taxTotal: taxTotal ?? this.taxTotal,
        shippingTotal: shippingTotal ?? this.shippingTotal,
        conversionFactor: conversionFactor ?? this.conversionFactor,
      );
  @override
  String toString() {
    return (StringBuffer('SalesOrderDetailData(')
          ..write('tenantId: $tenantId, ')
          ..write('userName: $userName, ')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('transactionNumber: $transactionNumber, ')
          ..write('inventoryCycleNumber: $inventoryCycleNumber, ')
          ..write('daySessionNumber: $daySessionNumber, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('currency: $currency, ')
          ..write('exchangeRate: $exchangeRate, ')
          ..write('transactionStatus: $transactionStatus, ')
          ..write('itemId: $itemId, ')
          ..write('itemCode: $itemCode, ')
          ..write('upcCode: $upcCode, ')
          ..write('description: $description, ')
          ..write('itemGroup: $itemGroup, ')
          ..write('category: $category, ')
          ..write('salesUOM: $salesUOM, ')
          ..write('stockUOM: $stockUOM, ')
          ..write('taxGroup: $taxGroup, ')
          ..write('warehouse: $warehouse, ')
          ..write('discountType: $discountType, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('lineDiscountTotal: $lineDiscountTotal, ')
          ..write('taxIndicator: $taxIndicator, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('costPrice: $costPrice, ')
          ..write('listPrice: $listPrice, ')
          ..write('quantity: $quantity, ')
          ..write('subTotal: $subTotal, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('fxGrandTotal: $fxGrandTotal, ')
          ..write('itemCount: $itemCount, ')
          ..write('depositTotal: $depositTotal, ')
          ..write('lineId: $lineId, ')
          ..write('taxTotal: $taxTotal, ')
          ..write('shippingTotal: $shippingTotal, ')
          ..write('conversionFactor: $conversionFactor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        tenantId,
        userName,
        userId,
        id,
        transactionNumber,
        inventoryCycleNumber,
        daySessionNumber,
        deliveryDate,
        currency,
        exchangeRate,
        transactionStatus,
        itemId,
        itemCode,
        upcCode,
        description,
        itemGroup,
        category,
        salesUOM,
        stockUOM,
        taxGroup,
        warehouse,
        discountType,
        discountPercentage,
        discountAmount,
        lineDiscountTotal,
        taxIndicator,
        unitPrice,
        costPrice,
        listPrice,
        quantity,
        subTotal,
        grandTotal,
        fxGrandTotal,
        itemCount,
        depositTotal,
        lineId,
        taxTotal,
        shippingTotal,
        conversionFactor
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesOrderDetailData &&
          other.tenantId == this.tenantId &&
          other.userName == this.userName &&
          other.userId == this.userId &&
          other.id == this.id &&
          other.transactionNumber == this.transactionNumber &&
          other.inventoryCycleNumber == this.inventoryCycleNumber &&
          other.daySessionNumber == this.daySessionNumber &&
          other.deliveryDate == this.deliveryDate &&
          other.currency == this.currency &&
          other.exchangeRate == this.exchangeRate &&
          other.transactionStatus == this.transactionStatus &&
          other.itemId == this.itemId &&
          other.itemCode == this.itemCode &&
          other.upcCode == this.upcCode &&
          other.description == this.description &&
          other.itemGroup == this.itemGroup &&
          other.category == this.category &&
          other.salesUOM == this.salesUOM &&
          other.stockUOM == this.stockUOM &&
          other.taxGroup == this.taxGroup &&
          other.warehouse == this.warehouse &&
          other.discountType == this.discountType &&
          other.discountPercentage == this.discountPercentage &&
          other.discountAmount == this.discountAmount &&
          other.lineDiscountTotal == this.lineDiscountTotal &&
          other.taxIndicator == this.taxIndicator &&
          other.unitPrice == this.unitPrice &&
          other.costPrice == this.costPrice &&
          other.listPrice == this.listPrice &&
          other.quantity == this.quantity &&
          other.subTotal == this.subTotal &&
          other.grandTotal == this.grandTotal &&
          other.fxGrandTotal == this.fxGrandTotal &&
          other.itemCount == this.itemCount &&
          other.depositTotal == this.depositTotal &&
          other.lineId == this.lineId &&
          other.taxTotal == this.taxTotal &&
          other.shippingTotal == this.shippingTotal &&
          other.conversionFactor == this.conversionFactor);
}

class SalesOrderDetailCompanion extends UpdateCompanion<SalesOrderDetailData> {
  final Value<int> tenantId;
  final Value<String> userName;
  final Value<int> userId;
  final Value<int> id;
  final Value<String> transactionNumber;
  final Value<String> inventoryCycleNumber;
  final Value<String> daySessionNumber;
  final Value<DateTime> deliveryDate;
  final Value<String> currency;
  final Value<double> exchangeRate;
  final Value<String> transactionStatus;
  final Value<String> itemId;
  final Value<String> itemCode;
  final Value<String> upcCode;
  final Value<String> description;
  final Value<String> itemGroup;
  final Value<String> category;
  final Value<String> salesUOM;
  final Value<String> stockUOM;
  final Value<String> taxGroup;
  final Value<String> warehouse;
  final Value<String> discountType;
  final Value<double> discountPercentage;
  final Value<double> discountAmount;
  final Value<double> lineDiscountTotal;
  final Value<String> taxIndicator;
  final Value<double> unitPrice;
  final Value<double> costPrice;
  final Value<double> listPrice;
  final Value<double> quantity;
  final Value<double> subTotal;
  final Value<double> grandTotal;
  final Value<double> fxGrandTotal;
  final Value<int> itemCount;
  final Value<double> depositTotal;
  final Value<int> lineId;
  final Value<double> taxTotal;
  final Value<double> shippingTotal;
  final Value<double> conversionFactor;
  const SalesOrderDetailCompanion({
    this.tenantId = const Value.absent(),
    this.userName = const Value.absent(),
    this.userId = const Value.absent(),
    this.id = const Value.absent(),
    this.transactionNumber = const Value.absent(),
    this.inventoryCycleNumber = const Value.absent(),
    this.daySessionNumber = const Value.absent(),
    this.deliveryDate = const Value.absent(),
    this.currency = const Value.absent(),
    this.exchangeRate = const Value.absent(),
    this.transactionStatus = const Value.absent(),
    this.itemId = const Value.absent(),
    this.itemCode = const Value.absent(),
    this.upcCode = const Value.absent(),
    this.description = const Value.absent(),
    this.itemGroup = const Value.absent(),
    this.category = const Value.absent(),
    this.salesUOM = const Value.absent(),
    this.stockUOM = const Value.absent(),
    this.taxGroup = const Value.absent(),
    this.warehouse = const Value.absent(),
    this.discountType = const Value.absent(),
    this.discountPercentage = const Value.absent(),
    this.discountAmount = const Value.absent(),
    this.lineDiscountTotal = const Value.absent(),
    this.taxIndicator = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.listPrice = const Value.absent(),
    this.quantity = const Value.absent(),
    this.subTotal = const Value.absent(),
    this.grandTotal = const Value.absent(),
    this.fxGrandTotal = const Value.absent(),
    this.itemCount = const Value.absent(),
    this.depositTotal = const Value.absent(),
    this.lineId = const Value.absent(),
    this.taxTotal = const Value.absent(),
    this.shippingTotal = const Value.absent(),
    this.conversionFactor = const Value.absent(),
  });
  SalesOrderDetailCompanion.insert({
    this.tenantId = const Value.absent(),
    @required String userName,
    @required int userId,
    this.id = const Value.absent(),
    @required String transactionNumber,
    @required String inventoryCycleNumber,
    @required String daySessionNumber,
    @required DateTime deliveryDate,
    @required String currency,
    @required double exchangeRate,
    this.transactionStatus = const Value.absent(),
    this.itemId = const Value.absent(),
    @required String itemCode,
    @required String upcCode,
    @required String description,
    @required String itemGroup,
    @required String category,
    @required String salesUOM,
    @required String stockUOM,
    @required String taxGroup,
    @required String warehouse,
    @required String discountType,
    @required double discountPercentage,
    @required double discountAmount,
    @required double lineDiscountTotal,
    this.taxIndicator = const Value.absent(),
    @required double unitPrice,
    @required double costPrice,
    @required double listPrice,
    @required double quantity,
    @required double subTotal,
    @required double grandTotal,
    @required double fxGrandTotal,
    this.itemCount = const Value.absent(),
    this.depositTotal = const Value.absent(),
    this.lineId = const Value.absent(),
    @required double taxTotal,
    @required double shippingTotal,
    @required double conversionFactor,
  })  : userName = Value(userName),
        userId = Value(userId),
        transactionNumber = Value(transactionNumber),
        inventoryCycleNumber = Value(inventoryCycleNumber),
        daySessionNumber = Value(daySessionNumber),
        deliveryDate = Value(deliveryDate),
        currency = Value(currency),
        exchangeRate = Value(exchangeRate),
        itemCode = Value(itemCode),
        upcCode = Value(upcCode),
        description = Value(description),
        itemGroup = Value(itemGroup),
        category = Value(category),
        salesUOM = Value(salesUOM),
        stockUOM = Value(stockUOM),
        taxGroup = Value(taxGroup),
        warehouse = Value(warehouse),
        discountType = Value(discountType),
        discountPercentage = Value(discountPercentage),
        discountAmount = Value(discountAmount),
        lineDiscountTotal = Value(lineDiscountTotal),
        unitPrice = Value(unitPrice),
        costPrice = Value(costPrice),
        listPrice = Value(listPrice),
        quantity = Value(quantity),
        subTotal = Value(subTotal),
        grandTotal = Value(grandTotal),
        fxGrandTotal = Value(fxGrandTotal),
        taxTotal = Value(taxTotal),
        shippingTotal = Value(shippingTotal),
        conversionFactor = Value(conversionFactor);
  static Insertable<SalesOrderDetailData> custom({
    Expression<int> tenantId,
    Expression<String> userName,
    Expression<int> userId,
    Expression<int> id,
    Expression<String> transactionNumber,
    Expression<String> inventoryCycleNumber,
    Expression<String> daySessionNumber,
    Expression<DateTime> deliveryDate,
    Expression<String> currency,
    Expression<double> exchangeRate,
    Expression<String> transactionStatus,
    Expression<String> itemId,
    Expression<String> itemCode,
    Expression<String> upcCode,
    Expression<String> description,
    Expression<String> itemGroup,
    Expression<String> category,
    Expression<String> salesUOM,
    Expression<String> stockUOM,
    Expression<String> taxGroup,
    Expression<String> warehouse,
    Expression<String> discountType,
    Expression<double> discountPercentage,
    Expression<double> discountAmount,
    Expression<double> lineDiscountTotal,
    Expression<String> taxIndicator,
    Expression<double> unitPrice,
    Expression<double> costPrice,
    Expression<double> listPrice,
    Expression<double> quantity,
    Expression<double> subTotal,
    Expression<double> grandTotal,
    Expression<double> fxGrandTotal,
    Expression<int> itemCount,
    Expression<double> depositTotal,
    Expression<int> lineId,
    Expression<double> taxTotal,
    Expression<double> shippingTotal,
    Expression<double> conversionFactor,
  }) {
    return RawValuesInsertable({
      if (tenantId != null) 'tenant_id': tenantId,
      if (userName != null) 'user_name': userName,
      if (userId != null) 'user_id': userId,
      if (id != null) 'id': id,
      if (transactionNumber != null) 'transaction_number': transactionNumber,
      if (inventoryCycleNumber != null)
        'inventory_cycle_number': inventoryCycleNumber,
      if (daySessionNumber != null) 'day_session_number': daySessionNumber,
      if (deliveryDate != null) 'delivery_date': deliveryDate,
      if (currency != null) 'currency': currency,
      if (exchangeRate != null) 'exchange_rate': exchangeRate,
      if (transactionStatus != null) 'transaction_status': transactionStatus,
      if (itemId != null) 'item_id': itemId,
      if (itemCode != null) 'item_code': itemCode,
      if (upcCode != null) 'upc_code': upcCode,
      if (description != null) 'description': description,
      if (itemGroup != null) 'item_group': itemGroup,
      if (category != null) 'category': category,
      if (salesUOM != null) 'sales_u_o_m': salesUOM,
      if (stockUOM != null) 'stock_u_o_m': stockUOM,
      if (taxGroup != null) 'tax_group': taxGroup,
      if (warehouse != null) 'warehouse': warehouse,
      if (discountType != null) 'discount_type': discountType,
      if (discountPercentage != null) 'discount_percentage': discountPercentage,
      if (discountAmount != null) 'discount_amount': discountAmount,
      if (lineDiscountTotal != null) 'line_discount_total': lineDiscountTotal,
      if (taxIndicator != null) 'tax_indicator': taxIndicator,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (costPrice != null) 'cost_price': costPrice,
      if (listPrice != null) 'list_price': listPrice,
      if (quantity != null) 'quantity': quantity,
      if (subTotal != null) 'sub_total': subTotal,
      if (grandTotal != null) 'grand_total': grandTotal,
      if (fxGrandTotal != null) 'fx_grand_total': fxGrandTotal,
      if (itemCount != null) 'item_count': itemCount,
      if (depositTotal != null) 'deposit_total': depositTotal,
      if (lineId != null) 'line_id': lineId,
      if (taxTotal != null) 'tax_total': taxTotal,
      if (shippingTotal != null) 'shipping_total': shippingTotal,
      if (conversionFactor != null) 'conversion_factor': conversionFactor,
    });
  }

  SalesOrderDetailCompanion copyWith(
      {Value<int> tenantId,
      Value<String> userName,
      Value<int> userId,
      Value<int> id,
      Value<String> transactionNumber,
      Value<String> inventoryCycleNumber,
      Value<String> daySessionNumber,
      Value<DateTime> deliveryDate,
      Value<String> currency,
      Value<double> exchangeRate,
      Value<String> transactionStatus,
      Value<String> itemId,
      Value<String> itemCode,
      Value<String> upcCode,
      Value<String> description,
      Value<String> itemGroup,
      Value<String> category,
      Value<String> salesUOM,
      Value<String> stockUOM,
      Value<String> taxGroup,
      Value<String> warehouse,
      Value<String> discountType,
      Value<double> discountPercentage,
      Value<double> discountAmount,
      Value<double> lineDiscountTotal,
      Value<String> taxIndicator,
      Value<double> unitPrice,
      Value<double> costPrice,
      Value<double> listPrice,
      Value<double> quantity,
      Value<double> subTotal,
      Value<double> grandTotal,
      Value<double> fxGrandTotal,
      Value<int> itemCount,
      Value<double> depositTotal,
      Value<int> lineId,
      Value<double> taxTotal,
      Value<double> shippingTotal,
      Value<double> conversionFactor}) {
    return SalesOrderDetailCompanion(
      tenantId: tenantId ?? this.tenantId,
      userName: userName ?? this.userName,
      userId: userId ?? this.userId,
      id: id ?? this.id,
      transactionNumber: transactionNumber ?? this.transactionNumber,
      inventoryCycleNumber: inventoryCycleNumber ?? this.inventoryCycleNumber,
      daySessionNumber: daySessionNumber ?? this.daySessionNumber,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      currency: currency ?? this.currency,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      transactionStatus: transactionStatus ?? this.transactionStatus,
      itemId: itemId ?? this.itemId,
      itemCode: itemCode ?? this.itemCode,
      upcCode: upcCode ?? this.upcCode,
      description: description ?? this.description,
      itemGroup: itemGroup ?? this.itemGroup,
      category: category ?? this.category,
      salesUOM: salesUOM ?? this.salesUOM,
      stockUOM: stockUOM ?? this.stockUOM,
      taxGroup: taxGroup ?? this.taxGroup,
      warehouse: warehouse ?? this.warehouse,
      discountType: discountType ?? this.discountType,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      discountAmount: discountAmount ?? this.discountAmount,
      lineDiscountTotal: lineDiscountTotal ?? this.lineDiscountTotal,
      taxIndicator: taxIndicator ?? this.taxIndicator,
      unitPrice: unitPrice ?? this.unitPrice,
      costPrice: costPrice ?? this.costPrice,
      listPrice: listPrice ?? this.listPrice,
      quantity: quantity ?? this.quantity,
      subTotal: subTotal ?? this.subTotal,
      grandTotal: grandTotal ?? this.grandTotal,
      fxGrandTotal: fxGrandTotal ?? this.fxGrandTotal,
      itemCount: itemCount ?? this.itemCount,
      depositTotal: depositTotal ?? this.depositTotal,
      lineId: lineId ?? this.lineId,
      taxTotal: taxTotal ?? this.taxTotal,
      shippingTotal: shippingTotal ?? this.shippingTotal,
      conversionFactor: conversionFactor ?? this.conversionFactor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tenantId.present) {
      map['tenant_id'] = Variable<int>(tenantId.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (transactionNumber.present) {
      map['transaction_number'] = Variable<String>(transactionNumber.value);
    }
    if (inventoryCycleNumber.present) {
      map['inventory_cycle_number'] =
          Variable<String>(inventoryCycleNumber.value);
    }
    if (daySessionNumber.present) {
      map['day_session_number'] = Variable<String>(daySessionNumber.value);
    }
    if (deliveryDate.present) {
      map['delivery_date'] = Variable<DateTime>(deliveryDate.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (exchangeRate.present) {
      map['exchange_rate'] = Variable<double>(exchangeRate.value);
    }
    if (transactionStatus.present) {
      map['transaction_status'] = Variable<String>(transactionStatus.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (itemCode.present) {
      map['item_code'] = Variable<String>(itemCode.value);
    }
    if (upcCode.present) {
      map['upc_code'] = Variable<String>(upcCode.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (itemGroup.present) {
      map['item_group'] = Variable<String>(itemGroup.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (salesUOM.present) {
      map['sales_u_o_m'] = Variable<String>(salesUOM.value);
    }
    if (stockUOM.present) {
      map['stock_u_o_m'] = Variable<String>(stockUOM.value);
    }
    if (taxGroup.present) {
      map['tax_group'] = Variable<String>(taxGroup.value);
    }
    if (warehouse.present) {
      map['warehouse'] = Variable<String>(warehouse.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>(discountType.value);
    }
    if (discountPercentage.present) {
      map['discount_percentage'] = Variable<double>(discountPercentage.value);
    }
    if (discountAmount.present) {
      map['discount_amount'] = Variable<double>(discountAmount.value);
    }
    if (lineDiscountTotal.present) {
      map['line_discount_total'] = Variable<double>(lineDiscountTotal.value);
    }
    if (taxIndicator.present) {
      map['tax_indicator'] = Variable<String>(taxIndicator.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (costPrice.present) {
      map['cost_price'] = Variable<double>(costPrice.value);
    }
    if (listPrice.present) {
      map['list_price'] = Variable<double>(listPrice.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (subTotal.present) {
      map['sub_total'] = Variable<double>(subTotal.value);
    }
    if (grandTotal.present) {
      map['grand_total'] = Variable<double>(grandTotal.value);
    }
    if (fxGrandTotal.present) {
      map['fx_grand_total'] = Variable<double>(fxGrandTotal.value);
    }
    if (itemCount.present) {
      map['item_count'] = Variable<int>(itemCount.value);
    }
    if (depositTotal.present) {
      map['deposit_total'] = Variable<double>(depositTotal.value);
    }
    if (lineId.present) {
      map['line_id'] = Variable<int>(lineId.value);
    }
    if (taxTotal.present) {
      map['tax_total'] = Variable<double>(taxTotal.value);
    }
    if (shippingTotal.present) {
      map['shipping_total'] = Variable<double>(shippingTotal.value);
    }
    if (conversionFactor.present) {
      map['conversion_factor'] = Variable<double>(conversionFactor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesOrderDetailCompanion(')
          ..write('tenantId: $tenantId, ')
          ..write('userName: $userName, ')
          ..write('userId: $userId, ')
          ..write('id: $id, ')
          ..write('transactionNumber: $transactionNumber, ')
          ..write('inventoryCycleNumber: $inventoryCycleNumber, ')
          ..write('daySessionNumber: $daySessionNumber, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('currency: $currency, ')
          ..write('exchangeRate: $exchangeRate, ')
          ..write('transactionStatus: $transactionStatus, ')
          ..write('itemId: $itemId, ')
          ..write('itemCode: $itemCode, ')
          ..write('upcCode: $upcCode, ')
          ..write('description: $description, ')
          ..write('itemGroup: $itemGroup, ')
          ..write('category: $category, ')
          ..write('salesUOM: $salesUOM, ')
          ..write('stockUOM: $stockUOM, ')
          ..write('taxGroup: $taxGroup, ')
          ..write('warehouse: $warehouse, ')
          ..write('discountType: $discountType, ')
          ..write('discountPercentage: $discountPercentage, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('lineDiscountTotal: $lineDiscountTotal, ')
          ..write('taxIndicator: $taxIndicator, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('costPrice: $costPrice, ')
          ..write('listPrice: $listPrice, ')
          ..write('quantity: $quantity, ')
          ..write('subTotal: $subTotal, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('fxGrandTotal: $fxGrandTotal, ')
          ..write('itemCount: $itemCount, ')
          ..write('depositTotal: $depositTotal, ')
          ..write('lineId: $lineId, ')
          ..write('taxTotal: $taxTotal, ')
          ..write('shippingTotal: $shippingTotal, ')
          ..write('conversionFactor: $conversionFactor')
          ..write(')'))
        .toString();
  }
}

class $SalesOrderDetailTable extends SalesOrderDetail
    with TableInfo<$SalesOrderDetailTable, SalesOrderDetailData> {
  final GeneratedDatabase _db;
  final String _alias;
  $SalesOrderDetailTable(this._db, [this._alias]);
  final VerificationMeta _tenantIdMeta = const VerificationMeta('tenantId');
  GeneratedColumn<int> _tenantId;
  @override
  GeneratedColumn<int> get tenantId =>
      _tenantId ??= GeneratedColumn<int>('tenant_id', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  GeneratedColumn<String> _userName;
  @override
  GeneratedColumn<String> get userName =>
      _userName ??= GeneratedColumn<String>('user_name', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedColumn<int> _userId;
  @override
  GeneratedColumn<int> get userId =>
      _userId ??= GeneratedColumn<int>('user_id', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _transactionNumberMeta =
      const VerificationMeta('transactionNumber');
  GeneratedColumn<String> _transactionNumber;
  @override
  GeneratedColumn<String> get transactionNumber => _transactionNumber ??=
      GeneratedColumn<String>('transaction_number', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _inventoryCycleNumberMeta =
      const VerificationMeta('inventoryCycleNumber');
  GeneratedColumn<String> _inventoryCycleNumber;
  @override
  GeneratedColumn<String> get inventoryCycleNumber => _inventoryCycleNumber ??=
      GeneratedColumn<String>('inventory_cycle_number', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _daySessionNumberMeta =
      const VerificationMeta('daySessionNumber');
  GeneratedColumn<String> _daySessionNumber;
  @override
  GeneratedColumn<String> get daySessionNumber => _daySessionNumber ??=
      GeneratedColumn<String>('day_session_number', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _deliveryDateMeta =
      const VerificationMeta('deliveryDate');
  GeneratedColumn<DateTime> _deliveryDate;
  @override
  GeneratedColumn<DateTime> get deliveryDate => _deliveryDate ??=
      GeneratedColumn<DateTime>('delivery_date', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _currencyMeta = const VerificationMeta('currency');
  GeneratedColumn<String> _currency;
  @override
  GeneratedColumn<String> get currency =>
      _currency ??= GeneratedColumn<String>('currency', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _exchangeRateMeta =
      const VerificationMeta('exchangeRate');
  GeneratedColumn<double> _exchangeRate;
  @override
  GeneratedColumn<double> get exchangeRate => _exchangeRate ??=
      GeneratedColumn<double>('exchange_rate', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _transactionStatusMeta =
      const VerificationMeta('transactionStatus');
  GeneratedColumn<String> _transactionStatus;
  @override
  GeneratedColumn<String> get transactionStatus => _transactionStatus ??=
      GeneratedColumn<String>('transaction_status', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  GeneratedColumn<String> _itemId;
  @override
  GeneratedColumn<String> get itemId =>
      _itemId ??= GeneratedColumn<String>('item_id', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _itemCodeMeta = const VerificationMeta('itemCode');
  GeneratedColumn<String> _itemCode;
  @override
  GeneratedColumn<String> get itemCode =>
      _itemCode ??= GeneratedColumn<String>('item_code', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _upcCodeMeta = const VerificationMeta('upcCode');
  GeneratedColumn<String> _upcCode;
  @override
  GeneratedColumn<String> get upcCode =>
      _upcCode ??= GeneratedColumn<String>('upc_code', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedColumn<String> _description;
  @override
  GeneratedColumn<String> get description => _description ??=
      GeneratedColumn<String>('description', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _itemGroupMeta = const VerificationMeta('itemGroup');
  GeneratedColumn<String> _itemGroup;
  @override
  GeneratedColumn<String> get itemGroup =>
      _itemGroup ??= GeneratedColumn<String>('item_group', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedColumn<String> _category;
  @override
  GeneratedColumn<String> get category =>
      _category ??= GeneratedColumn<String>('category', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _salesUOMMeta = const VerificationMeta('salesUOM');
  GeneratedColumn<String> _salesUOM;
  @override
  GeneratedColumn<String> get salesUOM =>
      _salesUOM ??= GeneratedColumn<String>('sales_u_o_m', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _stockUOMMeta = const VerificationMeta('stockUOM');
  GeneratedColumn<String> _stockUOM;
  @override
  GeneratedColumn<String> get stockUOM =>
      _stockUOM ??= GeneratedColumn<String>('stock_u_o_m', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _taxGroupMeta = const VerificationMeta('taxGroup');
  GeneratedColumn<String> _taxGroup;
  @override
  GeneratedColumn<String> get taxGroup =>
      _taxGroup ??= GeneratedColumn<String>('tax_group', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _warehouseMeta = const VerificationMeta('warehouse');
  GeneratedColumn<String> _warehouse;
  @override
  GeneratedColumn<String> get warehouse =>
      _warehouse ??= GeneratedColumn<String>('warehouse', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _discountTypeMeta =
      const VerificationMeta('discountType');
  GeneratedColumn<String> _discountType;
  @override
  GeneratedColumn<String> get discountType => _discountType ??=
      GeneratedColumn<String>('discount_type', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _discountPercentageMeta =
      const VerificationMeta('discountPercentage');
  GeneratedColumn<double> _discountPercentage;
  @override
  GeneratedColumn<double> get discountPercentage => _discountPercentage ??=
      GeneratedColumn<double>('discount_percentage', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _discountAmountMeta =
      const VerificationMeta('discountAmount');
  GeneratedColumn<double> _discountAmount;
  @override
  GeneratedColumn<double> get discountAmount => _discountAmount ??=
      GeneratedColumn<double>('discount_amount', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _lineDiscountTotalMeta =
      const VerificationMeta('lineDiscountTotal');
  GeneratedColumn<double> _lineDiscountTotal;
  @override
  GeneratedColumn<double> get lineDiscountTotal => _lineDiscountTotal ??=
      GeneratedColumn<double>('line_discount_total', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _taxIndicatorMeta =
      const VerificationMeta('taxIndicator');
  GeneratedColumn<String> _taxIndicator;
  @override
  GeneratedColumn<String> get taxIndicator => _taxIndicator ??=
      GeneratedColumn<String>('tax_indicator', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _unitPriceMeta = const VerificationMeta('unitPrice');
  GeneratedColumn<double> _unitPrice;
  @override
  GeneratedColumn<double> get unitPrice =>
      _unitPrice ??= GeneratedColumn<double>('unit_price', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _costPriceMeta = const VerificationMeta('costPrice');
  GeneratedColumn<double> _costPrice;
  @override
  GeneratedColumn<double> get costPrice =>
      _costPrice ??= GeneratedColumn<double>('cost_price', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _listPriceMeta = const VerificationMeta('listPrice');
  GeneratedColumn<double> _listPrice;
  @override
  GeneratedColumn<double> get listPrice =>
      _listPrice ??= GeneratedColumn<double>('list_price', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _quantityMeta = const VerificationMeta('quantity');
  GeneratedColumn<double> _quantity;
  @override
  GeneratedColumn<double> get quantity =>
      _quantity ??= GeneratedColumn<double>('quantity', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _subTotalMeta = const VerificationMeta('subTotal');
  GeneratedColumn<double> _subTotal;
  @override
  GeneratedColumn<double> get subTotal =>
      _subTotal ??= GeneratedColumn<double>('sub_total', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _grandTotalMeta = const VerificationMeta('grandTotal');
  GeneratedColumn<double> _grandTotal;
  @override
  GeneratedColumn<double> get grandTotal =>
      _grandTotal ??= GeneratedColumn<double>('grand_total', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _fxGrandTotalMeta =
      const VerificationMeta('fxGrandTotal');
  GeneratedColumn<double> _fxGrandTotal;
  @override
  GeneratedColumn<double> get fxGrandTotal => _fxGrandTotal ??=
      GeneratedColumn<double>('fx_grand_total', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _itemCountMeta = const VerificationMeta('itemCount');
  GeneratedColumn<int> _itemCount;
  @override
  GeneratedColumn<int> get itemCount =>
      _itemCount ??= GeneratedColumn<int>('item_count', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _depositTotalMeta =
      const VerificationMeta('depositTotal');
  GeneratedColumn<double> _depositTotal;
  @override
  GeneratedColumn<double> get depositTotal => _depositTotal ??=
      GeneratedColumn<double>('deposit_total', aliasedName, true,
          type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _lineIdMeta = const VerificationMeta('lineId');
  GeneratedColumn<int> _lineId;
  @override
  GeneratedColumn<int> get lineId =>
      _lineId ??= GeneratedColumn<int>('line_id', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _taxTotalMeta = const VerificationMeta('taxTotal');
  GeneratedColumn<double> _taxTotal;
  @override
  GeneratedColumn<double> get taxTotal =>
      _taxTotal ??= GeneratedColumn<double>('tax_total', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _shippingTotalMeta =
      const VerificationMeta('shippingTotal');
  GeneratedColumn<double> _shippingTotal;
  @override
  GeneratedColumn<double> get shippingTotal => _shippingTotal ??=
      GeneratedColumn<double>('shipping_total', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _conversionFactorMeta =
      const VerificationMeta('conversionFactor');
  GeneratedColumn<double> _conversionFactor;
  @override
  GeneratedColumn<double> get conversionFactor => _conversionFactor ??=
      GeneratedColumn<double>('conversion_factor', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        tenantId,
        userName,
        userId,
        id,
        transactionNumber,
        inventoryCycleNumber,
        daySessionNumber,
        deliveryDate,
        currency,
        exchangeRate,
        transactionStatus,
        itemId,
        itemCode,
        upcCode,
        description,
        itemGroup,
        category,
        salesUOM,
        stockUOM,
        taxGroup,
        warehouse,
        discountType,
        discountPercentage,
        discountAmount,
        lineDiscountTotal,
        taxIndicator,
        unitPrice,
        costPrice,
        listPrice,
        quantity,
        subTotal,
        grandTotal,
        fxGrandTotal,
        itemCount,
        depositTotal,
        lineId,
        taxTotal,
        shippingTotal,
        conversionFactor
      ];
  @override
  String get aliasedName => _alias ?? 'sales_order_detail';
  @override
  String get actualTableName => 'sales_order_detail';
  @override
  VerificationContext validateIntegrity(
      Insertable<SalesOrderDetailData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('tenant_id')) {
      context.handle(_tenantIdMeta,
          tenantId.isAcceptableOrUnknown(data['tenant_id'], _tenantIdMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name'], _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('transaction_number')) {
      context.handle(
          _transactionNumberMeta,
          transactionNumber.isAcceptableOrUnknown(
              data['transaction_number'], _transactionNumberMeta));
    } else if (isInserting) {
      context.missing(_transactionNumberMeta);
    }
    if (data.containsKey('inventory_cycle_number')) {
      context.handle(
          _inventoryCycleNumberMeta,
          inventoryCycleNumber.isAcceptableOrUnknown(
              data['inventory_cycle_number'], _inventoryCycleNumberMeta));
    } else if (isInserting) {
      context.missing(_inventoryCycleNumberMeta);
    }
    if (data.containsKey('day_session_number')) {
      context.handle(
          _daySessionNumberMeta,
          daySessionNumber.isAcceptableOrUnknown(
              data['day_session_number'], _daySessionNumberMeta));
    } else if (isInserting) {
      context.missing(_daySessionNumberMeta);
    }
    if (data.containsKey('delivery_date')) {
      context.handle(
          _deliveryDateMeta,
          deliveryDate.isAcceptableOrUnknown(
              data['delivery_date'], _deliveryDateMeta));
    } else if (isInserting) {
      context.missing(_deliveryDateMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency'], _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('exchange_rate')) {
      context.handle(
          _exchangeRateMeta,
          exchangeRate.isAcceptableOrUnknown(
              data['exchange_rate'], _exchangeRateMeta));
    } else if (isInserting) {
      context.missing(_exchangeRateMeta);
    }
    if (data.containsKey('transaction_status')) {
      context.handle(
          _transactionStatusMeta,
          transactionStatus.isAcceptableOrUnknown(
              data['transaction_status'], _transactionStatusMeta));
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id'], _itemIdMeta));
    }
    if (data.containsKey('item_code')) {
      context.handle(_itemCodeMeta,
          itemCode.isAcceptableOrUnknown(data['item_code'], _itemCodeMeta));
    } else if (isInserting) {
      context.missing(_itemCodeMeta);
    }
    if (data.containsKey('upc_code')) {
      context.handle(_upcCodeMeta,
          upcCode.isAcceptableOrUnknown(data['upc_code'], _upcCodeMeta));
    } else if (isInserting) {
      context.missing(_upcCodeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('item_group')) {
      context.handle(_itemGroupMeta,
          itemGroup.isAcceptableOrUnknown(data['item_group'], _itemGroupMeta));
    } else if (isInserting) {
      context.missing(_itemGroupMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('sales_u_o_m')) {
      context.handle(_salesUOMMeta,
          salesUOM.isAcceptableOrUnknown(data['sales_u_o_m'], _salesUOMMeta));
    } else if (isInserting) {
      context.missing(_salesUOMMeta);
    }
    if (data.containsKey('stock_u_o_m')) {
      context.handle(_stockUOMMeta,
          stockUOM.isAcceptableOrUnknown(data['stock_u_o_m'], _stockUOMMeta));
    } else if (isInserting) {
      context.missing(_stockUOMMeta);
    }
    if (data.containsKey('tax_group')) {
      context.handle(_taxGroupMeta,
          taxGroup.isAcceptableOrUnknown(data['tax_group'], _taxGroupMeta));
    } else if (isInserting) {
      context.missing(_taxGroupMeta);
    }
    if (data.containsKey('warehouse')) {
      context.handle(_warehouseMeta,
          warehouse.isAcceptableOrUnknown(data['warehouse'], _warehouseMeta));
    } else if (isInserting) {
      context.missing(_warehouseMeta);
    }
    if (data.containsKey('discount_type')) {
      context.handle(
          _discountTypeMeta,
          discountType.isAcceptableOrUnknown(
              data['discount_type'], _discountTypeMeta));
    } else if (isInserting) {
      context.missing(_discountTypeMeta);
    }
    if (data.containsKey('discount_percentage')) {
      context.handle(
          _discountPercentageMeta,
          discountPercentage.isAcceptableOrUnknown(
              data['discount_percentage'], _discountPercentageMeta));
    } else if (isInserting) {
      context.missing(_discountPercentageMeta);
    }
    if (data.containsKey('discount_amount')) {
      context.handle(
          _discountAmountMeta,
          discountAmount.isAcceptableOrUnknown(
              data['discount_amount'], _discountAmountMeta));
    } else if (isInserting) {
      context.missing(_discountAmountMeta);
    }
    if (data.containsKey('line_discount_total')) {
      context.handle(
          _lineDiscountTotalMeta,
          lineDiscountTotal.isAcceptableOrUnknown(
              data['line_discount_total'], _lineDiscountTotalMeta));
    } else if (isInserting) {
      context.missing(_lineDiscountTotalMeta);
    }
    if (data.containsKey('tax_indicator')) {
      context.handle(
          _taxIndicatorMeta,
          taxIndicator.isAcceptableOrUnknown(
              data['tax_indicator'], _taxIndicatorMeta));
    }
    if (data.containsKey('unit_price')) {
      context.handle(_unitPriceMeta,
          unitPrice.isAcceptableOrUnknown(data['unit_price'], _unitPriceMeta));
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('cost_price')) {
      context.handle(_costPriceMeta,
          costPrice.isAcceptableOrUnknown(data['cost_price'], _costPriceMeta));
    } else if (isInserting) {
      context.missing(_costPriceMeta);
    }
    if (data.containsKey('list_price')) {
      context.handle(_listPriceMeta,
          listPrice.isAcceptableOrUnknown(data['list_price'], _listPriceMeta));
    } else if (isInserting) {
      context.missing(_listPriceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity'], _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('sub_total')) {
      context.handle(_subTotalMeta,
          subTotal.isAcceptableOrUnknown(data['sub_total'], _subTotalMeta));
    } else if (isInserting) {
      context.missing(_subTotalMeta);
    }
    if (data.containsKey('grand_total')) {
      context.handle(
          _grandTotalMeta,
          grandTotal.isAcceptableOrUnknown(
              data['grand_total'], _grandTotalMeta));
    } else if (isInserting) {
      context.missing(_grandTotalMeta);
    }
    if (data.containsKey('fx_grand_total')) {
      context.handle(
          _fxGrandTotalMeta,
          fxGrandTotal.isAcceptableOrUnknown(
              data['fx_grand_total'], _fxGrandTotalMeta));
    } else if (isInserting) {
      context.missing(_fxGrandTotalMeta);
    }
    if (data.containsKey('item_count')) {
      context.handle(_itemCountMeta,
          itemCount.isAcceptableOrUnknown(data['item_count'], _itemCountMeta));
    }
    if (data.containsKey('deposit_total')) {
      context.handle(
          _depositTotalMeta,
          depositTotal.isAcceptableOrUnknown(
              data['deposit_total'], _depositTotalMeta));
    }
    if (data.containsKey('line_id')) {
      context.handle(_lineIdMeta,
          lineId.isAcceptableOrUnknown(data['line_id'], _lineIdMeta));
    }
    if (data.containsKey('tax_total')) {
      context.handle(_taxTotalMeta,
          taxTotal.isAcceptableOrUnknown(data['tax_total'], _taxTotalMeta));
    } else if (isInserting) {
      context.missing(_taxTotalMeta);
    }
    if (data.containsKey('shipping_total')) {
      context.handle(
          _shippingTotalMeta,
          shippingTotal.isAcceptableOrUnknown(
              data['shipping_total'], _shippingTotalMeta));
    } else if (isInserting) {
      context.missing(_shippingTotalMeta);
    }
    if (data.containsKey('conversion_factor')) {
      context.handle(
          _conversionFactorMeta,
          conversionFactor.isAcceptableOrUnknown(
              data['conversion_factor'], _conversionFactorMeta));
    } else if (isInserting) {
      context.missing(_conversionFactorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesOrderDetailData map(Map<String, dynamic> data, {String tablePrefix}) {
    return SalesOrderDetailData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SalesOrderDetailTable createAlias(String alias) {
    return $SalesOrderDetailTable(_db, alias);
  }
}

abstract class _$SalesOrderWithItem extends GeneratedDatabase {
  _$SalesOrderWithItem(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  $SalesOrderHeaderTable _salesOrderHeader;
  $SalesOrderHeaderTable get salesOrderHeader =>
      _salesOrderHeader ??= $SalesOrderHeaderTable(this);
  $SalesOrderDetailTable _salesOrderDetail;
  $SalesOrderDetailTable get salesOrderDetail =>
      _salesOrderDetail ??= $SalesOrderDetailTable(this);
  Selectable<SalesOrderHeaderData> salesOrderWithLineItem() {
    return customSelect(
        'SELECT h.* FROM sales_order_header h inner join sales_order_detail d on h.transaction_number = d.transaction_number;',
        variables: [],
        readsFrom: {
          salesOrderHeader,
          salesOrderDetail,
        }).map(salesOrderHeader.mapFromRow);
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [salesOrderHeader, salesOrderDetail];
}
