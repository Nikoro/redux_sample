import 'package:redux/redux.dart';
import 'package:redux_sample/redux/home/home_action.dart';
import 'package:redux_sample/redux/home/home_state.dart';

final homeReducer = combineReducers<HomeState>([
  TypedReducer<HomeState, HomeLoadingAction>(_onLoad),
  TypedReducer<HomeState, HomeErrorAction>(_onError),
  TypedReducer<HomeState, HomeSuccessAction>(_onResult),
]);

HomeState _onLoad(HomeState state, HomeLoadingAction action) => HomeLoading();

HomeState _onError(HomeState state, HomeErrorAction action) =>
    HomeError(action.error);

HomeState _onResult(HomeState state, HomeSuccessAction action) =>
    HomeSuccess(action.users);
