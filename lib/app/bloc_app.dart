import 'package:flutter/material.dart';
import 'package:redux_sample/resources/strings.dart';
import 'package:redux_sample/ui/pages/home/bloc_home_page.dart';

class BlocApp extends StatelessWidget {
  const BlocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.sample,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BlocHomePage(),
    );
  }
}
