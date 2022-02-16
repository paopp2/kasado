import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/courts_owned/courts_owned_state.dart';
import 'package:kasado/logic/courts_owned/courts_owned_view_model.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';

class NewCourtInputDialog extends HookConsumerWidget {
  const NewCourtInputDialog({
    Key? key,
    required this.model,
  }) : super(key: key);

  final CourtsOwnedViewModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChipIndices = ref.watch(selectedChipIndicesProvider);

    return Dialog(
      child: ListView(
        children: [
          DataEntryField(hint: 'Court Name', tec: model.tecCourtName),
          DataEntryField(hint: 'Court Photo URL', tec: model.tecCourtPhotoUrl),
          DataEntryField(hint: 'Address', tec: model.tecCourtAddress),
          DataEntryField(
            hint: 'Ticket Price',
            isMoney: true,
            tec: model.tecTicketPrice,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('8 - 10 AM'),
                selected: selectedChipIndices.contains(0),
                onSelected: (val) => model.selectSchedChip(val, 0),
              ),
              FilterChip(
                label: const Text('10 - 12 PM'),
                selected: selectedChipIndices.contains(1),
                onSelected: (val) => model.selectSchedChip(val, 1),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('12 - 2 PM'),
                selected: selectedChipIndices.contains(2),
                onSelected: (val) => model.selectSchedChip(val, 2),
              ),
              FilterChip(
                label: const Text('2 - 4 PM'),
                selected: selectedChipIndices.contains(3),
                onSelected: (val) => model.selectSchedChip(val, 3),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('4 - 6 PM'),
                selected: selectedChipIndices.contains(4),
                onSelected: (val) => model.selectSchedChip(val, 4),
              ),
              FilterChip(
                label: const Text('6 - 8 PM'),
                selected: selectedChipIndices.contains(5),
                onSelected: (val) => model.selectSchedChip(val, 5),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('8 - 10 PM'),
                selected: selectedChipIndices.contains(6),
                onSelected: (val) => model.selectSchedChip(val, 6),
              ),
            ],
          ),
          TextButton(
            child: const Text('Add Court'),
            onPressed: () => model.addNewCourt(context),
          ),
        ],
      ),
    );
  }
}
