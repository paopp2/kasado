import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/ui/shared/user_search/user_search_pane.dart';

class SearchView extends HookConsumerWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(mixpanel)!.track("Navigated to SearchView");

      return;
    }, []);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(),
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
