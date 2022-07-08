import 'package:hive_flutter/hive_flutter.dart';

abstract class CollectionHive<T> {
  Future<Box<T>> init();

  Future<Box<T>> openBox();

  Iterable<T> get values;

  Map<int, T> toMap();

  Future<int> add(T value);

  Future<Iterable<int>> addAll(Iterable<T> values);

  Future<void> edit(int key, T value);

  Future<void> delete(int key);

  void close();
}
