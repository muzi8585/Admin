import 'dart:convert';

class ReportModel {
  final String reportId;
  final String email;
  final String title;
  final String description;
  final DateTime createdAt;

  ReportModel({
    required this.reportId,
    required this.email,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  ReportModel copyWith({
    String? reportId,
    String? email,
    String? title,
    String? description,
    DateTime? createdAt,
  }) {
    return ReportModel(
      reportId: reportId ?? this.reportId,
      email: email ?? this.email,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reportId': reportId,
      'email': email,
      'title': title,
      'description': description,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory ReportModel.fromMap(Map<String, dynamic> map) {
    return ReportModel(
      reportId: map['reportId'] ?? '',
      email: map['email'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      createdAt: map['createdAt'] is int
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : DateTime.fromMillisecondsSinceEpoch(
              int.tryParse(map['createdAt'] ?? '0') ?? 0,
            ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportModel.fromJson(String source) =>
      ReportModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReportModel(reportId: $reportId, email: $email, title: $title, description: $description, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant ReportModel other) {
    if (identical(this, other)) return true;

    return other.reportId == reportId &&
        other.email == email &&
        other.title == title &&
        other.description == description &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return reportId.hashCode ^
        email.hashCode ^
        title.hashCode ^
        description.hashCode ^
        createdAt.hashCode;
  }
}
