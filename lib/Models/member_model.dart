import 'package:tampo_admin_app/Models/user_role.dart';

class Member {
  final String uid;
  final DateTime joinedOn;
  final String status;
  final UserRole role;
  final bool pinned;
  final bool favorite;

  Member({
    required this.uid,
    required this.joinedOn,
    required this.status,
    required this.role,
    this.pinned = false,
    this.favorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'joinedOn': joinedOn.toIso8601String(),
      'status': status,
      'role': role.name,
      'pinned': pinned,
      'favorite': favorite,
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      uid: map['uid'] as String,
      joinedOn: DateTime.parse(map['joinedOn']),
      status: map['status'] as String,
      role: map['role'] != null
          ? UserRole.values.firstWhere((role) => role.name == map['role'])
          : UserRole.owner,
      pinned: map['pinned'] as bool,
      favorite: map['favorite'] as bool,
    );
  }

  Member copyWith({
    bool? pinned,
    bool? favorite,
  }) {
    return Member(
      uid: uid,
      joinedOn: joinedOn,
      status: status,
      role: role,
      pinned: pinned ?? this.pinned,
      favorite: favorite ?? this.favorite,
    );
  }
}
