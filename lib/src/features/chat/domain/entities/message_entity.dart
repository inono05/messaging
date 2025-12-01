class MessageEntity {
  final String id;
  final String text;
  final DateTime createdAt;
  final bool isMe;

  MessageEntity({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.isMe,
  });
}