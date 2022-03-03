import 'package:flutter/material.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';

class NotifInputDialog extends StatelessWidget {
  const NotifInputDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ListView(
        shrinkWrap: true,
        children: [
          const DataEntryField(hint: 'Title'),
          const DataEntryField(hint: 'Body', maxLines: 10),
          FilterChip(
            label: const Text('Get yes/no feedback'),
            onSelected: (val) {},
          ),
          const SizedBox(height: 20),
          TextButton(onPressed: () {}, child: const Text('OK')),
        ],
      ),
    );
  }
}
