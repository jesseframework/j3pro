import 'package:j3enterprise/src/database/moor_database.dart';

class ItemsWithPrices {
  final Item item;
  final ItemsPrice price;
  final UPCCodeData barcode;

  ItemsWithPrices(this.item, this.price, this.barcode);
}
