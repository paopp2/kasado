import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/repositories/court_slot_repository.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class TicketScannerTab extends HookConsumerWidget {
  const TicketScannerTab({
    Key? key,
    required this.constraints,
    required this.courtSlot,
  }) : super(key: key);

  final BoxConstraints constraints;
  final CourtSlot courtSlot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courtSlotRepo = ref.watch(courtSlotRepositoryProvider);
    final isQrScannerOpenState = useState(true);
    final scannedQrData = useState([]);
    final courtSlotState = useState<CourtSlot?>(null);
    final utils = ref.watch(kasadoUtilsProvider);

    return (isQrScannerOpenState.value)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "SCAN TICKET HERE",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Builder(
                builder: (context) {
                  final scanController = MobileScannerController();

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: SizedBox(
                        height: constraints.maxHeight * 0.40,
                        width: constraints.maxWidth * 0.40,
                        child: MobileScanner(
                          controller: scanController,
                          onDetect: ((barcode) async {
                            final qrData = barcode.raw!.split('~');
                            final courtId = qrData[3];
                            final slotId = qrData[4];

                            courtSlotState.value =
                                await courtSlotRepo.getCourtSlot(
                              courtId,
                              slotId,
                            );

                            scannedQrData.value = qrData;
                            isQrScannerOpenState.value = false;
                          }),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          )
        : Builder(
            builder: (context) {
              final playerId = scannedQrData.value[0];
              final playerName = scannedQrData.value[2];
              final userPhotoUrl = scannedQrData.value[1];
              final courtSlot = courtSlotState.value;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(backgroundImage: NetworkImage(userPhotoUrl)),
                  Text(playerName),
                  Text("Court: ${courtSlot!.courtName}"),
                  Text("Slot: ${utils.getTimeRangeFormat(
                    courtSlot.timeRange,
                    showDate: true,
                  )}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: const Text("Cancel"),
                        onPressed: () => isQrScannerOpenState.value = true,
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.red),
                      ),
                      TextButton(
                        child: const Text("Add to Queue"),
                        // ignore: prefer-extracting-callbacks
                        onPressed: () async {
                          await courtSlotRepo.addPlayerIdToQueue(
                            courtSlot: courtSlot,
                            playerId: playerId,
                            onPlayerAlreadyQueued: () => Fluttertoast.showToast(
                              msg: "Player already in queue",
                            ),
                          );
                          isQrScannerOpenState.value = true;
                        },
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.green),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
  }
}
