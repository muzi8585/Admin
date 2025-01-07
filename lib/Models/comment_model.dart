// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CommentModel {
  final String commentId;
  final String taskId;
  final String posterId;
  final String content;
  final String? voiceNoteUrl;
  final List<String>? mediaUrls;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> likes; // List of userIds who liked the comment
  final List<String> replies;
  final List<String> mentionedUserIds;

  CommentModel({
    required this.commentId,
    required this.taskId,
    required this.posterId,
    required this.content,
    required this.voiceNoteUrl,
    required this.mediaUrls,
    required this.createdAt,
    required this.updatedAt,
    required this.likes,
    required this.replies,
    required this.mentionedUserIds,
  });

  CommentModel copyWith({
    String? commentId,
    String? taskId,
    String? posterId,
    String? content,
    String? voiceNoteUrl,
    List<String>? mediaUrls,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? likes,
    List<String>? replies,
    List<String>? mentionedUserIds,
  }) {
    return CommentModel(
      commentId: commentId ?? this.commentId,
      taskId: taskId ?? this.taskId,
      posterId: posterId ?? this.posterId,
      content: content ?? this.content,
      voiceNoteUrl: voiceNoteUrl ?? this.voiceNoteUrl,
      mediaUrls: mediaUrls ?? this.mediaUrls,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      likes: likes ?? this.likes,
      replies: replies ?? this.replies,
      mentionedUserIds: mentionedUserIds ?? this.mentionedUserIds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'commentId': commentId,
      'taskId': taskId,
      'posterId': posterId,
      'content': content,
      'voiceNoteUrl': voiceNoteUrl,
      'mediaUrls': mediaUrls,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'likes': likes,
      'replies': replies,
      'mentionedUserIds': mentionedUserIds,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      commentId: map['commentId'] as String,
      taskId: map['taskId'] as String,
      posterId: map['posterId'] as String,
      content: map['content'] as String,
      voiceNoteUrl: map['voiceNoteUrl'] as String?,
      mediaUrls:
          map['mediaUrls'] != null ? List<String>.from((map['mediaUrls'])) : [],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      likes: List<String>.from((map['likes'])),
      replies: List<String>.from((map['replies'])),
      mentionedUserIds: map['mentionedUserIds'] != null
          ? List<String>.from((map['mentionedUserIds']))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentModel(commentId: $commentId, taskId: $taskId, posterId: $posterId, content: $content, voiceNoteUrl: $voiceNoteUrl, mediaUrls: $mediaUrls, createdAt: $createdAt, updatedAt: $updatedAt, likes: $likes, replies: $replies, mentionedUserIds: $mentionedUserIds)';
  }

  @override
  bool operator ==(covariant CommentModel other) {
    if (identical(this, other)) return true;

    return other.commentId == commentId &&
        other.taskId == taskId &&
        other.posterId == posterId &&
        other.content == content &&
        other.voiceNoteUrl == voiceNoteUrl &&
        other.mediaUrls == mediaUrls &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.likes == likes &&
        other.replies == replies;
  }

  @override
  int get hashCode {
    return commentId.hashCode ^
        taskId.hashCode ^
        posterId.hashCode ^
        content.hashCode ^
        voiceNoteUrl.hashCode ^
        mediaUrls.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        likes.hashCode ^
        replies.hashCode;
  }
}
