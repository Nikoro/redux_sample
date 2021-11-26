import 'package:redux_sample/data/models/user.dart';

class HomeUsersFetchAction {}

class HomeLoadingAction {}

class HomeErrorAction {
  HomeErrorAction(this.error);

  final String error;
}

class HomeSuccessAction {
  HomeSuccessAction(this.users);

  final List<User> users;
}
