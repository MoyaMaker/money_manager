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
        containerCartList = ObservableList.of([]);

        if (containerCartList.isEmpty) {
          createList();
        }
      })
    ];
  }

  @observable
  late ObservableList<CartListStore> containerCartList;

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

class CartListStore extends _CartListStore with _$CartListStore {
  CartListStore({String listName = 'Nueva lista'}) : super(listName);
}

abstract class _CartListStore with Store {
  late List<ReactionDisposer> _disposers;

  _CartListStore(this.listName) {
    _disposers = [];
  }

  @observable
  late String id;

  @observable
  late String listName;

  @observable
  ObservableList<CartItemStore> cartList = ObservableList.of([]);

  @action
  void _setId() => id = const Uuid().v1();

  @action
  void dispose() {
    for (var d in _disposers) {
      d();
    }
  }
}
