import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_state.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/ui/admin/court_manager/components/sched_input_pane.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';
import 'package:kasado/ui/shared/place_search_field.dart';

class CourtInputDialog extends HookConsumerWidget {
  const CourtInputDialog({
    Key? key,
    required this.controller,
    required this.constraints,
    this.courtToEdit,
  }) : super(key: key);

  final BoxConstraints constraints;
  final CourtAdminController controller;
  final Court? courtToEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courtSchedList = ref.watch(courtSchedListProvider);
    final specialCourtSchedList = ref.watch(specialCourtSchedListProvider);
    final courtLocation = ref.watch(courtLocationProvider);

    return Dialog(
      insetPadding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.8,
            child: PageView(
              children: [
                Column(
                  children: [
                    DataEntryField(
                        hint: 'Court Name', tec: controller.tecCourtName),
                    DataEntryField(
                        hint: 'Court Photo URL',
                        tec: controller.tecCourtPhotoUrl),
                    PlaceSearchField(
                      constraints: constraints,
                      onLocationTapped: controller.setCourtLocation,
                      initialPlace: courtLocation,
                    ),
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
                  ],
                ),
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
