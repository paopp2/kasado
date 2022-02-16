import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/ui/court_details/components/court_slot_details_dialog.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CourtSchedulePanel extends StatelessWidget {
  const CourtSchedulePanel({
    Key? key,
    required this.isAdmin,
    required this.constraints,
    required this.court,
  }) : super(key: key);

  final bool isAdmin;
  final BoxConstraints constraints;
  final Court court;

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      dataSource: _getCalendarDataSource(court),
      timeSlotViewSettings: TimeSlotViewSettings(
        timeIntervalHeight: constraints.maxHeight * 0.08,
      ),
      appointmentBuilder: (context, details) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: details.appointments.map((a) {
            a as Appointment;
            final isDone = a.startTime.isBefore(DateTime.now());
            return Center(
              child: Container(
                height: constraints.maxHeight * 0.15,
                decoration: BoxDecoration(
                  color: (isDone) ? Colors.grey.shade400 : Colors.green,
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
                            isAdmin: isAdmin,
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
                        title: const Text('Available'),
                        subtitle: Text(
                            "${DateFormat('h:mm').format(a.startTime)} - ${DateFormat('h:mm a').format(a.endTime)}"),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text('Players'),
                            Text(
                              '1 / 25',
                              style: TextStyle(
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
