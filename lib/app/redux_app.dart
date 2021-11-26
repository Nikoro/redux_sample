import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sample/data/api/reqres_api_client.dart';
import 'package:redux_sample/data/repositories/users_repository.dart';
import 'package:redux_sample/redux/home/home_middleware.dart';
import 'package:redux_sample/redux/home/home_reducer.dart';
import 'package:redux_sample/redux/home/home_state.dart';
import 'package:redux_sample/resources/strings.dart';
import 'package:redux_sample/ui/pages/home/redux_home_page.dart';

class ReduxApp extends StatelessWidget {
  ReduxApp({Key? key}) : super(key: key);

  final store = Store<HomeState>(
    homeReducer,
    initialState: HomeInitial(),
    middleware: [
      HomeMiddleware(UsersRepository(ReqresApiClient())),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<HomeState>(
      store: store,
      child: MaterialApp(
        title: Strings.sample,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ReduxHomePage(),
      ),
    );
  }
}
