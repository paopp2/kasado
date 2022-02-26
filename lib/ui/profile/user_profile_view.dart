import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/profile/user_profile_state.dart';
import 'package:kasado/ui/shared/loading_widget.dart';
import 'package:kasado/ui/shared/profile_widgets/user_profile_pane.dart';

class UserProfileView extends HookConsumerWidget {
  const UserProfileView({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoStream = ref.watch(userInfoStreamProvider(userId));

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: userInfoStream.when(
              error: (e, _) => Text(e.toString()),
              loading: () => const LoadingWidget(),
              data: (userInfo) => UserProfilePane(
                userInfo: userInfo,
                constraints: constraints,
              ),
            ),
          );
        },
      ),
    );
  }
}
