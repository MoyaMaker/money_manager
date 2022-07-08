import 'package:hive_flutter/hive_flutter.dart';

abstract class CollectionHive<T> {
  // ignore: unused_field
  late Box<T> _box;

  Future<Box<T>> init();

  Iterable<T> get values;

  Map<int, T> toMap();

  Future<int> add(T value);

  Future<Iterable<int>> addAll(Iterable<T> values);

  Future<void> edit(int key, T value);

  Future<void> delete(int key);

  close();
}
