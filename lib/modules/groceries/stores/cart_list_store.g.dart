// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContainerCartListStore on _ContainerCartListStore, Store {
  late final _$containerCartListAtom =
      Atom(name: '_ContainerCartListStore.containerCartList', context: context);

  @override
  ObservableList<CartListStore> get containerCartList {
    _$containerCartListAtom.reportRead();
    return super.containerCartList;
  }

  @override
  set containerCartList(ObservableList<CartListStore> value) {
    _$containerCartListAtom.reportWrite(value, super.containerCartList, () {
      super.containerCartList = value;
    });
  }

  late final _$_ContainerCartListStoreActionController =
      ActionController(name: '_ContainerCartListStore', context: context);

  @override
  void createList() {
    final _$actionInfo = _$_ContainerCartListStoreActionController.startAction(
        name: '_ContainerCartListStore.createList');
    try {
      return super.createList();
    } finally {
      _$_ContainerCartListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_ContainerCartListStoreActionController.startAction(
        name: '_ContainerCartListStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_ContainerCartListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
containerCartList: ${containerCartList}
    ''';
  }
}

mixin _$CartListStore on _CartListStore, Store {
  late final _$idAtom = Atom(name: '_CartListStore.id', context: context);

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$listNameAtom =
      Atom(name: '_CartListStore.listName', context: context);

  @override
  String? get listName {
    _$listNameAtom.reportRead();
    return super.listName;
  }

  @override
  set listName(String? value) {
    _$listNameAtom.reportWrite(value, super.listName, () {
      super.listName = value;
    });
  }

  late final _$cartListAtom =
      Atom(name: '_CartListStore.cartList', context: context);

  @override
  ObservableList<CartItemStore> get cartList {
    _$cartListAtom.reportRead();
    return super.cartList;
  }

  @override
  set cartList(ObservableList<CartItemStore> value) {
    _$cartListAtom.reportWrite(value, super.cartList, () {
      super.cartList = value;
    });
  }

  late final _$_CartListStoreActionController =
      ActionController(name: '_CartListStore', context: context);

  @override
  void editListName(String name) {
    final _$actionInfo = _$_CartListStoreActionController.startAction(
        name: '_CartListStore.editListName');
    try {
      return super.editListName(name);
    } finally {
      _$_CartListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(CartItemStore value) {
    final _$actionInfo = _$_CartListStoreActionController.startAction(
        name: '_CartListStore.add');
    try {
      return super.add(value);
    } finally {
      _$_CartListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void edit(int index, CartItemStore value) {
    final _$actionInfo = _$_CartListStoreActionController.startAction(
        name: '_CartListStore.edit');
    try {
      return super.edit(index, value);
    } finally {
      _$_CartListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool delete(CartItemStore value) {
    final _$actionInfo = _$_CartListStoreActionController.startAction(
        name: '_CartListStore.delete');
    try {
      return super.delete(value);
    } finally {
      _$_CartListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_CartListStoreActionController.startAction(
        name: '_CartListStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_CartListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
listName: ${listName},
cartList: ${cartList}
    ''';
  }
}
