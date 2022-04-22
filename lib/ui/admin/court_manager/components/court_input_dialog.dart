import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/logic/admin/court_manager/court_admin_controller.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/ui/admin/court_manager/components/court_sched_input_dialog.dart';
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
          const Divider(),
          TextButton(
            child: const Text("Add Sched"),
            onPressed: () => showDialog(
              context: context,
              builder: (_) => const CourtSchedInputDialog(),
            ),
            style: TextButton.styleFrom(primary: Colors.green),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemBuilder: (context, i) {
                return ListTile(
                  title: const Text("Mon / 7:00 - 8:00pm"),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
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
