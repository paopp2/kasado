import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/logic/court_slot_details/court_slot_details_view_model.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/ui/admin/court_manager/components/slot_player_tile_admin_controls_dialog.dart';

class SlotPlayerTile extends StatelessWidget {
  const SlotPlayerTile({
    Key? key,
    required this.model,
    required this.player,
    required this.currentPlayer,
    required this.court,
    required this.fetchedCourtSlot,
    required this.isAdmin,
    required this.isSuperAdmin,
    required this.adminController,
    required this.isSlotDone,
  }) : super(key: key);

  final CourtSlotDetailsViewModel model;
  final KasadoUser? currentPlayer;
  final KasadoUser player;
  final Court court;
  final CourtSlot fetchedCourtSlot;
  final bool isAdmin;
  final bool isSuperAdmin;
  final CourtAdminController adminController;
  final bool isSlotDone;

  @override
  Widget build(BuildContext context) {
    final isQueuedAtCourt = fetchedCourtSlot.playerIdQueue.contains(player.id);

    Future<void> _onSlotPlayerTileDismissed(
      DismissDirection dismissDirection,
    ) async {
      // Assert that the removed player's ID is not in the game queue.
      // If player is removed from the courtSlot but still in the queue, this
      // will result to a null exception as the referenced playerId (from queue)
      // doesn't exist anymore (removed from courtSlot.players)
      await adminController.removePlayerFromQueue(
        player: player,
        courtSlot: fetchedCourtSlot,
      );

      await model.removeFromCourtSlot(
        playerToRemove: player,
        baseCourtSlot: fetchedCourtSlot,
      );
    }

    return Dismissible(
      key: UniqueKey(),
      onDismissed: _onSlotPlayerTileDismissed,
      direction: isAdmin ? DismissDirection.startToEnd : DismissDirection.none,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: FutureBuilder<Color?>(
          initialData: null,
          future: Future.delayed(const Duration(milliseconds: 500)).then(
            (_) => (player.hasPaid) ? Colors.green.shade50 : null,
          ),
          builder: (context, snapshot) {
            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              tileColor: snapshot.data,
              onTap: () => context.pushNamed(
                Routes.userProfileView,
                pathParameters: {'uid': player.id},
              ),
              onLongPress: (isSuperAdmin)
                  ? () => showDialog(
                        context: context,
                        builder: (_) {
                          return SlotPlayerTileAdminControlsDialog(
                            controller: adminController,
                            courtSlot: fetchedCourtSlot,
                            player: player,
                          );
                        },
                      )
                  : null,
              title: AutoSizeText(
                player.displayName!,
                maxLines: 1,
              ),
              subtitle: (player.teamName.isNotEmpty)
                  ? Text(
                      player.teamName,
                      style: const TextStyle(fontSize: 10),
                    )
                  : null,
              leading: badges.Badge(
                showBadge: isQueuedAtCourt && !isSlotDone,
                position: BadgePosition.bottomEnd(bottom: -2, end: -2),
                badgeStyle: const BadgeStyle(
                  badgeColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.all(2.0),
                ),
                badgeAnimation: const BadgeAnimation.fade(
                  animationDuration: Duration(milliseconds: 100),
                ),
                badgeContent: const CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 6,
                ),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(player.photoUrl!),
                ),
              ),
              trailing: Text(player.userBio?.positionAsString() ?? ''),
            );
          },
        ),
      ),
    );
  }
}
