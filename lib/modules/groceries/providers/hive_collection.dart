import 'package:hive_flutter/hive_flutter.dart';

abstract class CollectionHive<T> {
  Future<Box<T>> init();

  Iterable<T> get values;

  Future<Iterable<int>> addAll(Iterable<T> values);

  Map<int, T> toMap();

  Future<int> add(T value);

  Future<void> edit(int key, T value);

  Future<void> delete(int key);
}
