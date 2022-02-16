import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasado/ui/court_details/components/court_slot_details_dialog.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CourtSchedulePanel extends StatelessWidget {
  const CourtSchedulePanel({
    Key? key,
    required this.isAdmin,
    required this.constraints,
  }) : super(key: key);

  final bool isAdmin;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      dataSource: _getCalendarDataSource(),
      timeSlotViewSettings: const TimeSlotViewSettings(timeIntervalHeight: 80),
      appointmentBuilder: (context, details) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: details.appointments.map((a) {
            a as Appointment;
            final isDone = a.startTime.isBefore(DateTime.now());
            return Center(
              child: Container(
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
                            '0 / 15',
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
            );
          }).toList(),
        );
      },
    );
  }
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.addAll([
    Appointment(
      startTime: DateTime(2015, 1, 1, 7, 0),
      endTime: DateTime(2015, 1, 1, 8, 0),
      recurrenceRule: SfCalendar.generateRRule(
        RecurrenceProperties(
          recurrenceType: RecurrenceType.daily,
          startDate: DateTime.now(),
        ),
        DateTime(2015, 1, 1, 7, 0),
        DateTime(2015, 1, 1, 8, 0),
      ),
    ),
    Appointment(
      startTime: DateTime(2015, 1, 1, 8, 0),
      endTime: DateTime(2015, 1, 1, 9, 0),
      subject: 'Players: 0 / 15',
      recurrenceRule: SfCalendar.generateRRule(
        RecurrenceProperties(
          recurrenceType: RecurrenceType.daily,
          startDate: DateTime.now(),
        ),
        DateTime(2015, 1, 1, 8, 0),
        DateTime(2015, 1, 1, 9, 0),
      ),
    ),
  ]);

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
