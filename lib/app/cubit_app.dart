import 'package:flutter/material.dart';
import 'package:redux_sample/resources/strings.dart';
import 'package:redux_sample/ui/pages/home/cubit_home_page.dart';

class CubitApp extends StatelessWidget {
  const CubitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.sample,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CubitHomePage(),
    );
  }
}
