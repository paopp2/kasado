import 'package:flutter/material.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/kasado_user/kasado_user.dart';
import 'package:kasado/model/ticket/ticket.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EnlargedTicketDialog extends StatelessWidget {
  const EnlargedTicketDialog({
    Key? key,
    required this.utils,
    required this.ticket,
    required this.user,
  }) : super(key: key);

  final KasadoUser user;
  final Ticket ticket;
  final KasadoUtils utils;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "GAME TICKET",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: QrImage(
                      data: ticket.getQrData(user),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            Text(
              ticket.courtSlot.courtName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              utils.getTimeRangeFormat(
                ticket.courtSlot.timeRange,
                showDate: true,
              ),
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              user.displayName!.toUpperCase(),
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
