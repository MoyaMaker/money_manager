import 'package:flutter/material.dart';

class MainCreditCardPage extends StatefulWidget {
  const MainCreditCardPage({Key? key}) : super(key: key);

  @override
  State<MainCreditCardPage> createState() => _MainCreditCardPageState();
}

class _MainCreditCardPageState extends State<MainCreditCardPage> {
  late Size _size;
  double cardSizeWidth = 0.0;
  double cardSizeHeigh = 0.0;
  int activeIndex = 0;

  late double firstPosition;
  late double secondPosition;
  late double thirdPosition;

  final animatedDuration = const Duration(microseconds: 400);

  final cardList = ['BBVA', 'Hey Banco', 'Mercado Pago'];

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
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
                  child: cardWidget(cardList[activeIndex])),
              AnimatedPositioned(
                  duration: animatedDuration,
                  left: thirdPosition,
                  child: secondWidget())
            ]),
          ),

          // Navigation buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  color: Colors.blue,
                  onPressed: () => prev(),
                  icon: const Icon(Icons.arrow_left)),
              dots(),
              IconButton(
                  color: Colors.blue,
                  onPressed: () => next(),
                  icon: const Icon(Icons.arrow_right))
            ],
          )
        ],
      ),
    );
  }

  Widget dots() {
    return Row(
      children: [
        dot(0),
        dot(1),
        dot(2),
      ],
    );
  }

  Widget dot(int index) {
    final size = index == activeIndex ? 10.0 : 8.0;
    final margin =
        cardList.length > 1 && index < (cardList.length - 1) ? 5.0 : 0.0;

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

  void next() {
    if (activeIndex < (cardList.length - 1)) {
      activeIndex++;
    } else {
      activeIndex = 0;
    }
    setState(() {});
  }

  void prev() {
    if (activeIndex > 0) {
      activeIndex--;
    } else {
      activeIndex = cardList.length - 1;
    }
    setState(() {});
  }

  Widget firstWidget() {
    if (activeIndex == 0 && cardList.length > 1) {
      return Container();
    } else {
      return cardWidget('');
    }
  }

  Widget secondWidget() {
    if (activeIndex == (cardList.length - 1)) {
      return Container();
    } else {
      return cardWidget('');
    }
  }

  Widget cardWidget(String cardName) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          prev();
        } else {
          next();
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
