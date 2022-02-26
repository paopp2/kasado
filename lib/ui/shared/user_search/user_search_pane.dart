import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/user_info_repository.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

final userInfoQueryResultProvider =
    StreamProvider.autoDispose.family<List<KasadoUserInfo>, String?>(
  (ref, emailQuery) {
    ref.maintainState = true;
    final userInfoRepo = ref.watch(userInfoRepositoryProvider);
    if (emailQuery == null) return Stream.value([]);
    return userInfoRepo.getUserInfosStream(emailQuery);
  },
);

class UserSearchPane extends HookConsumerWidget {
  const UserSearchPane({
    Key? key,
    this.onUserTapped,
  }) : super(key: key);

  final Function(KasadoUserInfo)? onUserTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userEmailQuery = useState<String?>(null);
    final tempQuery = useState('');
    final userInfoQueryResult =
        ref.watch(userInfoQueryResultProvider(userEmailQuery.value));

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: DataEntryField(
                hint: 'Search player email',
                onChanged: (query) => (tempQuery.value = query),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => userEmailQuery.value = tempQuery.value,
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
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
