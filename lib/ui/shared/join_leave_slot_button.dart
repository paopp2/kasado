import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/court_slot_details/court_slot_details_view_model.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
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
                        onUserDontHaveEnoughPondo: () async {
                          return await showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () => true,
                                  ),
                                  TextButton(
                                    child: const Text('CANCEL'),
                                    onPressed: () => false,
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        onNotAllHasEnoughPondo: (_) async {
                          return await showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () =>
                                        Navigator.pop(context, true),
                                  ),
                                  TextButton(
                                    child: const Text('CANCEL'),
                                    onPressed: () =>
                                        Navigator.pop(context, false),
                                  ),
                                ],
                              );
                            },
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
                            onNotEnoughPondo: () async {
                              return await showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    actions: [
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () => true,
                                      ),
                                      TextButton(
                                        child: const Text('CANCEL'),
                                        onPressed: () => false,
                                      ),
                                    ],
                                  );
                                },
                              );
                            })
                        : null,
                  ),
          );
  }
}
