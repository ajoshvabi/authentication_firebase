import 'package:flutter/material.dart';
import 'package:jet/constants/asset_constants.dart';

class Appbarwidget extends StatelessWidget implements PreferredSizeWidget {
  const Appbarwidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: CircleAvatar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundImage: const AssetImage(AssetConstants.welcombg),
      ),
      actions: const [
        Row(
          children: [
            Icon(Icons.search),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.chat),
            SizedBox(
              width: 20,
            )
          ],
        )
      ],
    );
  }
}
