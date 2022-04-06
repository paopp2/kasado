import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
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
    final currentUserInfoStream = ref.watch(currentUserInfoProvider);
    final utils = ref.watch(kasadoUtilsProvider);

    return currentUserInfoStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const LoadingWidget(),
      data: (userInfo) {
        final tickets = userInfo?.tickets ?? [];
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: tickets.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('NO TICKETS'),
                    Text('(Join games to obtain tickets)'),
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'YOUR TICKETS',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: tickets.length,
                        itemBuilder: (context, i) {
                          final ticket = tickets[i];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              tileColor: Colors.grey.shade100,
                              leading: QrImage(
                                data:
                                    'Eacha prank! Bitaw dol mugana ra ni puhon trust me',
                              ),
                              title: Text(ticket.courtName),
                              subtitle: Text(
                                "${utils.getDateFormat(ticket.courtSlot.timeRange.startsAt)} / ${utils.getTimeRangeFormat(ticket.courtSlot.timeRange)}",
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(20.0),
                    //   child: QrImage(
                    //     data:
                    //         'Eacha prank! Bitaw dol mugana ra ni puhon trust me',
                    //   ),
                    // ),
                    // const Divider(),
                    // Text(
                    //   currentUser!.displayName!.toUpperCase(),
                    //   style: const TextStyle(fontSize: 10),
                    // ),
                    // const Text(
                    //   // userInfo!.reservedAt!.courtId,
                    //   'Placeholder',
                    //   style: TextStyle(fontSize: 10),
                    // ),
                    // const Text(
                    //   // userInfo.reservedAt!.slotId,
                    //   'Placeholder',
                    //   style: TextStyle(fontSize: 10),
                    // ),
                  ],
                ),
        );
      },
    );
  }
}
