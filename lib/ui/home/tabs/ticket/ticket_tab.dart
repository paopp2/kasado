import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/ui/shared/loading_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketTab extends HookConsumerWidget {
  const TicketTab({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final currentUserInfoStream = ref.watch(currentUserInfoProvider);

    return currentUserInfoStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const LoadingWidget(),
      data: (userInfo) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 20,
            child: !(userInfo?.hasReserved ?? false)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('NO TICKET'),
                      Text('(Join a game to obtain a ticket)'),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'GAME TICKET',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: QrImage(
                          data:
                              'Eacha prank! Bitaw dol mugana ra ni puhon trust me',
                        ),
                      ),
                      const Divider(),
                      Text(
                        currentUser!.displayName!.toUpperCase(),
                        style: const TextStyle(fontSize: 10),
                      ),
                      Text(
                        userInfo!.reservedAt!.courtId,
                        style: const TextStyle(fontSize: 10),
                      ),
                      Text(
                        userInfo.reservedAt!.slotId,
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
