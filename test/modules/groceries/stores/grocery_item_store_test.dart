import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:money_manager/modules/groceries/stores/grocery_item_store.dart';

void main() {
  test('Formatting price', () {
    // Arrange
    final item = GroceryItemStore(id: '1', name: 'Manzana', unitPrice: 15.0);
    const expectedResult = r'$15.00';
    // Act
    // Assert
    expect(item.unitPriceFormatted, expectedResult);
  });

  group('adding and remove grocery item from list', () {
    late GroceryListStore groceryListStore;

    setUp(() {
      groceryListStore = GroceryListStore();

      groceryListStore.items = ObservableList.of([
        GroceryItemStore(id: '1', name: 'Manzana', unitPrice: 15.0),
        GroceryItemStore(id: '2', name: 'Aguacate', unitPrice: 83.5),
        GroceryItemStore(id: '3', name: 'Plátano', unitPrice: 23.0)
      ]);
    });

    test('create new grocery item', () {
      // Arrange
      final newItem = GroceryItemStore(id: '0', name: 'Example', unitPrice: 10);

      // Act
      groceryListStore.add(newItem);

      // Assert
      expect(groceryListStore.items.length, 4);
    });

    test('remove item from list', () {
      // Arrange
      final oldItem =
          GroceryItemStore(id: '1', name: 'Manzana', unitPrice: 15.0);

      // Act
      groceryListStore.remove(oldItem);

      // Assert
      expect(groceryListStore.items.length, 3);
    });
  });

  group('testing filtered items', () {
    late GroceryListStore groceryListStore;

    setUp(() {
      groceryListStore = GroceryListStore();

      groceryListStore.items = ObservableList.of([
        GroceryItemStore(id: '1', name: 'Manzana', unitPrice: 15.0),
        GroceryItemStore(id: '2', name: 'Aguacate', unitPrice: 83.5),
        GroceryItemStore(id: '3', name: 'Plátano', unitPrice: 23.0)
      ]);
    });

    test('search into list', () {
      // Arrange
      String query = 'zana';
      final expectedSearch =
          GroceryItemStore(id: '1', name: 'Manzana', unitPrice: 15.0);

      // Act
      groceryListStore.setSearchQuery(query);

      // Assert
      expect(groceryListStore.filteredItems.first.id, expectedSearch.id);
      expect(groceryListStore.filteredItems.first.name, expectedSearch.name);
      expect(groceryListStore.filteredItems.first.unitPrice,
          expectedSearch.unitPrice);
    });

    test('search with empty query', () {
      // Arrange
      String query = '';

      // Act
      groceryListStore.setSearchQuery(query);

      // Assert
      expect(groceryListStore.filteredItems.length, 3);
    });
  });
}
