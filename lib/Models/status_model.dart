
import 'package:flutter/material.dart';

import 'color_converters.dart';


class Status {
  final String id;
  final String name;
  late final Color color;

  Status({
    required this.id,
    required this.name,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': colorToHex(color),
    };
  }

  factory Status.fromMap(Map<String, dynamic> map) {
    return Status(
      id: map['id'],
      name: map['name'],
      color: colorFromHex(map['color']),
    );
  }

  Status copyWith({
    String? id,
    String? name,
    Color? color,
  }) {
    return Status(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }
}

Color colorFromString(String colorString) {
  print("the string we ar egetting from db is $colorString");
  // Extract the hexadecimal part and convert it to an integer
  final hexCode = colorString.substring(6, 16);
  print("the hexCode of the color $hexCode");
  final intColor = int.parse(hexCode, radix: 36);
  print("the int color is $intColor");
  return Color(intColor);
}
