import 'package:flutter/material.dart';
import 'package:redux_sample/data/models/user.dart';
import 'package:redux_sample/ui/pages/home/widgets/user_avatar.dart';

class UserTile extends StatelessWidget {
  const UserTile({required this.user, Key? key}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.firstName),
      subtitle: Text(user.email),
      leading: UserAvatar(
        imageUrl: user.avatarUrl,
      ),
    );
  }
}
