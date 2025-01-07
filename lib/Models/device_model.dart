class Device {
  final String deviceName;
  final String deviceToken;
  final bool notificationEnabled;

  Device(
      {required this.deviceName,
      required this.deviceToken,
      required this.notificationEnabled});

  Map<String, dynamic> toMap() {
    return {
      'deviceName': deviceName,
      'deviceToken': deviceToken,
      'notificationEnabled': notificationEnabled,
    };
  }

  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
      deviceName: map['deviceName'],
      deviceToken: map['deviceToken'],
      notificationEnabled: map['notificationEnabled'],
    );
  }
}
