import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redux_sample/cubit/home/home_cubit.dart';
import 'package:redux_sample/cubit/home/home_state.dart';
import 'package:redux_sample/data/api/reqres_api_client.dart';
import 'package:redux_sample/data/repositories/users_repository.dart';
import 'package:redux_sample/resources/strings.dart';
import 'package:redux_sample/ui/pages/home/widgets/top_bar.dart';
import 'package:redux_sample/ui/pages/home/widgets/users_list.dart';
import 'package:redux_sample/ui/widgets/error_page.dart';
import 'package:redux_sample/ui/widgets/loading_indicator.dart';

class CubitHomePage extends StatelessWidget {
  const CubitHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit(UsersRepository(ReqresApiClient()));
    return BlocProvider(
      create: (context) => cubit..onUsersFetched(),
      child: Scaffold(
        appBar: Toolbar(
          title: Strings.cubitAppTitle,
          onRefreshPressed: () => cubit.onUsersFetched(),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) return const LoadingIndicator();
            if (state is HomeSuccess) return UsersList(users: state.users);
            if (state is HomeError) return ErrorPage(state.error);
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
