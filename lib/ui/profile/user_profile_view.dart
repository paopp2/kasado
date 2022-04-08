import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/profile/user_profile_state.dart';
import 'package:kasado/logic/profile/user_profile_view_model.dart';
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
    final model = ref.watch(userProfileViewModel);
    final userInfoStream = ref.watch(userInfoStreamProvider(userId));

    useEffect(() {
      if (userInfoStream.value != null) {
        ref.read(mixpanel)!.track(
          "Navigated to UserProfileView",
          properties: {
            "viewedUserName": userInfoStream.value!.user.displayName,
            "viewedUserId": userInfoStream.value!.user.id,
            "rawUserInfo": userInfoStream.value!.toJson()
          },
        );
      }
      model.initState({'viewed_user_id': userId});
      return model.dispose;
    }, [userInfoStream.value]);

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
