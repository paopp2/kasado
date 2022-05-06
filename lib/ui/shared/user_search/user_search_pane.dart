import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

final userInfoQueryResultProvider = FutureProvider.autoDispose
    .family<List<KasadoUserInfo>, String?>((ref, query) {
  ref.maintainState = true;
  final userInfoRepo = ref.watch(userInfoRepositoryProvider);
  if (query == null) return [];

  return userInfoRepo.getUserInfoQueryResults(query);
});

class UserSearchPane extends HookConsumerWidget {
  const UserSearchPane({
    Key? key,
    this.onUserTapped,
    this.trailingFromInfo,
  }) : super(key: key);

  final Function(KasadoUserInfo)? onUserTapped;
  final Widget? Function(KasadoUserInfo)? trailingFromInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userEmailQuery = useState<String?>(null);
    final userInfoQueryResult =
        ref.watch(userInfoQueryResultProvider(userEmailQuery.value));
    final timer = useState<Timer?>(null);

    // Query DB once user stops typing after 650ms
    void _onChanged(String query) {
      if (timer.value != null) timer.value!.cancel();
      timer.value = Timer(
        const Duration(milliseconds: 650),
        // ignore: prefer-extracting-callbacks
        () {
          if (query.isNotEmpty) (userEmailQuery.value = query);
        },
      );
    }

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: DataEntryField(
                hint: 'Search players',
                onChanged: _onChanged,
              ),
            ),
          ],
        ),
        Expanded(
          child: userInfoQueryResult.when(
            loading: () => const LoadingWidget(),
            error: (e, _) => Text(e.toString()),
            data: (userInfoList) => ListView.builder(
              itemCount: userInfoList.length,
              itemBuilder: (context, i) {
                final userInfo = userInfoList[i];
                final user = userInfo.user;

                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(user.photoUrl!),
                  ),
                  title: Text(user.displayName!),
                  subtitle: Text(user.email!),
                  onTap: () => onUserTapped?.call(userInfo),
                  trailing: trailingFromInfo?.call(userInfo),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
