import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import  'status_model.dart';
import 'projects_layouts.dart';
import 'color_converters.dart';
import 'member_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Project {
  final String id;
  final String projectName;
  final Color projectColor;
  final int projectIcon;
  final ProjectsLayouts defaultLayout;
  final List<String> membersUID;
  final List<Member> members;
  final DateTime createdAt;
  final DateTime lastActivity;
  final List<Status> statuses;
  Project(
      {required this.id,
      required this.projectName,
      required this.projectColor,
      required this.projectIcon,
      required this.defaultLayout,
      required this.membersUID,
      required this.members,
      required this.createdAt,
      required this.lastActivity,
      required this.statuses});

  Project copyWith(
      {String? id,
      String? projectName,
      Color? projectColor,
      int? projectIcon,
      ProjectsLayouts? defaultLayout,
      List<String>? membersUID,
      List<Member>? members,
      DateTime? createdAt,
      DateTime? lastActivity,
      List<Status>? statuses}) {
    return Project(
        id: id ?? this.id,
        projectName: projectName ?? this.projectName,
        projectColor: projectColor ?? this.projectColor,
        projectIcon: projectIcon ?? this.projectIcon,
        defaultLayout: defaultLayout ?? this.defaultLayout,
        membersUID: membersUID ?? this.membersUID,
        members: members ?? this.members,
        createdAt: createdAt ?? this.createdAt,
        lastActivity: lastActivity ?? this.lastActivity,
        statuses: statuses ?? this.statuses);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'projectName': projectName,
      'projectColor': colorToHex(projectColor),
      'projectIcon': projectIcon,
      'defaultLayout': defaultLayout.index,
      'membersUID': membersUID,
      'members': members.map((member) => member.toMap()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'lastActivity': lastActivity.toIso8601String(),
      'statuses': statuses.map((status) => status.toMap()).toList(),
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'] as String,
      projectName: map['projectName'] as String,
      projectColor: colorFromHex(map['projectColor'] as String),
      projectIcon: map['projectIcon'] as int,
      defaultLayout: ProjectsLayouts.values[map['defaultLayout'] as int],
      membersUID: List<String>.from((map['membersUID'])),
      members: List<Member>.from(
          map['members'].map((member) => Member.fromMap(member))),
      createdAt: DateTime.parse(map['createdAt']),
      lastActivity: DateTime.parse(map['lastActivity']),
      statuses: List<Status>.from(
          map['statuses'].map((status) => Status.fromMap(status))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Project(id: $id, projectName: $projectName, projectColor: $projectColor, projectIcon: $projectIcon, defaultLayout: $defaultLayout, memberUID: $membersUID, members: $members, createdAt: $createdAt, lastActivity: $lastActivity, status: $statuses)';
  }

  @override
  bool operator ==(covariant Project other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.projectName == projectName &&
        other.projectColor == projectColor &&
        other.projectIcon == projectIcon &&
        other.defaultLayout == defaultLayout &&
        listEquals(other.membersUID, membersUID) &&
        listEquals(other.members, members) &&
        other.createdAt == createdAt &&
        other.lastActivity == lastActivity &&
        other.statuses == statuses;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        projectName.hashCode ^
        projectColor.hashCode ^
        projectIcon.hashCode ^
        defaultLayout.hashCode ^
        membersUID.hashCode ^
        members.hashCode ^
        createdAt.hashCode ^
        lastActivity.hashCode ^
        statuses.hashCode;
  }
}
