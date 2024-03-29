import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kasado/constants/date_time_related_constants.dart';
import 'package:kasado/logic/court_details/court_details_state.dart';
import 'package:kasado/logic/court_slot_details/court_slot_details_view_model.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/ui/court_details/components/court_slot_tile.dart';
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

  final CourtSlotDetailsViewModel model;
  final bool isAdmin;
  final BoxConstraints constraints;
  final Court court;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courtSlotsStream = ref.watch(courtSlotsStreamProvider(court.id));

    return courtSlotsStream.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const LoadingWidget(),
      data: (courtSlots) {
        return SfCalendar(
          dataSource: _getCalendarDataSource(court, isAdmin),
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
            final monthHeaderText =
                DateFormat('MMMM yyyy').format(details.date);

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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: details.appointments.map((app) {
                return CourtSlotTile(
                  constraints: constraints,
                  courtSlot: model.getBaseCourtSlot(
                    appointment: app,
                    court: court,
                    courtSlots: courtSlots,
                  ),
                  isAdmin: isAdmin,
                  model: model,
                  court: court,
                );
              }).toList(),
            );
          },
        );
      },
    );
  }
}

_AppointmentDataSource _getCalendarDataSource(Court court, bool isAdmin) {
  List<Appointment> appointments = <Appointment>[];

  appointments.addAll(
    court.courtScheds.map(
      (sched) {
        return Appointment(
          id: 'appointment_id',
          startTime: sched.timeRange.startsAt,
          endTime: sched.timeRange.endsAt,
          recurrenceExceptionDates: (isAdmin)
              ? null
              : court.specialCourtScheds
                  .map((specialSched) => specialSched.timeRange.startsAt)
                  .toList(),
          recurrenceRule: SfCalendar.generateRRule(
                RecurrenceProperties(
                  recurrenceType: RecurrenceType.weekly,
                  startDate: DateTime.now(),
                  weekDays: [weekdaysList[sched.weekdayIndex]],
                ),
                DateTime(2015, 1, 1),
                DateTime(2015, 1, 1),
              ) +
              ((sched.endDate == null)
                  ? ""
                  : ";UNTIL=${sched.endDate!.toIso8601String()}"),
        );
      },
    ),
  );

  /// Add the specialCourtSlots that was hidden due to the
  /// 'recurrenceExceptionDates' above
  appointments.addAll(court.specialCourtScheds.map((specialSched) {
    return Appointment(
      recurrenceId: 'appointment_id',
      startTime: specialSched.timeRange.startsAt,
      endTime: specialSched.timeRange.endsAt,
    );
  }));

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
