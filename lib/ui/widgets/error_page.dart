import 'package:flutter/material.dart';
import 'package:redux_sample/resources/strings.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage(this.message, {Key? key}) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          Strings.somethingWentWrong,
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          message,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
