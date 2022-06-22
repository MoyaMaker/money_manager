import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';

part 'new_product_store.g.dart';

class FormNewProduct extends _FormNewProduct with _$FormNewProduct {}

abstract class _FormNewProduct with Store {
  _FormNewProduct() {
    _disposer = [
      reaction((_) => name, validateName),
      reaction((_) => unitPrice, validateUnitPrice),
      reaction((_) => quantity, validateQuantity)
    ];
  }

  List<ReactionDisposer> _disposer = [];

  final ErrorProductFormState error = ErrorProductFormState();

  @observable
  String name = '';

  @observable
  String unitPrice = '';

  @observable
  String quantity = '1';

  @observable
  ObservableFuture<bool> nameChecked = ObservableFuture.value(true);

  @computed
  bool get isNameCheckedPending => nameChecked.status == FutureStatus.pending;

  @computed
  bool get canSave => !error.hasErrors;

  @action
  void setName(String value) => name = value;

  @action
  void setUnitPrice(String value) => unitPrice = value;

  @action
  void setQuantity(String value) => quantity = value;

  @action
  Future<bool> checkNameExist(String value) async {
    const boxName = 'products';

    late Box<ProductStore> box;

    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box<ProductStore>(boxName);
    } else {
      box = await Hive.openBox<ProductStore>(boxName);
    }

    final productList = box.values.toList();

    bool exist = false;

    for (var product in productList) {
      final itemName = product.name.toLowerCase().trim();
      final valueName = value.toLowerCase().trim();
      if (itemName == valueName) {
        exist = true;
      }
    }

    return exist;
  }

  @action
  Future<void> validateName(String value) async {
    if (value.isEmpty) {
      error.name = 'Debes ingresar un nombre al producto';
      return;
    }
    if (value.length < 3) {
      error.name = 'El nombre no puede ser tan corto';
      return;
    }

    if (value.length >= 3) {
      nameChecked = ObservableFuture(checkNameExist(value));

      final alreadyExist = await nameChecked;

      if (alreadyExist) {
        error.name = 'Este producto ya existe';
        return;
      }
    }

    error.name = null;
  }

  @action
  void validateUnitPrice(String stringValue) {
    if (stringValue.isEmpty) {
      error.unitPrice = 'Se requiere un precio para el producto';
      return;
    }

    final value = double.tryParse(stringValue);

    if (value == null) {
      error.unitPrice = 'Ingresa un precio valido';
      return;
    }

    const minValue = 0.05;
    if (value < minValue) {
      error.unitPrice = 'El valor no puede ser menor a \$$minValue';
      return;
    }

    error.unitPrice = null;
  }

  @action
  void validateQuantity(String stringValue) {
    if (stringValue.isEmpty) {
      error.quantity = 'Debes de ingresar una cantidad';
      return;
    }

    final value = double.tryParse(stringValue);

    if (value == null) {
      error.quantity = 'Ingresa una cantidad valida';
      return;
    }

    const minValue = 0.01;
    if (value < minValue) {
      error.quantity = 'La cantidad mínima es de $minValue';
      return;
    }

    error.quantity = null;
  }

  @action
  void validateAll() {
    validateName(name);
    validateUnitPrice(unitPrice);
    validateQuantity(quantity);
  }

  @action
  void dispose() {
    for (var d in _disposer) {
      d();
    }
  }
}

class ErrorProductFormState extends _ErrorProductFormState
    with _$ErrorProductFormState {}

abstract class _ErrorProductFormState with Store {
  @observable
  String? name;

  @observable
  String? unitPrice;

  @observable
  String? quantity;

  @computed
  bool get hasErrors => name != null || unitPrice != null || quantity != null;
}
