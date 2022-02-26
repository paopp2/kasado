import 'package:flutter/material.dart';
import 'package:kasado/logic/admin/player_manager/player_manager_view_model.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/ui/shared/data_entry_field.dart';

class PondoInputDialog extends StatelessWidget {
  const PondoInputDialog({
    Key? key,
    required this.userInfo,
    required this.model,
  }) : super(key: key);

  final KasadoUserInfo userInfo;
  final PlayerManagerViewModel model;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              userInfo.user.displayName!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Pondo: ${userInfo.pondo}'),
            const DataEntryField(
              hint: 'Pondo to add/deduct',
              isMoney: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'DEDUCT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'ADD',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
