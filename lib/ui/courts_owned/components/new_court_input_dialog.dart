import 'package:flutter/material.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';

class NewCourtInputDialog extends StatelessWidget {
  const NewCourtInputDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView(
        children: [
          const DataEntryField(hint: 'Court Name'),
          const DataEntryField(hint: 'Court Photo URL'),
          const DataEntryField(hint: 'Address'),
          const DataEntryField(hint: 'Ticket Price'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('8 - 10 AM'),
                onSelected: (isSelected) {},
              ),
              FilterChip(
                label: const Text('10 - 12 PM'),
                onSelected: (isSelected) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('12 - 2 PM'),
                onSelected: (isSelected) {},
              ),
              FilterChip(
                label: const Text('2 - 4 PM'),
                onSelected: (isSelected) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('4 - 6 PM'),
                onSelected: (isSelected) {},
              ),
              FilterChip(
                label: const Text('6 - 8 PM'),
                onSelected: (isSelected) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilterChip(
                label: const Text('8 - 10 PM'),
                onSelected: (isSelected) {},
              ),
            ],
          ),
          TextButton(
            child: const Text('Add Court'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
