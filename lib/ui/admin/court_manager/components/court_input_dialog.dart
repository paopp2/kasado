import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_state.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/model/court/court.dart';
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
    final selectedSchedChipIndices =
        ref.watch(selectedSchedChipIndicesProvider);
    final selectedWeekDayChipIndices =
        ref.watch(selectedDayChipIndicesProvider);

    return Dialog(
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
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('MON'),
                selected: selectedWeekDayChipIndices.contains(0),
                onSelected: (val) => controller.selectWeekDayChip(val, 0),
              ),
              FilterChip(
                label: const Text('TUE'),
                selected: selectedWeekDayChipIndices.contains(1),
                onSelected: (val) => controller.selectWeekDayChip(val, 1),
              ),
              FilterChip(
                label: const Text('WED'),
                selected: selectedWeekDayChipIndices.contains(2),
                onSelected: (val) => controller.selectWeekDayChip(val, 2),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('THU'),
                selected: selectedWeekDayChipIndices.contains(3),
                onSelected: (val) => controller.selectWeekDayChip(val, 3),
              ),
              FilterChip(
                label: const Text('FRI'),
                selected: selectedWeekDayChipIndices.contains(4),
                onSelected: (val) => controller.selectWeekDayChip(val, 4),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('SAT'),
                selected: selectedWeekDayChipIndices.contains(5),
                onSelected: (val) => controller.selectWeekDayChip(val, 5),
              ),
              FilterChip(
                label: const Text('SUN'),
                selected: selectedWeekDayChipIndices.contains(6),
                onSelected: (val) => controller.selectWeekDayChip(val, 6),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('6 - 8 AM'),
                selected: selectedSchedChipIndices.contains(0),
                onSelected: (val) => controller.selectSchedChip(val, 0),
              ),
              FilterChip(
                label: const Text('8 - 10 AM'),
                selected: selectedSchedChipIndices.contains(1),
                onSelected: (val) => controller.selectSchedChip(val, 1),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('10 - 12 PM'),
                selected: selectedSchedChipIndices.contains(2),
                onSelected: (val) => controller.selectSchedChip(val, 2),
              ),
              FilterChip(
                label: const Text('12 - 2 PM'),
                selected: selectedSchedChipIndices.contains(3),
                onSelected: (val) => controller.selectSchedChip(val, 3),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('2 - 4 PM'),
                selected: selectedSchedChipIndices.contains(4),
                onSelected: (val) => controller.selectSchedChip(val, 4),
              ),
              FilterChip(
                label: const Text('4 - 6 PM'),
                selected: selectedSchedChipIndices.contains(5),
                onSelected: (val) => controller.selectSchedChip(val, 5),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('6 - 8 PM'),
                selected: selectedSchedChipIndices.contains(6),
                onSelected: (val) => controller.selectSchedChip(val, 6),
              ),
              FilterChip(
                label: const Text('8 - 10 PM'),
                selected: selectedSchedChipIndices.contains(7),
                onSelected: (val) => controller.selectSchedChip(val, 7),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('5 - 7 AM'),
                selected: selectedSchedChipIndices.contains(8),
                onSelected: (val) => controller.selectSchedChip(val, 8),
              ),
              FilterChip(
                label: const Text('7 - 9 AM'),
                selected: selectedSchedChipIndices.contains(9),
                onSelected: (val) => controller.selectSchedChip(val, 9),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('9 - 11 PM'),
                selected: selectedSchedChipIndices.contains(10),
                onSelected: (val) => controller.selectSchedChip(val, 10),
              ),
              FilterChip(
                label: const Text('11 - 1 PM'),
                selected: selectedSchedChipIndices.contains(11),
                onSelected: (val) => controller.selectSchedChip(val, 11),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('1 - 3 PM'),
                selected: selectedSchedChipIndices.contains(12),
                onSelected: (val) => controller.selectSchedChip(val, 12),
              ),
              FilterChip(
                label: const Text('3 - 5 PM'),
                selected: selectedSchedChipIndices.contains(13),
                onSelected: (val) => controller.selectSchedChip(val, 13),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('5 - 7 PM'),
                selected: selectedSchedChipIndices.contains(14),
                onSelected: (val) => controller.selectSchedChip(val, 14),
              ),
              FilterChip(
                label: const Text('7 - 9 PM'),
                selected: selectedSchedChipIndices.contains(15),
                onSelected: (val) => controller.selectSchedChip(val, 15),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text((courtToEdit != null) ? 'Update Court' : 'Add Court'),
              onPressed: () => controller.pushCourt(
                context: context,
                isEdit: courtToEdit != null,
                courtId: courtToEdit?.id,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
