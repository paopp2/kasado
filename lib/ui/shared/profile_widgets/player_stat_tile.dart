import 'package:flutter/material.dart';
import 'package:kasado/ui/shared/stagger_list_tile_animation.dart';

class PlayerStatTile extends StatelessWidget {
  const PlayerStatTile({
    Key? key,
    required this.statValue,
    required this.statDescription,
    required this.index,
  }) : super(key: key);

  final String statValue;
  final String statDescription;
  final int index;

  @override
  Widget build(BuildContext context) {
    return StaggerListTileAnimation(
      index: index,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          tileColor: Colors.grey.shade100,
          title: Text(
            statDescription,
            style: TextStyle(color: Colors.grey.shade800),
          ),
          trailing: Text(
            statValue,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
