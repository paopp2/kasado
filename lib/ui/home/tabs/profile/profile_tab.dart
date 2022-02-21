import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/ui/shared/loading_widget.dart';
import 'package:kasado/ui/shared/profile_widgets/player_stat_block.dart';

class ProfileTab extends HookConsumerWidget {
  const ProfileTab({
    required this.constraints,
    Key? key,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserInfoStream = ref.watch(currentUserInfoProvider);

    return currentUserInfoStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const LoadingWidget(),
      data: (currentUserInfo) {
        final currentUser = currentUserInfo?.user;
        return (currentUser == null)
            ? const Text('No user info')
            : Column(
                children: [
                  const SizedBox(height: 10),
                  CircleAvatar(
                    backgroundImage: NetworkImage(currentUser.photoUrl!),
                    radius: 50,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    currentUser.displayName!,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(currentUser.email!),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PlayerStatBlock(
                        constraints: constraints,
                        statValue: '69',
                        statDescription: 'PPG',
                      ),
                      PlayerStatBlock(
                        constraints: constraints,
                        statValue: '23',
                        statDescription: 'APG',
                      ),
                      PlayerStatBlock(
                        constraints: constraints,
                        statValue: '420',
                        statDescription: 'RPG',
                      ),
                    ],
                  ),
                ],
              );
      },
    );
  }
}
