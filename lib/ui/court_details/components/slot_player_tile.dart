import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kasado/app_router.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/logic/court_details/court_details_view_model.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

class SlotPlayerTile extends StatelessWidget {
  const SlotPlayerTile({
    Key? key,
    required this.model,
    required this.player,
    required this.court,
    required this.fetchedCourtSlot,
    required this.isAdmin,
    required this.isSuperAdmin,
    required this.adminController,
  }) : super(key: key);

  final CourtDetailsViewModel model;
  final KasadoUser player;
  final Court court;
  final CourtSlot fetchedCourtSlot;
  final bool isAdmin;
  final bool isSuperAdmin;
  final CourtAdminController adminController;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) => model.kickFromCourtSlot(
        userToKickId: player.id,
        courtTicketPrice: court.ticketPrice,
        baseCourtSlot: fetchedCourtSlot,
      ),
      direction: isAdmin ? DismissDirection.horizontal : DismissDirection.none,
      child: ListTile(
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
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(player.photoUrl!),
        ),
        trailing: Visibility(
          visible: player.hasPaid,
          child: const Icon(
            Icons.check,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
