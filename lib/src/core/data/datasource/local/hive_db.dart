import 'package:hive_flutter/adapters.dart';

class HiveDB {
  static HiveDB? _instance;

  factory HiveDB() {
    if (_instance == null) {
      throw Exception(
        'HiveDB is not initialized. '
        'Please call HiveDB.ensureInitialized before.',
      );
    }
    return _instance!;
  }

  const HiveDB._();

  static Future<void> ensureInitialized() async {
    await Hive.initFlutter();
    _instance ??= const HiveDB._();
  }

  static Future<Box<T>> openBox<T>(String name) async {
    return Hive.isBoxOpen(name)
        ? Hive.box<T>(name)
        : await Hive.openBox<T>(name);
  } // TODO: implement openBox
}
