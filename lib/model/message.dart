class Message {
  final String senderName;
  final String body;
  final DateTime createdAt;

  Message({
    required this.senderName,
    required this.body,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
