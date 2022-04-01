import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'stores/credit_card_store.dart';

class MainCreditCardPage extends StatelessWidget {
  const MainCreditCardPage({Key? key}) : super(key: key);

  static late Size _size;
  static double cardSizeWidth = 0.0;
  static double cardSizeHeigh = 0.0;

  static late double firstPosition;
  static late double secondPosition;
  static late double thirdPosition;

  final animatedDuration = const Duration(microseconds: 400);

  static late CreditCardListStore _creditCardStore;

  @override
  Widget build(BuildContext context) {
    _creditCardStore = Provider.of<CreditCardListStore>(context, listen: false);
    _size = MediaQuery.of(context).size;

    cardSizeWidth = _size.width * 0.85;
    cardSizeHeigh = _size.width * 0.5;

    firstPosition = (cardSizeWidth * 0.9625) * -1;
    secondPosition = _size.width * 0.075;
    thirdPosition = _size.width * 0.9625;

    return Scaffold(
      appBar: AppBar(title: const Text('Tarjetas'), actions: <Widget>[
        IconButton(
            tooltip: 'Añadir tarjeta',
            onPressed: () => Navigator.pushNamed(context, 'credit_card/create'),
            icon: const Icon(Icons.add))
      ]),
      body: Column(
        children: [
          // Adding builder
          Observer(builder: (_) => cardBuilder()),

          // Navigation buttons
          Observer(
            builder: (_) => Visibility(
              visible: _creditCardStore.creditCardList.length > 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      color: Colors.blue,
                      onPressed: () => _creditCardStore.prevCard(),
                      icon: const Icon(Icons.arrow_left)),
                  dots(),
                  IconButton(
                      color: Colors.blue,
                      onPressed: () => _creditCardStore.nextCard(),
                      icon: const Icon(Icons.arrow_right))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget cardBuilder() {
    if (_creditCardStore.showProgress) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SizedBox(
      width: _size.width,
      height: _size.width * 0.55,
      child: Stack(children: [
        AnimatedPositioned(
            duration: animatedDuration,
            left: firstPosition,
            child: firstWidget()),
        AnimatedPositioned(
            duration: animatedDuration,
            left: secondPosition,
            child: cardWidget(_creditCardStore.activeCard.creditName)),
        AnimatedPositioned(
            duration: animatedDuration,
            left: thirdPosition,
            child: secondWidget())
      ]),
    );
  }

  Widget dots() {
    return Row(children: [
      ..._creditCardStore.creditCardList
          .map((item) => dot(_creditCardStore.creditCardList.indexOf(item)))
    ]);
  }

  Widget dot(int index) {
    final activeIndex = _creditCardStore.activeIndex;

    final size = index == activeIndex ? 10.0 : 8.0;
    final margin = _creditCardStore.creditCardList.length > 1 &&
            index < (_creditCardStore.creditCardList.length - 1)
        ? 5.0
        : 0.0;

    return Container(
      decoration: BoxDecoration(
          color: index == activeIndex
              ? Colors.blue
              : const Color.fromRGBO(0, 0, 0, 0.3),
          borderRadius: BorderRadius.circular(10.0)),
      width: size,
      height: size,
      margin: EdgeInsets.only(right: margin),
    );
  }

  Widget firstWidget() {
    if (_creditCardStore.activeIndex == 0 &&
        _creditCardStore.creditCardList.isNotEmpty) {
      return Container();
    } else {
      return cardWidget('');
    }
  }

  Widget secondWidget() {
    if (_creditCardStore.activeIndex ==
        (_creditCardStore.creditCardList.length - 1)) {
      return Container();
    } else {
      return cardWidget('');
    }
  }

  Widget cardWidget(String cardName) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          _creditCardStore.prevCard();
        } else {
          _creditCardStore.nextCard();
        }
      },
      child: SizedBox(
        width: cardSizeWidth,
        height: cardSizeHeigh,
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Colors.grey,
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    offset: Offset(0.0, 2.0),
                    blurRadius: 10.0)
              ],
              borderRadius: BorderRadius.circular(8.0)),
          child: Text(cardName,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0)),
        ),
      ),
    );
  }
}
