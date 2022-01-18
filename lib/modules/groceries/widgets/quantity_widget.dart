import 'package:flutter/material.dart';
import 'package:money_manager/modules/groceries/stores/grocery_item_store.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget(
      {Key? key,
      required this.item,
      required this.quantity,
      required this.textEditingController,
      required this.onSubmitted,
      required this.onSave,
      required this.onAdd,
      required this.onRemove})
      : super(key: key);

  final GroceryItemStore item;
  final double quantity;
  final TextEditingController textEditingController;
  final void Function(String) onSubmitted;
  final void Function() onSave;
  final void Function() onRemove;
  final void Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buttonQuantity(
            icon: const Icon(Icons.remove, size: 20.0), onTap: onRemove),
        quantityCounterField(context, item, textEditingController),
        buttonQuantity(icon: const Icon(Icons.add, size: 20.0), onTap: onAdd),
      ],
    );
  }

  Widget buttonQuantity({required Icon icon, required void Function() onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(padding: const EdgeInsets.all(10.0), child: icon),
      onTap: onTap,
    );
  }

  Widget quantityCounterField(BuildContext context, GroceryItemStore item,
      TextEditingController textEditingController) {
    return InkWell(
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              contentPadding: const EdgeInsets.all(15.0),
              children: [
                Text(item.name,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold)),
                TextField(
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  autofocus: true,
                  onSubmitted: onSubmitted,
                ),
                OutlinedButton.icon(
                    onPressed: onSave,
                    icon: const Icon(Icons.add),
                    label: const Text('Agregar'))
              ],
            );
          },
        );
      },
      child: Container(
          width: 70.0,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          padding: const EdgeInsets.all(5.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15.0)),
          child: Text(quantity.toString(),
              style: const TextStyle(
                  fontSize: 16.0, fontWeight: FontWeight.bold))),
    );
  }
}
