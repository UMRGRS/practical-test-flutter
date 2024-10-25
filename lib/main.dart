import 'package:practical_testflutter/config/config.dart';
import 'package:json_theme_plus/json_theme_plus.dart';

import 'package:flutter/services.dart';
import 'dart:convert';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson);

  runApp(App(theme:theme));
}