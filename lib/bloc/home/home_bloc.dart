import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redux_sample/bloc/home/home_event.dart';
import 'package:redux_sample/bloc/home/home_state.dart';
import 'package:redux_sample/data/repositories/users_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._usersRepository) : super(HomeInitial()) {
    on<UsersFetched>((event, emit) => _fetchUsers(emit));
  }

  final UsersRepository _usersRepository;

  void _fetchUsers(Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final users = await _usersRepository.users;
      emit(HomeSuccess(users));
    } catch (e) {
      emit(HomeError('$e'));
    }
  }
}
