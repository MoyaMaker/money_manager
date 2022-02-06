import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:money_manager/modules/groceries/widgets/product_widget.dart';
import 'package:money_manager/modules/groceries/stores/product_store.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';
import 'package:money_manager/modules/groceries/stores/shopping_cart_store.dart';

class GroceriesPage extends StatelessWidget {
  const GroceriesPage({Key? key}) : super(key: key);

  static late ShoppingCartStore _shoppingCartStore;
  static late ProductListStore _productListStore;

  @override
  Widget build(BuildContext context) {
    _shoppingCartStore = Provider.of<ShoppingCartStore>(context, listen: false);
    _productListStore = Provider.of<ProductListStore>(context, listen: false);

    final _searchTextController = TextEditingController();

    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Despensa'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, 'groceries/new-product'),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              onChanged: (String value) =>
                  _productListStore.setSearchQuery(value),
              controller: _searchTextController,
              placeholder: 'Buscar',
            ),
          ),
          // Items list view
          Expanded(
              child: SizedBox(
                  width: double.infinity,
                  height: 100.0,
                  child: Observer(builder: (_) => gridItems()))),
        ],
      ),
    );
  }

  Widget gridItems() {
    final products = _productListStore.filteredProducts;

    if (products.isEmpty && _productListStore.feedbackMessage.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (products.isEmpty && _productListStore.feedbackMessage.isNotEmpty) {
      return Center(
        child: Text(_productListStore.feedbackMessage),
      );
    }

    const extraWidget = SizedBox(height: 36.0);

    final module = products.length % 2;

    final quantity = module == 0 ? products.length + 1 : products.length;

    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        addAutomaticKeepAlives: false,
        itemCount: quantity,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 160,
            maxCrossAxisExtent: 300,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0),
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (ctx, index) {
          if (module == 0 && (quantity - 1) == index) return extraWidget;
          return itemWidget(ctx, products[index]);
        });
  }

  Widget itemWidget(BuildContext context, ProductStore product) {
    return ProductWidget(
        product: product,
        onSave: (CartItemStore cartItem) {
          _shoppingCartStore.addItem(cartItem);

          Navigator.pop(context);
        });
  }
}
