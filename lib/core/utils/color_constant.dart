import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color bluegray_300_87 = fromHex('#879696ba');
  static Color blue = fromHex('#2574FB');
  static Color gray_900 = fromHex('#121a24');
  static Color bluegray_100 = fromHex('#d6d6e6');
  static Color indigo_50 = fromHex('#EEF0F9');
  static Color gray_100 = fromHex('#f5f5fa');
  static Color bluegray_800 = fromHex('#383b4d');
  static Color black_900 = fromHex('#000000');
  static Color bluegray_300 = fromHex('#9696ba');
  static Color bluegray_400 = fromHex('#9696bb');
  static Color white_A700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
