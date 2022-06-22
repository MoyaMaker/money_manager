import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:money_manager/modules/groceries/enums/promotions_enum.dart';
import 'package:money_manager/modules/groceries/stores/cart_item_store.dart';

import 'form_cart_item_widget.dart';

class CartItemWidget extends StatefulWidget {
  final CartItemStore cartItem;
  final ValueChanged<CartItemStore> updatePromotion;
  final ValueChanged<DismissDirection> onDismissed;
  final ValueChanged<CartItemStore> onSave;

  const CartItemWidget(
      {Key? key,
      required this.cartItem,
      required this.updatePromotion,
      required this.onDismissed,
      required this.onSave})
      : super(key: key);

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  late TextEditingController _discountController;
  late FocusNode _discountTextField;

  @override
  void initState() {
    super.initState();

    _discountTextField = FocusNode();
    final initialValue = widget.cartItem.discount?.toString() ?? '';
    _discountController = TextEditingController(text: initialValue);
  }

  @override
  void dispose() {
    super.dispose();

    _discountController.dispose();
    _discountTextField.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.cartItem.product.id),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.all(15.0),
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete, size: 40.0, color: Colors.white),
      ),
      onDismissed: widget.onDismissed,
      child: Column(
        children: [
          Observer(
            builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                    value: widget.cartItem.hasChecked,
                    onChanged: (bool? newValue) =>
                        widget.cartItem.setHasChecked(newValue)),

                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        Text(widget.cartItem.product.name,
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                        // Unit price
                        Text(widget.cartItem.product.unitPriceFormatted,
                            style: TextStyle(
                                fontSize: 13.0, color: Colors.grey[600])),
                        // Subtotal Price
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              // Show when has discount
                              Visibility(
                                visible: widget.cartItem.hasSomeDiscount,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5.0),
                                  child: Text(widget.cartItem.subtotalFormatted,
                                      style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ),
                              ),
                              // Subtotal price
                              Text(widget.cartItem.totalFormatted,
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Quantity
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text('Cantidad',
                          style: TextStyle(
                              fontSize: 13.0, color: Colors.grey[600])),
                      Container(
                          width: 70.0,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          padding: const EdgeInsets.all(5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Text(widget.cartItem.quantity.toString(),
                              style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),

                // Edit button
                IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return FormCartItem(
                                product: widget.cartItem.product,
                                quantity: widget.cartItem.quantity,
                                onSave: widget.onSave);
                          },
                        )),

                // Show promotion container
                IconButton(
                    onPressed: () => widget.cartItem
                        .setShowDetails(!widget.cartItem.showDetails),
                    icon: widget.cartItem.showDetails
                        ? const Icon(Icons.keyboard_arrow_up)
                        : const Icon(Icons.keyboard_arrow_down))
              ],
            ),
          ),

          // Promotion container
          Observer(
            builder: (_) => Visibility(
              visible: widget.cartItem.showDetails,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration:
                    const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title label
                    Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      child: const Text('Promoción',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600)),
                    ),
                    Row(
                      children: [
                        // Dropdown
                        Observer(
                          builder: (_) => PromotionDropdown(
                            initialValue: widget.cartItem.promotion,
                            items: Promotions.values,
                            onChanged: (value) {
                              widget.cartItem.setPromotion(value);
                              widget.updatePromotion(widget.cartItem);

                              if (widget.cartItem.promotion!.showTextField) {
                                _discountTextField.requestFocus();
                              } else {
                                _discountController.text = '';
                              }
                            },
                          ),
                        ),

                        // Input discount
                        SizedBox(
                          width: 80.0,
                          height: 32.0,
                          child: Visibility(
                            visible: widget.cartItem.promotion!.showTextField,
                            child: TextField(
                                controller: _discountController,
                                focusNode: _discountTextField,
                                keyboardType: TextInputType.number,
                                onChanged: (String value) {
                                  final discount = double.tryParse(value);
                                  widget.cartItem.setDiscount(discount);
                                  widget.updatePromotion(widget.cartItem);
                                },
                                onSubmitted: (value) {
                                  final discount =
                                      double.tryParse(_discountController.text);
                                  widget.cartItem.setDiscount(discount);
                                  widget.updatePromotion(widget.cartItem);
                                },
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    isDense: true)),
                          ),
                        ),

                        // Add discount
                        IconButton(
                            color: Colors.green,
                            icon: const Icon(Icons.check),
                            onPressed: () {
                              final discount =
                                  double.tryParse(_discountController.text);
                              widget.cartItem.setDiscount(discount);
                              widget.updatePromotion(widget.cartItem);
                            }),
                        // Delete discount
                        IconButton(
                            color: Colors.red,
                            onPressed: () {
                              _discountController.clear();
                              widget.cartItem.removeDiscount();
                              widget.updatePromotion(widget.cartItem);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),

                    // Input error
                    Observer(
                      builder: (_) => Text(widget.cartItem.error.discount ?? '',
                          style: const TextStyle(color: Colors.red)),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PromotionDropdown extends StatefulWidget {
  final Promotions? initialValue;
  final List<Promotions> items;
  final ValueChanged<Promotions?> onChanged;

  const PromotionDropdown(
      {Key? key,
      this.initialValue,
      required this.items,
      required this.onChanged})
      : super(key: key);

  @override
  State<PromotionDropdown> createState() => _PromotionDropdownState();
}

class _PromotionDropdownState extends State<PromotionDropdown> {
  late Promotions? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue ?? Promotions.values.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Promotions>(
        value: selectedValue,
        items: Promotions.values
            .map((Promotions promo) => DropdownMenuItem<Promotions>(
                  value: promo,
                  child: Text(promo.value),
                ))
            .toList(),
        onChanged: (Promotions? value) {
          widget.onChanged(value);
          setState(() {
            selectedValue = value;
          });
        });
  }
}
