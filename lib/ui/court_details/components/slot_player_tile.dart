import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/logic/court_details/court_details_view_model.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

class SlotPlayerTile extends HookConsumerWidget {
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
    required this.isMvp,
  }) : super(key: key);

  final CourtDetailsViewModel model;
  final KasadoUser? currentPlayer;
  final KasadoUser player;
  final Court court;
  final CourtSlot fetchedCourtSlot;
  final bool isAdmin;
  final bool isSuperAdmin;
  final CourtAdminController adminController;
  final bool isMvp;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utils = ref.watch(kasadoUtilsProvider);
    final isSlotClosed = utils.isCurrentSlotClosed(fetchedCourtSlot.timeRange);
    final isPlayerVotedByCurrentPlayer =
        (currentPlayer?.votedMvpId == player.id);
    final currentUserDidntPlay = currentPlayer == null;
    // Indivate MVP when isMvp (first in sorted player list), the slot has
    // already ended, and either the current user played and has already
    // voted for his MVP or the current user didn't play
    final indicateMvp = isMvp &&
        isSlotClosed &&
        ((currentPlayer?.hasVotedForMvp ?? false) || currentUserDidntPlay);

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) => model.removeFromCourtSlot(
        playerToRemove: player,
        courtTicketPrice: court.ticketPrice,
        baseCourtSlot: fetchedCourtSlot,
      ),
      direction: isAdmin ? DismissDirection.horizontal : DismissDirection.none,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: (isPlayerVotedByCurrentPlayer)
                ? const BorderSide(color: Colors.green)
                : BorderSide.none,
          ),
          tileColor: (player.hasPaid) ? Colors.green.shade50 : null,
          onTap: () => context.pushNamed(
            Routes.userProfileView,
            params: {'uid': player.id},
          ),
          onLongPress: (isSuperAdmin)
              ? () => adminController.togglePlayerPaymentStatus(
                    baseCourtSlot: fetchedCourtSlot,
                    player: player,
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
          leading: Badge(
            badgeContent: const Icon(Icons.star, size: 15),
            badgeColor: Colors.amber,
            showBadge: indicateMvp,
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(player.photoUrl!),
            ),
          ),
          trailing: (isSlotClosed)
              ? (currentPlayer?.hasVotedForMvp ?? false) || currentUserDidntPlay
                  ? Text(player.mvpVoteCount.toString())
                  : Visibility(
                      visible: currentPlayer?.id != player.id,
                      child: IconButton(
                        onPressed: () => model.votePlayerAsMvp(
                          baseCourtSlot: fetchedCourtSlot,
                          currentPlayer: currentPlayer!,
                          myMvp: player,
                        ),
                        icon: const FaIcon(
                          FontAwesomeIcons.crown,
                          color: Colors.amber,
                          size: 15,
                        ),
                      ),
                    )
              : null,
        ),
      ),
    );
  }
}
