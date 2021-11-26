import 'package:flutter/material.dart';
import 'package:redux_sample/data/models/user.dart';
import 'package:redux_sample/ui/pages/home/widgets/user_tile.dart';

class UsersList extends StatelessWidget {
  const UsersList({required this.users, Key? key}) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => UserTile(user: users[index]));
  }
}
