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

  static late TextEditingController _searchTextController;

  @override
  Widget build(BuildContext context) {
    _shoppingCartStore = Provider.of<ShoppingCartStore>(context, listen: false);
    _productListStore = Provider.of<ProductListStore>(context, listen: false);

    _searchTextController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Despensa')),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Despensa'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Tarjetas de crédito'),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, 'groceries/new-product'),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: Column(
        children: [
          // Search bar
          searchBar(),
          // Items list view

          Expanded(
              child: SizedBox(
                  height: 100.0, child: Observer(builder: (_) => gridItems())))
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CupertinoSearchTextField(
        onChanged: (String value) => _productListStore.setSearchQuery(value),
        controller: _searchTextController,
        placeholder: 'Buscar',
      ),
    );
  }

  Widget gridItems() {
    if (_productListStore.showProgress) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_productListStore.showFeedbackMessage) {
      return Center(
        child: Text(_productListStore.feedbackMessage),
      );
    }

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(10.0),
          sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 200,
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0),
              delegate: SliverChildBuilderDelegate(
                (context, index) => Observer(
                  builder: (_) => itemWidget(context, index,
                      _productListStore.filteredProducts[index]),
                ),
                childCount: _productListStore.filteredProducts.length,
              )),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 80.0,
          ),
        )
      ],
    );
  }

  Widget itemWidget(BuildContext context, int index, ProductStore product) {
    return ProductWidget(
      product: product,
      onEdit: (ProductStore p) {
        _productListStore.edit(p);

        Navigator.pop(context);
      },
      onDelete: () {
        _productListStore.remove(product);

        Navigator.pop(context);
      },
      onAddToCart: (CartItemStore cartItem) {
        _shoppingCartStore.addItem(cartItem);

        Navigator.pop(context);
      },
    );
  }
}
