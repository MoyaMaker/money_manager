import 'package:flutter/material.dart';

import '../stores/credit_card_store.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key, required this.cardList}) : super(key: key);

  final List<CreditCardStore> cardList;

  static late Size _size;

  static double _cardSizeWidth = 0.0;
  static double _cardSizeHeigh = 0.0;

  // Positions
  static late double _firstPosition;
  static late double _secondPosition;
  static late double _thirdPosition;

  final _animatedDuration = const Duration(microseconds: 400);

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    _cardSizeWidth = _size.width * 0.85;
    _cardSizeHeigh = _size.width * 0.5;

    _firstPosition = (_cardSizeWidth * 0.9625) * -1;
    _secondPosition = _size.width * 0.075;
    _thirdPosition = _size.width * 0.9625;

    return SizedBox(
      width: _size.width,
      height: _size.width * 0.55,
      child: Stack(children: [
        AnimatedPositioned(
            duration: _animatedDuration,
            left: _firstPosition,
            child: cardWidget('')),
        AnimatedPositioned(
            duration: _animatedDuration,
            left: _secondPosition,
            child: Container(color: Colors.red, child: const Text('BBVA'))),
        AnimatedPositioned(
            duration: _animatedDuration,
            left: _thirdPosition,
            child: cardWidget(''))
      ]),
    );
  }

  List<Widget> _items() {
    return cardList
        .map((e) => AnimatedPositioned(
            child: cardWidget(e.creditName), duration: _animatedDuration))
        .toList();
  }

  Widget cardWidget(String cardName) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          // _creditCardStore.prevCard();
        } else {
          // _creditCardStore.nextCard();
        }
      },
      child: SizedBox(
        width: _cardSizeWidth,
        height: _cardSizeHeigh,
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
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.red)),
        ),
      ),
    );
  }
}
