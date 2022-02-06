import 'package:flutter_test/flutter_test.dart';
import 'package:money_manager/modules/groceries/stores/shopping_history_store.dart';

void main() {
  group('check status of store', () {
    late ShoppingHistoryStore shoppingHistoryStore;

    setUp(() {
      shoppingHistoryStore = ShoppingHistoryStore();
    });

    test('get count items', () {
      expect(shoppingHistoryStore.countItems, 0);
    });
    test('has items', () {
      expect(shoppingHistoryStore.hasItems, false);
    });
  });
}
