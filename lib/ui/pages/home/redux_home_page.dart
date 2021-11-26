import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_sample/redux/home/home_action.dart';
import 'package:redux_sample/redux/home/home_state.dart';
import 'package:redux_sample/resources/strings.dart';
import 'package:redux_sample/ui/pages/home/widgets/top_bar.dart';
import 'package:redux_sample/ui/pages/home/widgets/users_list.dart';
import 'package:redux_sample/ui/widgets/error_page.dart';
import 'package:redux_sample/ui/widgets/loading_indicator.dart';

class ReduxHomePage extends StatelessWidget {
  const ReduxHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<HomeState, _HomeViewModel>(
      onInit: (store) => store.dispatch(HomeUsersFetchAction()),
      converter: (store) => _HomeViewModel(
        state: store.state,
        onRefreshPressed: () {
          store.dispatch(HomeUsersFetchAction());
        },
      ),
      builder: (context, viewModel) {
        final state = viewModel.state;
        return Scaffold(
          appBar: Toolbar(
              title: Strings.reduxAppTitle,
              onRefreshPressed: viewModel.onRefreshPressed),
          body: Builder(
            builder: (context) {
              if (state is HomeLoading) return const LoadingIndicator();
              if (state is HomeSuccess) return UsersList(users: state.users);
              if (state is HomeError) return ErrorPage(state.error);
              return const SizedBox.shrink();
            },
          ),
        );
      },
    );
  }
}

class _HomeViewModel {
  const _HomeViewModel({required this.state, required this.onRefreshPressed});

  final HomeState state;
  final VoidCallback onRefreshPressed;
}
