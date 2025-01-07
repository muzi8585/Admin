// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'device_model.dart';

class UserModel {
  final String name;
  final String email;
  final String userUID;
  final List<Device>? devices;
  final String profileUrl;
  UserModel({
    required this.name,
    required this.email,
    required this.userUID,
    required this.devices,
    required this.profileUrl,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? userUID,
    List<Device>? devices,
    String? profileUrl,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      userUID: userUID ?? this.userUID,
      devices: devices ?? this.devices,
      profileUrl: profileUrl ?? this.profileUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'userUID': userUID,
      'devices': devices?.map((device) => device.toMap()).toList(),
      'profileUrl': profileUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      userUID: map['userUID'] as String,
      devices: map['devices'] != null
          ? List<Device>.from(
              map['devices'].map((deviceMap) => Device.fromMap(deviceMap)))
          : null,
      profileUrl: map['profileUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserModel(name: $name,email: $email, userUID: $userUID, devices: $devices, profileUrl: $profileUrl)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.userUID == userUID &&
        other.devices == devices &&
        other.profileUrl == profileUrl;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      email.hashCode ^
      userUID.hashCode ^
      devices.hashCode ^
      profileUrl.hashCode;
}
