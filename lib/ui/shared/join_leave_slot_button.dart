import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/court_slot_details/court_slot_details_view_model.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/ui/home/components/pondo_info_dialog.dart';
import 'package:kasado/ui/shared/loading_widget.dart';

class JoinLeaveSlotButton extends HookConsumerWidget {
  const JoinLeaveSlotButton({
    Key? key,
    required this.court,
    required this.courtSlot,
    required this.model,
    required this.currentUser,
    required this.currentUserInfo,
    this.showButton = true,
    this.allowLeave = true,
  }) : super(key: key);

  final CourtSlot courtSlot;
  final Court court;
  final CourtSlotDetailsViewModel model;
  final KasadoUser currentUser;
  final KasadoUserInfo currentUserInfo;
  final bool showButton;
  final bool allowLeave;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSuperAdmin = currentUserInfo.isSuperAdmin;
    final isModifyingSlot = useState(false);

    Future<bool> _showPondoImplementationAnnouncementDialog({
      bool forTeamCaptain = false,
    }) async {
      ref.read(mixpanel)!.track(
        "Viewed PondoImplementationAnnouncementDialog",
        properties: {'isTeamCaptain': forTeamCaptain},
      );

      return await AwesomeDialog(
        context: context,
        dialogType: DialogType.NO_HEADER,
        title: (forTeamCaptain)
            ? "Some players at your team doesn't have enough PONDO"
            : "Not enough PONDO",
        desc: "Sugod karong Sunday April 24 dol, implement "
            "na tas atoang Pondo system para pud mahapsay atoang "
            "systema. Bale mura rakag magpaload sa imong Pondo, "
            "pwede through GCash or bayad personal, nya kana "
            "nga Pondo, magamit na para maka-join og mga court slot. "
            "Ig-abots atong sched, aw wa nay hasol, duwa nalay ato. "
            "Sa karon pwede pa man sad nuon bisag way Pondo pero mas "
            "may jung atong hinay-hinayan hehe. Gege mao rato dol lamats!",
        autoDismiss: false,
        onDissmissCallback: (dismissType) {
          Navigator.pop(
            context,
            dismissType == DismissType.BTN_CANCEL,
          );
        },
        padding: const EdgeInsets.all(15.0),
        dialogBorderRadius: BorderRadius.circular(20),
        headerAnimationLoop: false,
        btnCancelOnPress: () {
          ref.read(mixpanel)!.track("Pressed 'Join w/o PONDO'");
        },
        btnCancelText: "Join w/o PONDO",
        btnCancelColor: Colors.grey.shade400,
        btnOkText: "ADD PONDO",
        btnOkOnPress: () => showDialog(
          context: context,
          builder: (_) {
            ref.read(mixpanel)!.track("Pressed 'ADD PONDO'");
            return const PondoInfoDialog();
          },
        ),
        buttonsBorderRadius: BorderRadius.circular(10),
      ).show();
    }

    return (isModifyingSlot.value)
        ? const LoadingWidget()
        : Visibility(
            visible: showButton,
            // TODO: Might have to be refactored to be cleaner
            child: (courtSlot.hasPlayer(currentUser) && !allowLeave)
                ? TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check, color: Colors.green.shade300),
                        Text(
                          'JOINED',
                          style: TextStyle(color: Colors.green.shade300),
                        ),
                      ],
                    ),
                    onPressed: null,
                  )
                : TextButton(
                    child: (courtSlot.hasPlayer(currentUser))
                        ? Text(
                            'LEAVE GAME',
                            style: TextStyle(color: Colors.red.shade200),
                          )
                        : const Text(
                            'JOIN GAME',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    onPressed: () async {
                      isModifyingSlot.value = true;
                      await model.joinLeaveCourtSlot(
                        baseCourtSlot: courtSlot,
                        slotHasPlayer: courtSlot.hasPlayer(
                          currentUser,
                        ),
                        court: court,
                        teamId: currentUserInfo.teamId,
                        isTeamCaptain: currentUserInfo.isTeamCaptain,
                        onUserDontHaveEnoughPondo: () async =>
                            await _showPondoImplementationAnnouncementDialog(),
                        onNotAllHasEnoughPondo: (_) async {
                          return await _showPondoImplementationAnnouncementDialog(
                            forTeamCaptain: true,
                          );
                        },
                      );
                      isModifyingSlot.value = false;
                    },
                    onLongPress: (isSuperAdmin)
                        ? () => model.joinAsAnotherPlayer(
                              context: context,
                              baseCourtSlot: courtSlot,
                              court: court,
                              onNotEnoughPondo: () =>
                                  _showPondoImplementationAnnouncementDialog(),
                            )
                        : null,
                  ),
          );
  }
}
