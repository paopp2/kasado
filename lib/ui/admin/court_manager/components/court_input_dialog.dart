import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_state.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/ui/admin/court_manager/components/sched_input_pane.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';

class CourtInputDialog extends HookConsumerWidget {
  const CourtInputDialog({
    Key? key,
    required this.controller,
    this.courtToEdit,
  }) : super(key: key);

  final CourtAdminController controller;
  final Court? courtToEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courtSchedList = ref.watch(courtSchedListProvider);
    final specialCourtSchedList = ref.watch(specialCourtSchedListProvider);

    return Dialog(
      insetPadding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          DataEntryField(hint: 'Court Name', tec: controller.tecCourtName),
          DataEntryField(
              hint: 'Court Photo URL', tec: controller.tecCourtPhotoUrl),
          DataEntryField(hint: 'Address', tec: controller.tecCourtAddress),
          DataEntryField(
            hint: 'Ticket Price',
            isMoney: true,
            tec: controller.tecTicketPrice,
          ),
          Row(
            children: [
              Expanded(
                child: DataEntryField(
                  hint: 'Max per Slot',
                  tec: controller.tecMaxPerSlot,
                ),
              ),
              Expanded(
                child: DataEntryField(
                  hint: 'Min per Slot',
                  tec: controller.tecMinPerSlot,
                ),
              ),
            ],
          ),
          const Divider(),
          SizedBox(
            height: 230,
            child: PageView(
              children: [
                SchedInputPane(
                  controller: controller,
                  courtSchedList: courtSchedList,
                  isSpecial: false,
                ),
                SchedInputPane(
                  controller: controller,
                  courtSchedList: specialCourtSchedList,
                  isSpecial: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () => Navigator.pop(context),
                ),
                ElevatedButton(
                  child: Text((courtToEdit != null) ? 'Update' : 'Add'),
                  onPressed: () => controller.pushCourt(
                    context: context,
                    isEdit: courtToEdit != null,
                    courtId: courtToEdit?.id,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
