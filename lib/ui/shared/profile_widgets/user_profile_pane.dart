import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/ui/home/components/pondo_info_dialog.dart';
import 'package:kasado/ui/shared/profile_widgets/player_stat_block.dart';

class UserProfilePane extends HookConsumerWidget {
  const UserProfilePane({
    Key? key,
    required this.userInfo,
    required this.constraints,
  }) : super(key: key);

  final KasadoUserInfo? userInfo;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider)!;
    final user = userInfo?.user;
    final isCurrentUser = currentUser.id == user?.id;
    final isSuperAdmin =
        ref.watch(currentUserInfoProvider).value?.isSuperAdmin ?? false;

    return (user == null)
        ? const Text('No user info')
        : Column(
            children: [
              const SizedBox(height: 10),
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoUrl!),
                radius: 50,
              ),
              const SizedBox(height: 10),
              Text(
                user.displayName!,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(user.email!),
              const SizedBox(height: 30),
              Visibility(
                visible: isCurrentUser || isSuperAdmin,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'PONDO: ${userInfo?.pondo} Php',
                      style: const TextStyle(fontSize: 15),
                    ),
                    TextButton(
                      child: const Text(
                        'ADD',
                        style: TextStyle(color: Colors.green),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => PondoInfoDialog(
                            constraints: constraints,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              PlayerStatBlock(
                constraints: constraints,
                statValue: '0',
                statDescription: 'MVP Votes',
              )
            ],
          );
  }
}
