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
    this.height,
    this.width,
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
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const _buttonTextStyle = TextStyle(fontSize: 18, color: Colors.white);
    final isSuperAdmin = currentUserInfo.isSuperAdmin;
    final isModifyingSlot = useState(false);
    final slotHasPlayerAndLeaveDisallowed =
        courtSlot.hasPlayer(currentUser) && !allowLeave;

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
        desc: "Sugod karong Sunday May 1 dol, implement "
            "na tas atoang Pondo system para pud mahapsay atoang "
            "systema. Bale mura rakag magpaload sa imong Pondo, "
            "pwede through GCash or hatag personal, nya kana "
            "imong Pondo, magamit na para maka-join og mga court slot. "
            "Ig-abots atong sched, aw wa nay hasol, duwa nalay ato. "
            "Sa karon pwede pa man sad nuon bisag way Pondo pero mas "
            "may jung atong hinay-hinayan hehe. Gege mao rato dol lamats!",
        autoDismiss: false,
        onDissmissCallback: (dismissType) => Navigator.pop(
          context,
          dismissType == DismissType.BTN_CANCEL,
        ),
        padding: const EdgeInsets.all(15.0),
        dialogBorderRadius: BorderRadius.circular(20),
        headerAnimationLoop: false,
        btnCancelOnPress: () =>
            ref.read(mixpanel)!.track("Pressed 'Join w/o PONDO'"),
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

    Future<void> _joinLeaveSlot() async {
      isModifyingSlot.value = true;
      await model.joinLeaveCourtSlot(
        baseCourtSlot: courtSlot,
        slotHasPlayer: courtSlot.hasPlayer(
          currentUser,
        ),
        teamId: currentUserInfo.teamId,
        isTeamCaptain: currentUserInfo.isTeamCaptain,
        onUserDontHaveEnoughPondo: () async {
          // TODO: Temporarily removed PONDO implementation announcement dialog
          // return await _showPondoImplementationAnnouncementDialog();
          return await Future.delayed(Duration.zero, () => true);
        },
        onNotAllHasEnoughPondo: (_) async {
          // return await _showPondoImplementationAnnouncementDialog(
          //   forTeamCaptain: true,
          // );
          return await Future.delayed(Duration.zero, () => true);
        },
      );
      isModifyingSlot.value = false;
    }

    // TODO: Move this function elsewhere (temp quick fix for prod)
    JoinLeaveSlotButtonState getButtonState() {
      final slotHasPlayer = courtSlot.hasPlayer(currentUser);

      if (courtSlot.isClosedByAdmin) {
        return const JoinLeaveSlotButtonState(
          onPressed: null,
          color: null,
          content: Text('CLOSED', style: _buttonTextStyle),
        );
      }

      if (slotHasPlayerAndLeaveDisallowed) {
        return JoinLeaveSlotButtonState(
          onPressed: null,
          color: Colors.green.shade100,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.check, color: Colors.white),
              Text('JOINED', style: _buttonTextStyle),
            ],
          ),
        );
      }

      if (courtSlot.isFull && courtSlot.hasPlayer(currentUser) && allowLeave) {
        return JoinLeaveSlotButtonState(
          onPressed: _joinLeaveSlot,
          color: Colors.red.shade300,
          content: const Text("LEAVE GAME", style: _buttonTextStyle),
        );
      }

      final slotIsFull = courtSlot.isFull;
      if (slotIsFull ||
          (currentUserInfo.hasSchedConflict(courtSlot) && !slotHasPlayer)) {
        return JoinLeaveSlotButtonState(
          onPressed: null,
          color: null,
          content: Text(
            (slotIsFull) ? "FULL" : "IN CONFLICT",
            style: _buttonTextStyle,
          ),
        );
      }

      return JoinLeaveSlotButtonState(
        onPressed: _joinLeaveSlot,
        color: slotHasPlayer ? Colors.red.shade300 : Colors.green.shade300,
        content: Text(
          (slotHasPlayer) ? "LEAVE GAME" : "JOIN GAME",
          style: _buttonTextStyle,
        ),
      );
    }

    Future<void> _onSuperAdminLongPressed() async {
      model.joinAsAnotherPlayer(
        context: context,
        baseCourtSlot: courtSlot,
        onNotEnoughPondo: () => _showPondoImplementationAnnouncementDialog(),
      );
    }

    final buttonState = getButtonState();

    return Visibility(
      visible: showButton,
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          child: isModifyingSlot.value
              ? const LoadingWidget(color: Colors.white)
              : buttonState.content,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => buttonState.color,
            ),
          ),
          onPressed: buttonState.onPressed,
          onLongPress: (isSuperAdmin) ? _onSuperAdminLongPressed : null,
        ),
      ),
    );
  }
}

class JoinLeaveSlotButtonState {
  const JoinLeaveSlotButtonState({
    required this.onPressed,
    required this.color,
    required this.content,
  });
  final VoidCallback? onPressed;
  final Color? color;
  final Widget content;
}
