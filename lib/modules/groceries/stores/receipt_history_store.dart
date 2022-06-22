import 'package:mobx/mobx.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager/modules/groceries/models/receipt_model.dart';

import 'cart_item_store.dart';

part 'receipt_history_store.g.dart';

class ReceiptHistoryStore = _ReceiptHistoryStore with _$ReceiptHistoryStore;

abstract class _ReceiptHistoryStore with Store {
  _ReceiptHistoryStore() {
    _disposers = [
      autorun((_) async {
        await _initBox();

        // Init values in list
        final shoppedCartItemsList = _box.values;

        shoppedItems = ObservableList.of(shoppedCartItemsList);
      })
    ];
  }

  late Box<Receipt> _box;

  late List<ReactionDisposer> _disposers;

  @observable
  ObservableList<Receipt> shoppedItems = ObservableList.of([]);

  @computed
  int get countItems => shoppedItems.length;

  @computed
  bool get hasItems => shoppedItems.isNotEmpty;

  @action
  Future<void> _initBox() async {
    const boxName = 'receipt_history';

    if (Hive.isBoxOpen(boxName)) {
      _box = Hive.box<Receipt>(boxName);
    } else {
      _box = await Hive.openBox<Receipt>(boxName);
    }
  }

  @action
  void saveReceipt(String id, String storeName, DateTime buyDate,
      List<CartItemStore> cartItems) {
    final newReceipt = Receipt(
        id: id, storeName: storeName, buyDate: buyDate, itemsList: cartItems);

    shoppedItems.add(newReceipt);
    saveIntoBox(newReceipt);
  }

  @action
  Future<int> saveIntoBox(Receipt receipt) => _box.add(receipt);

  @action
  void delete(Receipt receipt) {
    final key = findKeyInMap(receipt);

    shoppedItems.remove(receipt);

    _box.delete(key);
  }

  @action
  int findItemIndex(Receipt receipt) {
    return shoppedItems.indexWhere((element) => element.id == receipt.id);
  }

  @action
  int findKeyInMap(Receipt receipt) {
    final mapProducts = _box.toMap().cast<int, Receipt>();

    int resultKey = -1;

    mapProducts.forEach((key, value) {
      if (value.id == receipt.id) {
        resultKey = key;
      }
    });

    return resultKey;
  }

  @action
  Future<Iterable<int>> restoreReceipts(List<Receipt> values) {
    shoppedItems = ObservableList.of(values);
    return _box.addAll(values);
  }

  @action
  Future<void> closeBox() => _box.close();

  @action
  void dispose() {
    closeBox();
    for (var d in _disposers) {
      d();
    }
  }
}
