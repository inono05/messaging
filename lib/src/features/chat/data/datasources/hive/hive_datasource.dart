import 'package:hive/hive.dart';

import '../../../../../core/data/datasource/local/hive_db.dart';
import '../../models/hive_model_message.dart';

abstract class IHiveDatasource {
  Future<void> save(List<HiveModelMessage> messages);
  Future<List<HiveModelMessage>> getMessages();
}

class HiveDatasource implements IHiveDatasource {
  final String boxName;
  HiveDatasource({this.boxName = "messagesBox"});

  Future<Box> _openBox() async => await HiveDB.openBox(boxName);
  @override
  Future<void> save(List<HiveModelMessage> messages) async {
    final box = await _openBox();
    await box.clear();
    for (var m in messages) {
      await box.put(m.id, m);
    }
  }

  @override
  Future<List<HiveModelMessage>> getMessages() async {
    final box = await _openBox();
    final messages = <HiveModelMessage>[];
    for (var key in box.keys) {
      final value = box.get(key);
      if (value is HiveModelMessage) messages.add(value);
    }
    //chronological order
    messages.sort((a, b) => DateTime.parse(a.createdAtIso).compareTo(DateTime.parse(b.createdAtIso)));
    return messages;
  }
}
