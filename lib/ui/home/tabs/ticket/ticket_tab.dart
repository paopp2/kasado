import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/kasado_user_info/kasado_user_info.dart';
import 'package:kasado/model/ticket/ticket.dart';
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

    _onTicketPressed(Ticket ticket, KasadoUserInfo userInfo) {
      ref.read(mixpanel)!.track("Enlarged a ticket");
      showDialog(
        context: context,
        builder: (_) {
          return EnlargedTicketDialog(
            ticket: ticket,
            utils: utils,
            userName: userInfo.user.displayName!,
          );
        },
      );
    }

    return currentUserInfoStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const LoadingWidget(),
      data: (userInfo) {
        final tickets = userInfo?.validTickets ?? [];

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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: tickets.length,
                          itemBuilder: (context, i) {
                            final ticket = tickets[i];

                            return Card(
                              color: Colors.grey.shade100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                onTap: () => _onTicketPressed(
                                  ticket,
                                  userInfo!,
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        width: 75,
                                        height: 75,
                                        color: Colors.grey.shade300,
                                        child: QrImage(
                                          data: ticket.id,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              ticket.courtSlot.courtName,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              utils.getTimeRangeFormat(
                                                ticket.courtSlot.timeRange,
                                                showDate: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
