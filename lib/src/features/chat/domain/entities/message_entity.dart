class MessageEntity {
  final String id;
  final String? text;
  final DateTime createdAt;
  final String? imagePath;
  final bool isMe;

  MessageEntity({
    required this.id,
    this.text,
    required this.createdAt,
    required this.isMe,
    this.imagePath,
  });
}
