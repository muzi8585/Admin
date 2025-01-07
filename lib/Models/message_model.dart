import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String id;
  final String content;
  final List<String> mentions;
  final String projectId;
  final String createdAt;

  // Constructor
  Message({
    required this.id,
    required this.content,
    required this.mentions,
    required this.projectId,
    required this.createdAt,
  });

  // Convert a Message object to a map (for Firestore)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'mentions': mentions,
      'projectId': projectId,
      'createdAt': createdAt,
    };
  }

  factory Message.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Message(
      id: data['id'] ?? '',
      content: data['content'] ?? '',
      mentions: List<String>.from(data['mentions'] ?? []),
      projectId: data['projectId'] ?? '',
      createdAt: data['createdAt'] ?? '',
    );
  }
}
