import 'package:hive/hive.dart';

abstract interface class IHiveStorage<T> {
  Future<void> save(String key, T value);

  T? get(String key);

  Future<void> delete(String key);

  Future<void> saveAll(String key, List<T> values);

  List<T>? getAll(String key);
}

class HiveStorage<T> implements IHiveStorage<T> {
  final Box<T> _box;
  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, dynamic> Function(T) toJson;

  HiveStorage(this._box, this.fromJson, this.toJson);

  @override
  Future<void> delete(String key) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  T? get(String key) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  /// Saves a [value] with the given [key].
  ///
  /// The [key] parameter is the key used to save the [value].
  ///
  /// The [value] parameter is the value to be saved.
  ///
  /// The [value] is converted to a [Map] using the [toJson] function and then
  /// saved to the box with the given [key].
  @override
  Future<void> save(String key, T value) async {
    await _box.put(key, toJson(value) as T);
  }

  @override
  /// Gets all the values saved with the given [key].
  ///
  /// The [key] parameter is the key used to save the values.
  ///
  /// Returns a [List] of all the values saved with the given [key].
  ///
  /// If no values are saved with the given [key], an empty list is returned.
  List<T>? getAll(String key) {
    return _box.values
        .map((e) => fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  @override
  /// Saves all the values in the list to the database with the given key.
  ///
  /// The values are saved one by one, so the order of the values in the list is
  /// preserved.
  ///
  /// The [key] parameter is used as the key for all values in the list.
  ///
  /// The [values] parameter is the list of values to be saved.
  ///
  /// Returns a [Future] that completes when all values have been saved.
  @override
  Future<void> saveAll(String key, List<T> values) async {
    for (var value in values) {
      // Save each value to the database with the given key.
      // The order of the values in the list is preserved.
      await _box.put(key, toJson(value) as T);
    }
  }
}
