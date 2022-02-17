import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/court_details/court_details_state.dart';
import 'package:kasado/logic/court_details/court_details_view_model.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_slot/court_slot.dart';
import 'package:kasado/model/time_range/time_range.dart';
import 'package:kasado/ui/court_details/components/court_slot_details_dialog.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CourtSchedulePanel extends HookConsumerWidget {
  const CourtSchedulePanel({
    Key? key,
    required this.constraints,
    required this.model,
    required this.isAdmin,
    required this.court,
  }) : super(key: key);

  final CourtDetailsViewModel model;
  final bool isAdmin;
  final BoxConstraints constraints;
  final Court court;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utils = ref.watch(kasadoUtilsProvider);
    final courtSlotsStream = ref.watch(courtSlotsStreamProvider(court.id));
    final currentUser = ref.watch(currentUserProvider)!;

    return SfCalendar(
      dataSource: _getCalendarDataSource(court),
      timeSlotViewSettings: TimeSlotViewSettings(
        timeIntervalHeight: constraints.maxHeight * 0.08,
      ),
      appointmentBuilder: (context, details) {
        return courtSlotsStream.when(
            error: (e, _) => Text(e.toString()),
            loading: () => const CircularProgressIndicator(),
            data: (courtSlots) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: details.appointments.map((a) {
                  a as Appointment;
                  final isSlotClosed = utils.isCurrentSlotClosed(
                    TimeRange(startsAt: a.startTime, endsAt: a.endTime),
                  );
                  final appSlotId =
                      "${a.startTime.toIso8601String()}-${a.endTime.toIso8601String()}";

                  CourtSlot baseCourtSlot =
                      (courtSlots.any((slot) => slot.slotId == appSlotId))
                          ? courtSlots.singleWhere(
                              (slot) => slot.slotId == appSlotId,
                            )
                          : CourtSlot(
                              courtId: court.id,
                              players: [],
                              timeRange: TimeRange(
                                startsAt: a.startTime,
                                endsAt: a.endTime,
                              ),
                            );

                  final currentUserIsReserved =
                      baseCourtSlot.hasPlayer(currentUser);

                  return Center(
                    child: Container(
                      height: constraints.maxHeight * 0.15,
                      decoration: BoxDecoration(
                        color: (isSlotClosed)
                            ? Colors.grey.shade300
                            : (baseCourtSlot.isFull)
                                ? Colors.red
                                : (currentUserIsReserved)
                                    ? Colors.green.shade200
                                    : Colors.green.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CourtSlotDetailsDialog(
                                  constraints: constraints,
                                  model: model,
                                  isAdmin: isAdmin,
                                  court: court,
                                  courtSlot: baseCourtSlot,
                                  isDone: isSlotClosed,
                                );
                              },
                            );
                          },
                          child: Center(
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              textColor: Colors.white,
                              title: Text(
                                (baseCourtSlot.isFull)
                                    ? 'Full'
                                    : currentUserIsReserved
                                        ? 'Joined'
                                        : 'Available',
                              ),
                              subtitle: Text(
                                  "${DateFormat('h:mm').format(a.startTime)} - ${DateFormat('h:mm a').format(a.endTime)}"),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text('Players'),
                                  Text(
                                    '${baseCourtSlot.playerCount} / 25',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            });
      },
    );
  }
}

_AppointmentDataSource _getCalendarDataSource(Court court) {
  List<Appointment> appointments = <Appointment>[];
  appointments.addAll(court.allowedTimeSlots.map((tRange) {
    return Appointment(
      startTime: tRange.startsAt,
      endTime: tRange.endsAt,
      recurrenceRule: SfCalendar.generateRRule(
        RecurrenceProperties(
          recurrenceType: RecurrenceType.daily,
          startDate: DateTime.now(),
        ),
        DateTime(2015, 1, 1),
        DateTime(2015, 1, 1),
      ),
    );
  }));

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
