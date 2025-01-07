// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../Models/file_model.dart';
class TaskModel {
  final String id;
  final String projectId;
  final String taskName;
  final String description;
  final String? voiceNoteLink;
  final List<FileModel>? filesData;
  final String assignedBy;
  final String? assignedTo;
  final int priority;
  final String statusId;
  final DateTime createdAt;
  final DateTime? startDate;
  final DateTime? endDate;
  final TimeOfDay? time;
  final bool isCompleted;
  final List<String> favorites;

  TaskModel({
    required this.id,
    required this.projectId,
    required this.taskName,
    required this.description,
    required this.voiceNoteLink,
    required this.filesData,
    required this.assignedBy,
    required this.assignedTo,
    required this.priority,
    required this.statusId,
    required this.createdAt,
    required this.startDate,
    required this.endDate,
    required this.time,
    required this.isCompleted,
    required this.favorites,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'projectId': projectId,
      'taskName': taskName,
      'description': description,
      'voiceNoteLink': voiceNoteLink,
      'filesData': filesData != null
          ? filesData!.map((fileData) => fileData.toMap()).toList()
          : [],
      'assignedBy': assignedBy,
      'assignedTo': assignedTo,
      'priority': priority,
      'statusId': statusId,
      'createdAt': createdAt.toIso8601String(),
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'time':
          time != null ? {'hour': time!.hour, 'minute': time!.minute} : null,
      'isCompleted': isCompleted,
      'favorites': favorites,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as String,
      projectId: map['projectId'] as String,
      taskName: map['taskName'] as String,
      description: map['description'] as String,
      voiceNoteLink:
          map['voiceNoteLink'] != null ? map['voiceNoteLink'] as String : null,
      filesData: map['filesData'] != null
          ? List<FileModel>.from(
              map['filesData'].map((file) => FileModel.fromMap(file)))
          : [],
      assignedBy: map['assignedBy'] as String,
      assignedTo:
          map['assignedTo'] != null ? map['assignedTo'] as String : null,
      priority: map['priority'] as int,
      statusId: map['statusId'] as String,
      createdAt: DateTime.parse(map['createdAt']),
      startDate:
          map['startDate'] != null ? DateTime.parse(map['startDate']) : null,
      endDate: map['endDate'] != null ? DateTime.parse(map['endDate']) : null,
      time: map['time'] != null
          ? TimeOfDay(hour: map['time']['hour'], minute: map['time']['minute'])
          : null,
      isCompleted: map['isCompleted'] as bool,
      favorites:
          map['favorites'] != null ? List<String>.from((map['favorites'])) : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  TaskModel copyWith({
    String? id,
    String? projectId,
    String? taskName,
    String? description,
    String? voiceNoteLink,
    List<FileModel>? filesData,
    String? assignedBy,
    String? assignedTo,
    int? priority,
    String? statusId,
    DateTime? createdAt,
    DateTime? startDate,
    DateTime? endDate,
    TimeOfDay? time,
    bool? isCompleted,
    List<String>? favorites,
  }) {
    return TaskModel(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      taskName: taskName ?? this.taskName,
      description: description ?? this.description,
      voiceNoteLink: voiceNoteLink ?? this.voiceNoteLink,
      filesData: filesData ?? this.filesData,
      assignedBy: assignedBy ?? this.assignedBy,
      assignedTo: assignedTo ?? this.assignedTo,
      priority: priority ?? this.priority,
      statusId: statusId ?? this.statusId,
      createdAt: createdAt ?? this.createdAt,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate, 
      time: time ?? this.time,
      isCompleted: isCompleted ?? this.isCompleted,
      favorites: favorites ?? this.favorites,
    );
  }

  @override
  String toString() {
    return 'TaskModel(id: $id, projectId: $projectId, taskName: $taskName, description: $description, voiceNoteLink: $voiceNoteLink, filesData: $filesData, assignedBy: $assignedBy, assignedTo: $assignedTo, priority: $priority, statusId: $statusId, createdAt: $createdAt, startDate: $startDate, endDate: $endDate, time: $time, isCompleted: $isCompleted, favorites: $favorites)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.projectId == projectId &&
        other.taskName == taskName &&
        other.description == description &&
        other.voiceNoteLink == voiceNoteLink &&
        other.filesData == filesData &&
        other.assignedBy == assignedBy &&
        other.assignedTo == assignedTo &&
        other.priority == priority &&
        other.statusId == statusId &&
        other.createdAt == createdAt &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.time == time &&
        other.isCompleted == isCompleted &&
        other.favorites == favorites;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        projectId.hashCode ^
        taskName.hashCode ^
        description.hashCode ^
        voiceNoteLink.hashCode ^
        filesData.hashCode ^
        assignedBy.hashCode ^
        assignedTo.hashCode ^
        priority.hashCode ^
        statusId.hashCode ^
        createdAt.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        time.hashCode ^
        isCompleted.hashCode ^
        favorites.hashCode;
  }
}
