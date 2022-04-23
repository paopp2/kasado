import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/logic/court_slot_details/court_slot_details_view_model.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/ui/court_slot_details/tabs/slot_players_tab/components/slot_player_tile.dart';
import 'package:kasado/ui/shared/join_leave_slot_button.dart';

class SlotPlayersTab extends HookConsumerWidget {
  const SlotPlayersTab({
    Key? key,
    required this.utils,
    required this.courtSlot,
    required this.model,
    required this.court,
    required this.isAdmin,
    required this.isDone,
  }) : super(key: key);

  final KasadoUtils utils;
  final CourtSlot courtSlot;
  final CourtSlotDetailsViewModel model;
  final Court court;
  final bool isAdmin;
  final bool isDone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider)!;
    final currentUserInfo = ref.watch(currentUserInfoProvider).value;
    final isSuperAdmin = currentUserInfo?.isSuperAdmin ?? false;
    final adminController = ref.watch(courtAdminController);
    final players = courtSlot.players;
    final currentPlayer = courtSlot.hasPlayer(currentUser)
        ? players.singleWhere((u) => (u.id == currentUser.id))
        : null;

    useEffect(() {
      ref.read(mixpanel)!.track("Viewed SlotPlayersTab", properties: {
        "courtName": court.name,
        "courtSlotTimeRange": utils.getTimeRangeFormat(
          courtSlot.timeRange,
          showDate: true,
        ),
      });

      return;
    }, []);

    return Column(
      children: [
        Expanded(
          child: (players.isEmpty)
              ? const Center(child: Text('No players'))
              : Material(
                  child: ListView.builder(
                    itemCount: players.length,
                    itemBuilder: (context, index) {
                      final player = players[index];

                      return SlotPlayerTile(
                        model: model,
                        player: player,
                        currentPlayer: currentPlayer,
                        court: court,
                        fetchedCourtSlot: courtSlot,
                        isAdmin: isAdmin,
                        isSuperAdmin: isSuperAdmin,
                        adminController: adminController,
                      );
                    },
                  ),
                ),
        ),
        if (!isDone || isSuperAdmin) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (isAdmin) ...[
                TextButton(
                  child: Text(
                    (courtSlot.isClosedByAdmin) ? 'OPEN SLOT' : 'CLOSE SLOT',
                  ),
                  onPressed: () => adminController.setCourtSlotClosed(
                    context: context,
                    courtSlot: courtSlot,
                    closeCourt: !courtSlot.isClosedByAdmin,
                  ),
                ),
              ],
              JoinLeaveSlotButton(
                court: court,
                courtSlot: courtSlot,
                model: model,
                currentUser: currentUser,
                currentUserInfo: currentUserInfo!,
                showButton: !courtSlot.isClosedByAdmin,
              ),
            ],
          ),
        ],
      ],
    );
  }
}
