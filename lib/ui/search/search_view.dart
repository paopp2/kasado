import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/ui/shared/user_search/user_search_pane.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: UserSearchPane(
            onUserTapped: (userInfo) => context.pushNamed(
              Routes.userProfileView,
              params: {'uid': userInfo.id},
            ),
          ),
        );
      },
    );
  }
}
