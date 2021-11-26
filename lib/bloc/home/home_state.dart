import 'package:equatable/equatable.dart';
import 'package:redux_sample/data/models/user.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  const HomeSuccess(this.users);

  final List<User> users;

  @override
  List<Object> get props => [users];
}

class HomeError extends HomeState {
  const HomeError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
