import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/enums/player_position.dart';
import 'package:kasado/logic/profile/user_profile_state.dart';
import 'package:kasado/logic/profile/user_profile_view_model.dart';

class PlayerPositionChip extends HookConsumerWidget {
  const PlayerPositionChip({
    Key? key,
    required this.position,
    required this.model,
  }) : super(key: key);

  final PlayerPosition position;
  final UserProfileViewModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPlayerPositions = ref.watch(playerPositionsProvider);

    return FilterChip(
      label: Text(position.name.toUpperCase()),
      selected: selectedPlayerPositions.contains(position),
      onSelected: (val) => model.modifyPlayerPositionList(
        position: position,
        isAdd: val,
      ),
    );
  }
}
