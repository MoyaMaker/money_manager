import 'package:mobx/mobx.dart';
import 'package:money_manager/modules/credit_card/stores/credit_card_store.dart';
import 'package:uuid/uuid.dart';

part 'create_credit_card_store.g.dart';

class CreateCreditCardStore = _CreateCreditCardStore
    with _$CreateCreditCardStore;

abstract class _CreateCreditCardStore with Store {
  _CreateCreditCardStore() {
    _disposers = [
      reaction((_) => cardName, validateCardName),
      reaction((_) => creditLimit, validateCreditLimit),
      reaction((_) => dueDate, validateDueDate),
      reaction((_) => paymentLimitDate, validatePaymentLimitDate)
    ];
  }

  final error = ErrorFormCreditCard();

  late List<ReactionDisposer> _disposers;

  @observable
  String cardName = '';

  @observable
  String creditLimit = '';

  @observable
  String dueDate = '';

  @observable
  String paymentLimitDate = '';

  @computed
  bool get canSave => !error.hasErrors;

  @computed
  CreditCardStore get creditCard => CreditCardStore(
      id: const Uuid().v1(),
      creditName: cardName,
      creditLimit: double.parse(creditLimit),
      dueDate: int.parse(dueDate),
      paymentLimitDate: int.parse(paymentLimitDate));

  @action
  void setCardName(String value) => cardName = value;

  @action
  void setCreditLimit(String value) => creditLimit = value;

  @action
  void setDueDate(String value) => dueDate = value;

  @action
  void setPaymentLimitDate(String value) => paymentLimitDate = value;

  @action
  void validateCardName(String value) {
    if (value.isEmpty) {
      error.cardName = 'Debe asignar un nombre a la tarjeta';
      return;
    }

    const minLength = 2;
    if (value.length < minLength) {
      error.cardName = 'El nombre no puede ser menor que $minLength caracteres';
      return;
    }

    const maxLength = 25;
    if (value.length >= maxLength) {
      error.cardName = 'El nombre no debe ser mayor a $maxLength caracteres';
      return;
    }

    error.cardName = null;
  }

  @action
  void validateCreditLimit(String value) {
    if (value.isEmpty) {
      error.creditLimit = 'Debes asignar un límite de crédito';
      return;
    }

    final valueDouble = double.tryParse(value);

    if (valueDouble == null) {
      error.creditLimit = 'Ingresa una cantidad valida';
      return;
    }

    if (valueDouble <= 0) {
      error.creditLimit = 'El valor mínimo es de 1';
      return;
    }

    error.creditLimit = null;
  }

  @action
  void validateDueDate(String value) {
    if (value.isEmpty) {
      error.dueDate = 'Debes ingresar una fecha de corte';
      return;
    }

    final date = int.tryParse(value);

    if (date == null) {
      error.dueDate = 'Ingresa un día valido';
      return;
    }

    if (date <= 0 || date > 31) {
      error.dueDate = 'Ingresa un día valido';
      return;
    }

    error.dueDate = null;
  }

  @action
  void validatePaymentLimitDate(String value) {
    if (value.isEmpty) {
      error.paymentLimitDate = 'Debes ingresar una fecha límite de pago';
      return;
    }

    final date = int.tryParse(value);

    if (date == null) {
      error.paymentLimitDate = 'Ingresa un día valido';
      return;
    }

    if (date <= 0 || date > 31) {
      error.paymentLimitDate = 'Ingresa un día valido';
      return;
    }

    error.paymentLimitDate = null;
  }

  @action
  void validateAll() {
    validateCardName(cardName);
    validateCreditLimit(creditLimit);
    validateDueDate(dueDate);
    validatePaymentLimitDate(paymentLimitDate);
  }

  @action
  void dispose() {
    for (var d in _disposers) {
      d();
    }
  }
}

class ErrorFormCreditCard = _ErrorFormCreditCard with _$ErrorFormCreditCard;

abstract class _ErrorFormCreditCard with Store {
  @observable
  String? cardName;

  @observable
  String? creditLimit;

  @observable
  String? dueDate;

  @observable
  String? paymentLimitDate;

  @computed
  bool get hasErrors =>
      cardName != null ||
      dueDate != null ||
      creditLimit != null ||
      paymentLimitDate != null;
}
