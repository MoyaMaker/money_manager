import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'credit_card_store.g.dart';

class CreditCardListStore = _CreditCardListStore with _$CreditCardListStore;

abstract class _CreditCardListStore with Store {
  _CreditCardListStore() {
    _disposers = [
      autorun((_) async {
        await _initBox();

        _getCards();
      })
    ];
  }

  late List<ReactionDisposer> _disposers;

  late Box<CreditCardStore> _box;

  @observable
  int activeIndex = 0;

  @observable
  String feedbackMessage = '';

  @observable
  ObservableList<CreditCardStore> creditCardList = ObservableList.of([]);

  @computed
  CreditCardStore get activeCard => creditCardList[activeIndex];

  @computed
  bool get showProgress => creditCardList.isEmpty && feedbackMessage.isEmpty;

  @action
  Future<void> _initBox() async {
    const boxName = 'credit_card';
    if (Hive.isBoxOpen(boxName)) {
      _box = Hive.box<CreditCardStore>(boxName);
    } else {
      _box = await Hive.openBox<CreditCardStore>(boxName);
    }
  }

  @action
  void nextCard() {
    if (activeIndex < (creditCardList.length - 1)) {
      activeIndex++;
    } else {
      activeIndex = 0;
    }
  }

  @action
  void prevCard() {
    if (activeIndex > 0) {
      activeIndex--;
    } else {
      activeIndex = creditCardList.length - 1;
    }
  }

  @action
  void _getCards() {
    final list = _box.values.toList();

    if (list.isEmpty) {
      feedbackMessage = 'No hay tarjetas registradas';
    }

    creditCardList = ObservableList.of(list);
  }

  @action
  Future<void> add(CreditCardStore card) async {
    final id = card.id;

    // Save in Hive
    await _box.put(id, card);

    // Save in store
    creditCardList.add(card);
  }

  @action
  void dispose() {
    for (var d in _disposers) {
      d();
    }
  }
}

@HiveType(typeId: 4, adapterName: 'CreditCardAdapter')
class CreditCardStore = _CreditCardStore with _$CreditCardStore;

abstract class _CreditCardStore with Store {
  _CreditCardStore(
      {required this.id,
      required this.creditName,
      required this.creditLimit,
      required this.dueDate,
      required this.paymentLimitDate});

  @HiveField(0)
  @observable
  late String id;

  @HiveField(1)
  @observable
  late String creditName;

  @HiveField(2)
  @observable
  late double creditLimit;

  @HiveField(3)
  @observable
  late int dueDate;

  @HiveField(4)
  @observable
  late int paymentLimitDate;

  @computed
  String get creditLimitFormatted =>
      NumberFormat.currency(locale: 'es_MX', symbol: r'$').format(creditLimit);
}
