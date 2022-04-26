import 'package:flutter/material.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';

class SlotPlayerTileAdminControlsDialog extends StatelessWidget {
  const SlotPlayerTileAdminControlsDialog({
    Key? key,
    required this.controller,
    required this.courtSlot,
    required this.player,
  }) : super(key: key);

  final CourtAdminController controller;
  final CourtSlot courtSlot;
  final KasadoUser player;

  @override
  Widget build(BuildContext context) {
    Future<void> _onAddToQueuePressed() async {
      await controller.addPlayerToQueue(
        player: player,
        courtSlot: courtSlot,
      );
      Navigator.pop(context);
    }

    Future<void> _onRemoveFromQueuePressed() async {
      await controller.removePlayerFromQueue(
        player: player,
        courtSlot: courtSlot,
      );
      Navigator.pop(context);
    }

    Future<void> _onTogglePaymentStatusPressed() async {
      await controller.togglePlayerPaymentStatus(
        baseCourtSlot: courtSlot,
        player: player,
      );
      Navigator.pop(context);
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 250,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("ADMIN CONTROLS"),
            TextButton(
              child: const Text("Add to Queue"),
              onPressed: _onAddToQueuePressed,
            ),
            TextButton(
              child: const Text("Remove from Queue"),
              onPressed: _onRemoveFromQueuePressed,
            ),
            TextButton(
              child: const Text("Toggle payment status"),
              onPressed: _onTogglePaymentStatusPressed,
            ),
          ],
        ),
      ),
    );
  }
}
