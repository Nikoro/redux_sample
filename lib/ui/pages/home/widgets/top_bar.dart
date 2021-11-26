import 'package:flutter/material.dart';
import 'package:redux_sample/ui/pages/home/widgets/refresh_button.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  const Toolbar({
    required this.title,
    required this.onRefreshPressed,
    Key? key,
  }) : super(key: key);

  final String title;
  final VoidCallback onRefreshPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        RefreshButton(
          onPressed: onRefreshPressed,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
