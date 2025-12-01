import 'package:hive/hive.dart';

import '../models/hive_model_message.dart';

class HiveAdapterMessage extends TypeAdapter<HiveModelMessage> {
  @override
  final int typeId = 0;

  @override
  HiveModelMessage read(BinaryReader reader) {
    final id = reader.readString();
    final text = reader.readString();
    final createdAtIso = reader.readString();
    final isMe = reader.readBool();
    return HiveModelMessage(id: id, text: text, createdAtIso: createdAtIso, isMe: isMe);
  }

  @override
  void write(BinaryWriter writer, HiveModelMessage obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.text);
    writer.writeString(obj.createdAtIso);
    writer.writeBool(obj.isMe);
  }
}
