import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/ui/shared/loading_widget.dart';
import 'package:kasado/ui/shared/profile_widgets/user_profile_pane.dart';

class ProfileTab extends HookConsumerWidget {
  const ProfileTab({
    required this.constraints,
    Key? key,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserInfoStream = ref.watch(currentUserInfoProvider);

    useEffect(() {
      ref.read(mixpanel)!.track("Viewed ProfileTab");

      return;
    }, []);

    return currentUserInfoStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const LoadingWidget(),
      data: (currentUserInfo) {
        return UserProfilePane(
          userInfo: currentUserInfo,
          constraints: constraints,
        );
      },
    );
  }
}
