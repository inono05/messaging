import 'package:hive/hive.dart';

//HM stand for Hive model
@HiveType(typeId: 0)
class HiveModelMessage extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String? text;

  @HiveField(2)
  final String createdAtIso;

  @HiveField(3)
  final bool isMe;

  @HiveField(4)
  final String? imagePath;

  HiveModelMessage({
    required this.id,
    this.text,
    required this.createdAtIso,
    required this.isMe,
    this.imagePath,
  });

  factory HiveModelMessage.fromMap(Map<String, dynamic> map) {
    return HiveModelMessage(
      id: map['id'] as String,
      text: map['text'] as String?,
      createdAtIso: map['createdAtIso'] as String,
      isMe: map['isMe'] as bool,
      imagePath: map['imagePath'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'text': text,
    'createdAtIso': createdAtIso,
    'isMe': isMe,
    'imagePath': imagePath,
  };
}
