import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redux_sample/cubit/home/home_state.dart';
import 'package:redux_sample/data/repositories/users_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._usersRepository) : super(HomeInitial());

  final UsersRepository _usersRepository;

  Future<void> onUsersFetched() async {
    emit(HomeLoading());
    try {
      final users = await _usersRepository.users;
      emit(HomeSuccess(users));
    } catch (e) {
      emit(HomeError('$e'));
    }
  }
}
