import 'package:flutter_test/flutter_test.dart';
import 'package:money_manager/modules/groceries/stores/receipt_history_store.dart';

void main() {
  group('check status of store', () {
    late ReceiptHistoryStore shoppingHistoryStore;

    setUp(() {
      shoppingHistoryStore = ReceiptHistoryStore();
    });

    test('get count items', () {
      expect(shoppingHistoryStore.countItems, 0);
    });
    test('has items', () {
      expect(shoppingHistoryStore.hasItems, false);
    });
  });
}
