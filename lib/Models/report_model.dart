class ReportModel {
  final String? reportId;
  final String email;
  final String title;
  final String description;
  final DateTime createdAt;

  ReportModel({
    this.reportId,
    required this.email,
    required this.title,
    required this.description,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'reportId': reportId,
      'email': email,
      'issueName': title,
      'explanation': description,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory ReportModel.fromMap(Map<String, dynamic> map) {
    return ReportModel(
      reportId: map['reportId'], // Assuming reportId is included in the map
      email: map['email'],
      title: map['issueName'],
      description: map['explanation'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
