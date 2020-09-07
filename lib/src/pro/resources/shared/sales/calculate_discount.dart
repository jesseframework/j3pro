import 'package:j3enterprise/src/database/moor_database.dart';
import 'package:j3enterprise/src/pro/database/crud/customer/customer_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_master_crud.dart';
import 'package:j3enterprise/src/pro/database/crud/items/item_price_crud.dart';

class CalculateDiscount {
  var db;

  String customerGroup;
  String salesTerritory;
  String salesPartner;
  String campaign;
  bool enableHeaderDiscount = false;
  double minPurchase = 0;
  double amountOff = 0;
  DateTime validFrom = DateTime.now();
  DateTime validTo = DateTime.now();
  double accumulatedPurchase = 0;
  String priceOrDiscount;
  double numOfItemOnRegister = 0;
  double numOfItemGroupOnRegister = 0;
  double numOfBrandOnRegister = 0;
  double numOfAllItemsOnRegister = 0;
  double minPurchaseOfItemOnRegister = 0;
  double minPurchaseOfItemGroupOnRegister = 0;
  double minPurchaseOfBrandOnRegister = 0;
  double minPurchaseAllItemsOnRegister = 0;
  double subTotalOnRegisterSum = 0;
  double minCouponSpentOnRegister = 0;
  //DAOs
  ItemsDao itemsDao;
  ItemPriceDao itemPriceDao;
  CustomerDao customerDao;

  CalculateDiscount() {
    db = AppDatabase();
    //DAOs
    itemsDao = new ItemsDao(db);
    itemPriceDao = new ItemPriceDao(db);
    customerDao = new CustomerDao(db);
  }

  Future<void> getDiscount(String itemId, String uom, String customerId) async {
    var customer = await customerDao.getAllCustomerById(customerId);
    if (customer != null && customer.length > 0) {
      customerGroup = customer[0].customerGroup;
      salesTerritory = customer[0].customerTerritory;
      //enableHeaderDiscount = customer[0].enableHeaderDiscount;
      salesPartner = "";
      campaign = "";
      minPurchase = customer[0].minQuantity;
      amountOff = customer[0].discountAmount;
      validFrom = customer[0].validFrom;
      validTo = customer[0].validTo;
      accumulatedPurchase = customer[0].accumulatedPurchase;
      //priceOrDiscount = customer[0].;
    }
  }
}
