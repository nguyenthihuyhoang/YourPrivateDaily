import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:private_app/configs/locator.dart';
import 'package:private_app/pages/home/home_page.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const HomePage(),
      localizationsDelegates: [FlutterQuillLocalizations.delegate],
    );
  }
}
