import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:money_manager/modules/groceries/stores/grocery_item_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';
import 'package:money_manager/modules/groceries/utils/math_double_utils.dart';
import 'package:money_manager/modules/groceries/widgets/quantity_widget.dart';

class GroceriesPage extends StatefulWidget {
  const GroceriesPage({Key? key}) : super(key: key);

  @override
  State<GroceriesPage> createState() => _GroceriesPageState();
}

class _GroceriesPageState extends State<GroceriesPage> {
  late ShoppingCartStore _shoppingCartStore;
  late GroceryListStore _groceryListStore;

  final quantityController = <TextEditingController>[];

  @override
  Widget build(BuildContext context) {
    _shoppingCartStore = Provider.of<ShoppingCartStore>(context, listen: false);
    _groceryListStore = Provider.of<GroceryListStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Despensa'),
        actions: [
          InkWell(
            onTap: () =>
                Navigator.pushNamed(context, 'groceries-shopping-cart'),
            child: Stack(alignment: Alignment.center, children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.shopping_cart, size: 24.0),
              ),
              Positioned(
                  top: 5.0,
                  right: 2.0,
                  child: Observer(
                    builder: (_) => Visibility(
                      visible: _shoppingCartStore.hasItems,
                      child: Container(
                          width: 20.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(3.0),
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: Text(_shoppingCartStore.countItems.toString(),
                              style: const TextStyle(fontSize: 12.0))),
                    ),
                  ))
            ]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: 'Nuevo producto',
        onPressed: () => Navigator.pushNamed(context, 'groceries-new-product'),
      ),
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Buscar'),
          ),
          Expanded(
              child: SizedBox(
                  width: double.infinity,
                  height: 300.0,
                  child: Observer(builder: (_) => gridItems()))),
        ],
      ),
    );
  }

  Widget gridItems() {
    return GridView.builder(
        itemCount: _groceryListStore.items.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            crossAxisSpacing: 5.0,
            childAspectRatio: 1,
            mainAxisSpacing: 5.0),
        itemBuilder: (ctx, index) {
          quantityController.add(TextEditingController(text: '1.0'));
          return itemWidget(
              ctx, _groceryListStore.items[index], quantityController[index]);
        });
  }

  Widget itemWidget(BuildContext context, GroceryItemStore item,
      TextEditingController textEditingController) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
            title: Text(item.name,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold)),
            subtitle: Text(item.unitPriceFormatted,
                style: const TextStyle(fontSize: 14.0, color: Colors.blueGrey)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: QuantityWidget(
                item: item,
                quantity: stringToDouble(textEditingController.text),
                textEditingController: textEditingController,
                onSave: () {
                  final quantity = stringToDouble(textEditingController.text);
                  _shoppingCartStore
                      .addItem(CartItemStore(item: item, quantity: quantity));
                  textEditingController.text = quantity.toString();
                  setState(() {});
                  Navigator.pop(context);
                },
                onSubmitted: (String newValue) {
                  final quantity = stringToDouble(newValue);
                  _shoppingCartStore
                      .addItem(CartItemStore(item: item, quantity: quantity));
                  textEditingController.text = quantity.toString();
                  setState(() {});
                  Navigator.pop(context);
                },
                onAdd: () {
                  double quantity = double.parse(textEditingController.text);
                  quantity = roundDouble(quantity + 1);
                  textEditingController.text = quantity.toString();
                  setState(() {});
                },
                onRemove: () {
                  double quantity = double.parse(textEditingController.text);
                  if (quantity > 1) {
                    quantity = roundDouble(quantity - 1);
                    textEditingController.text = quantity.toString();
                    setState(() {});
                  }
                }),
          ),
          OutlinedButton.icon(
              onPressed: () => _shoppingCartStore.addItem(CartItemStore(
                  item: item,
                  quantity: double.parse(textEditingController.text))),
              icon: const Icon(Icons.add),
              label: const Text('Agregar'))
        ],
      ),
    );
  }

  Widget buttonQuantity({required Icon icon, required void Function() onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(padding: const EdgeInsets.all(10.0), child: icon),
      onTap: onTap,
    );
  }
}
