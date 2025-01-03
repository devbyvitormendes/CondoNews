import 'package:condo_news/presenter/ui/condo_news_icon.dart';
import 'package:condo_news/presenter/ui/constants/constants.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool showBack;
  final bool showActions;

  const AppBarWidget({
    super.key,
    required this.showBack,
    required this.showActions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: ColorsConstants.lightGrey,
          automaticallyImplyLeading: showBack,
          title: Image.asset(
            ImageConstants.textLogo,
            width: MediaQuery.of(context).size.width * 0.53,
          ),
          iconTheme: const IconThemeData(
            color: ColorsConstants.iconsColor,
          ),
          actions: [
            Visibility(
              visible: showActions,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CondoNewsIcon.notification,
                  color: ColorsConstants.iconsColor,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
