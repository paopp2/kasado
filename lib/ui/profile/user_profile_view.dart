import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';

class UserProfileView extends HookConsumerWidget {
  const UserProfileView({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoRepo = ref.watch(userInfoRepositoryProvider);
    final userInfoStream = userInfoRepo.getUserInfoStream(userId);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: StreamBuilder(
            stream: userInfoStream,
            builder: (context, snapshot) {
              final data = snapshot.data as KasadoUserInfo;
              return Center(
                child: Text(data.user.displayName!),
              );
            },
          ),
        );
      },
    );
  }
}
