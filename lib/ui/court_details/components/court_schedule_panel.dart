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
import 'package:kasado/ui/shared/loading_widget.dart';
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
      view: CalendarView.schedule,
      allowedViews: const [CalendarView.schedule, CalendarView.day],
      allowViewNavigation: true,
      scheduleViewSettings: ScheduleViewSettings(
        appointmentItemHeight: constraints.maxHeight * 0.15,
      ),
      timeSlotViewSettings: TimeSlotViewSettings(
        timeIntervalHeight: constraints.maxHeight * 0.08,
      ),
      scheduleViewMonthHeaderBuilder: (context, details) {
        final monthHeaderText = DateFormat('MMMM yyyy').format(details.date);
        return Padding(
          padding: const EdgeInsets.fromLTRB(55, 5, 5, 5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade500,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                monthHeaderText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
      appointmentBuilder: (context, details) {
        return courtSlotsStream.when(
          error: (e, _) => Text(e.toString()),
          loading: () => const LoadingWidget(),
          data: (courtSlots) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: details.appointments.map((a) {
                a as Appointment;
                final aTimeRange = TimeRange(
                  startsAt: a.startTime,
                  endsAt: a.endTime,
                );
                final isSlotClosed = utils.isCurrentSlotClosed(aTimeRange);
                final appSlotId = CourtSlot.getIdFromTimeRange(aTimeRange);

                CourtSlot baseCourtSlot =
                    (courtSlots.any((slot) => slot.slotId == appSlotId))
                        ? courtSlots.singleWhere(
                            (slot) => slot.slotId == appSlotId,
                          )
                        : CourtSlot(
                            courtId: court.id,
                            slotId: CourtSlot.getIdFromTimeRange(aTimeRange),
                            timeRange: aTimeRange,
                          );

                final currentUserIsReserved =
                    baseCourtSlot.hasPlayer(currentUser);

                return Center(
                  child: Container(
                    height: constraints.maxHeight * 0.15,
                    decoration: BoxDecoration(
                      color: (isSlotClosed)
                          ? Colors.grey.shade300
                          : (baseCourtSlot.isFull ||
                                  baseCourtSlot.isClosedByAdmin)
                              ? Colors.red.shade200
                              : (currentUserIsReserved)
                                  ? Colors.green.shade200
                                  : Colors.green.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (baseCourtSlot.isClosedByAdmin && !isAdmin)
                            ? null
                            : () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CourtSlotDetailsDialog(
                                      constraints: constraints,
                                      model: model,
                                      isAdmin: isAdmin,
                                      court: court,
                                      baseCourtSlot: baseCourtSlot,
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
                              (isSlotClosed)
                                  ? 'Closed'
                                  : (baseCourtSlot.isFull)
                                      ? 'Full'
                                      : (baseCourtSlot.isClosedByAdmin)
                                          ? 'Closed by admin'
                                          : currentUserIsReserved
                                              ? 'Joined'
                                              : 'Available',
                            ),
                            subtitle: Text(
                              utils.getTimeRangeFormat(aTimeRange),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: (baseCourtSlot.isClosedByAdmin)
                                  ? []
                                  : [
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
          },
        );
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
          recurrenceType: RecurrenceType.weekly,
          startDate: DateTime.now(),
          weekDays: court.allowedWeekDays,
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
