import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/ui/home/tabs/ticket/components/enlarged_ticket_dialog.dart';
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

    useEffect(() {
      ref.read(mixpanel)!.track("Viewed TicketsTab");
      return;
    }, []);

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
                              leading: Hero(
                                tag: ticket.id,
                                child: QrImage(data: ticket.id),
                              ),
                              title: Text(ticket.courtName),
                              subtitle: Text(
                                "${utils.getDateFormat(ticket.courtSlot.timeRange.startsAt)} / ${utils.getTimeRangeFormat(ticket.courtSlot.timeRange)}",
                              ),
                              onTap: () {
                                ref.read(mixpanel)!.track("Enlarged a ticket");
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return EnlargedTicketDialog(
                                      ticket: ticket,
                                      utils: utils,
                                      userName: userInfo!.user.displayName!,
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
