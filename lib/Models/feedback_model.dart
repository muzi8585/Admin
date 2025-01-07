class FeedbackModel {
  final String? feedbackId; // Nullable feedbackId
  final String level;
  final String description;
  final String uid;
  final DateTime createdAt;

  FeedbackModel({
    this.feedbackId, // Allow feedbackId to be optional
    required this.level,
    required this.description,
    required this.uid,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'feedbackId': feedbackId, // Include feedbackId in the map
      'level': level,
      'description': description,
      'uid': uid,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory FeedbackModel.fromMap(Map<String, dynamic> map) {
    return FeedbackModel(
      feedbackId: map['feedbackId'], // Assuming feedbackId is included in the map
      level: map['level'],
      description: map['description'],
      uid: map['uid'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  FeedbackModel copyWith({
    String? feedbackId,
    String? level,
    String? description,
    String? uid,
    DateTime? createdAt,
  }) {
    return FeedbackModel(
      feedbackId: feedbackId ?? this.feedbackId,
      level: level ?? this.level,
      description: description ?? this.description,
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
