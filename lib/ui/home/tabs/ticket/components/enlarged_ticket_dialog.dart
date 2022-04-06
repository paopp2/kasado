import 'package:flutter/material.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/ticket/ticket.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EnlargedTicketDialog extends StatelessWidget {
  const EnlargedTicketDialog({
    Key? key,
    required this.utils,
    required this.ticket,
    required this.userName,
  }) : super(key: key);

  final String userName;
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
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Hero(
                tag: ticket.id,
                child: QrImage(data: ticket.id),
              ),
            ),
            const Divider(),
            Text(
              ticket.courtName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${utils.getDateFormat(ticket.courtSlot.timeRange.startsAt)} / ${utils.getTimeRangeFormat(ticket.courtSlot.timeRange)}",
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              userName.toUpperCase(),
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}