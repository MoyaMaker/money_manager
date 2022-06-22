import 'package:mobx/mobx.dart';

part 'form_cart_item_store.g.dart';

class FormCartItemStore extends _FormCartItemStore with _$FormCartItemStore {
  FormCartItemStore(String price, String quantity) : super(price, quantity);
}

abstract class _FormCartItemStore with Store {
  _FormCartItemStore(this.price, this.quantity) {
    _disposers = [
      reaction((_) => price, validatePrice),
      reaction((_) => quantity, validateQuantity)
    ];
  }

  late List<ReactionDisposer> _disposers;

  final ErrorFormCartItemStore error = ErrorFormCartItemStore();

  @observable
  late String price;

  @observable
  late String quantity;

  @action
  void setPrice(String value) => price = value;

  @action
  void setQuantity(String value) => quantity = value;

  @action
  void validatePrice(String value) {
    if (value.isEmpty) {
      error.price = 'Debes asignar un precio';
      return;
    }

    final p = double.tryParse(value);

    if (p == null) {
      error.price = 'Debes ingresar una cantidad valida';
      return;
    }

    if (p <= 0) {
      error.price = 'El precio no puede ser 0 o menor';
      return;
    }

    error.price = null;
  }

  @action
  void validateQuantity(String value) {
    if (value.isEmpty) {
      error.quantity = 'Debes ingresar una cantidad';
      return;
    }

    final q = double.tryParse(value);

    if (q == null) {
      error.quantity = 'Ingresa una cantidad valida';
      return;
    }

    if (q <= 0) {
      error.quantity = 'La cantidad no puede ser 0 o menor';
      return;
    }

    error.quantity = null;
  }

  @action
  void dispose() {
    for (var d in _disposers) {
      d();
    }
  }
}

class ErrorFormCartItemStore extends _ErrorFormCartItemStore
    with _$ErrorFormCartItemStore {}

abstract class _ErrorFormCartItemStore with Store {
  @observable
  String? price;

  @observable
  String? quantity;

  @computed
  bool get hasErrors => price != null || quantity != null;
}
