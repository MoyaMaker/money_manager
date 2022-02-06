import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager/modules/groceries/enums/promotions_enum.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';

hiveConfig() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(ProductHiveAdapter()) // TypeId 0
    ..registerAdapter(CartItemAdapter()) // TypeId 1
    ..registerAdapter(PromotionsAdapter()); // TypeId 2
}
