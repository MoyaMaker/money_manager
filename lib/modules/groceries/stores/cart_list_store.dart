import 'package:mobx/mobx.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:uuid/uuid.dart';

part 'cart_list_store.g.dart';

class ContainerCartListStore extends _ContainerCartListStore
    with _$ContainerCartListStore {}

abstract class _ContainerCartListStore with Store {
  late List<ReactionDisposer> _disposers;

  _ContainerCartListStore() {
    _disposers = [
      autorun((_) {
        // If list is empty should create a default list
        if (containerCartList.isEmpty) {
          createList();
        }
      })
    ];
  }

  @observable
  ObservableList<CartListStore> containerCartList = ObservableList.of([]);

  @action
  void createList() {
    containerCartList.add(CartListStore());
  }

  @action
  void dispose() {
    for (var d in _disposers) {
      d();
    }
  }
}

class CartListStore extends _CartListStore with _$CartListStore {}

abstract class _CartListStore with Store {
  late List<ReactionDisposer> _disposers;

  _CartListStore() {
    _disposers = [];
  }

  @observable
  String id = const Uuid().v1();

  @observable
  String? listName = 'Nueva lista';

  @observable
  ObservableList<CartItemStore> cartList = ObservableList.of([]);

  @action
  void editListName(String name) => listName = name;

  @action
  void add(CartItemStore value) {
    return cartList.add(value);
  }

  @action
  void edit(int index, CartItemStore value) {
    cartList[index] = value;
  }

  @action
  bool delete(CartItemStore value) {
    return cartList.remove(value);
  }

  @action
  void dispose() {
    for (var d in _disposers) {
      d();
    }
  }
}
