import 'package:flutter/material.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/ui/shared/profile_widgets/player_stat_block.dart';

class UserProfilePane extends StatelessWidget {
  const UserProfilePane({
    Key? key,
    required this.user,
    required this.constraints,
  }) : super(key: key);

  final KasadoUser? user;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return (user == null)
        ? const Text('No user info')
        : Column(
            children: [
              const SizedBox(height: 10),
              CircleAvatar(
                backgroundImage: NetworkImage(user!.photoUrl!),
                radius: 50,
              ),
              const SizedBox(height: 10),
              Text(
                user!.displayName!,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(user!.email!),
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
  }
}
