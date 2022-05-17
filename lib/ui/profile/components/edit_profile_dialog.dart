import 'package:flutter/material.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';

class EditProfileDialog extends StatelessWidget {
  const EditProfileDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Edit Profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                const DataEntryField(hint: 'Birthdate'),
                Row(
                  children: const [
                    Expanded(child: DataEntryField(hint: 'Height (ft)')),
                    Expanded(child: DataEntryField(hint: 'Height (in)')),
                  ],
                ),
                const DataEntryField(hint: 'Weight (kg)'),
                const Divider(),
                const Text(
                  "Choose two positions you play best",
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Chip(label: Text('PG')),
                    Chip(label: Text('SG')),
                    Chip(label: Text('SF')),
                    Chip(label: Text('PF')),
                    Chip(label: Text('C')),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.check),
            onPressed: () {},
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
