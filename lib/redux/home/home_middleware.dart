import 'package:redux/redux.dart';
import 'package:redux_sample/data/repositories/users_repository.dart';
import 'package:redux_sample/redux/home/home_action.dart';
import 'package:redux_sample/redux/home/home_state.dart';

class HomeMiddleware implements MiddlewareClass<HomeState> {
  HomeMiddleware(this._usersRepository);

  final UsersRepository _usersRepository;

  @override
  Future<void> call(
      Store<HomeState> store, dynamic action, NextDispatcher next) async {
    if (action is HomeUsersFetchAction) {
      store.dispatch(HomeLoadingAction());
      try {
        final users = await _usersRepository.users;
        store.dispatch(HomeSuccessAction(users));
      } catch (e) {
        store.dispatch(HomeErrorAction('$e'));
      }
    }
    next(action);
  }
}
