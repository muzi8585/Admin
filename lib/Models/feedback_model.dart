class FeedbackModel {
  final String? feedbackId;
  final String level;
  final String description;
  final String uid;
  final DateTime createdAt;

  FeedbackModel({
    this.feedbackId,
    required this.level,
    required this.description,
    required this.uid,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

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

  Map<String, dynamic> toMap() {
    return {
      'feedbackId': feedbackId,
      'level': level,
      'description': description,
      'uid': uid,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory FeedbackModel.fromMap(Map<String, dynamic> map) {
    return FeedbackModel(
      feedbackId: map['feedbackId'] ?? '', 
      level: map['level'] ?? 'Unknown', 
      description: map['description'] ?? '',
      uid: map['uid'] ?? '',
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : DateTime.now(),
    );
  }
}
