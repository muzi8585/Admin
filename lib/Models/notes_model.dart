import 'package:uuid/uuid.dart';

class Note {
  final String userId;
  final String noteId;
  final String title;
  final String description;
  final String createdAt;
  final String lastChange;
  bool favorite;

  Note({
    required this.userId,
    String? noteId,
    required this.title,
    required this.description,
    required this.createdAt,
    String? lastChange,
    this.favorite = false,
  })  : noteId = noteId ?? const Uuid().v4(),
        lastChange = lastChange ?? createdAt;

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'noteId': noteId,
      'title': title,
      'description': description,
      'createdAt': createdAt,
      'lastChange': lastChange,
      'favorite': favorite,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      userId: map['userId'] as String? ?? '',
      noteId: map['noteId'] as String? ?? '',
      title: map['title'] as String? ?? '',
      description: map['description'] as String? ?? '',
      createdAt: map['createdAt'] as String? ?? '',
      lastChange: map['lastChange'] as String? ?? '',
      favorite: map['favorite'] as bool? ?? false,
    );
  }
}
/*import 'dart:convert';

class Note {
  final String userId;
  final String noteId;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime lastChange;
  bool favorite;

  Note({
    required this.userId,
    required this.noteId,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.lastChange,
    this.favorite = false,
  });

  Note copyWith({
    String? userId,
    String? noteId,
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? lastChange,
    bool? favorite,
  }) {
    return Note(
      userId: userId ?? this.userId,
      noteId: noteId ?? this.noteId,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      lastChange: lastChange ?? this.lastChange,
      favorite: favorite ?? this.favorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'noteId': noteId,
      'title': title,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'lastChange': lastChange.toIso8601String(),
      'favorite': favorite,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      userId: map['userId'] as String,
      noteId: map['noteId'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
      lastChange: DateTime.parse(map['lastChange'] as String),
      favorite: map['favorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Note(userId: $userId, noteId: $noteId, title: $title, description: $description, createdAt: $createdAt, lastChange: $lastChange, favorite: $favorite)';
  }

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.noteId == noteId &&
        other.title == title &&
        other.description == description &&
        other.createdAt == createdAt &&
        other.lastChange == lastChange &&
        other.favorite == favorite;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
    noteId.hashCode ^
    title.hashCode ^
    description.hashCode ^
    createdAt.hashCode ^
    lastChange.hashCode ^
    favorite.hashCode;
  }
}
*/