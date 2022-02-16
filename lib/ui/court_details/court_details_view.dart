import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CourtDetailsView extends StatelessWidget {
  const CourtDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: SizedBox(
                  height: constraints.maxHeight * 0.3,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHonQRDPCLA0zXvTzoThs-Q2hQ9s5lg3RBmA&usqp=CAU",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text('Skina Japan Basketball Court'.toUpperCase()),
              const SizedBox(height: 30),
              Expanded(
                child: SfCalendar(
                  view: CalendarView.schedule,
                  dataSource: _getCalendarDataSource(),
                  scheduleViewSettings: ScheduleViewSettings(
                    appointmentItemHeight: constraints.maxHeight * 0.1,
                  ),
                  appointmentBuilder: (context, details) {
                    return Column(
                      children: details.appointments.map((a) {
                        a as Appointment;
                        final isDone = a.startTime.isBefore(DateTime.now());
                        return Container(
                          decoration: BoxDecoration(
                            color:
                                (isDone) ? Colors.grey.shade400 : Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                textColor: Colors.white,
                                title: const Text('Available'),
                                subtitle: Text(
                                    "${DateFormat('h:mm').format(a.startTime)} - ${DateFormat('h:mm a').format(a.endTime)}"),
                                trailing: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                        );
                      }).toList(),
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
      startTime: DateTime(2015, 1, 1, 14, 0),
      endTime: DateTime(2015, 1, 1, 15, 0),
      subject: 'Players: 0 / 15',
      recurrenceRule: SfCalendar.generateRRule(
        RecurrenceProperties(
          recurrenceType: RecurrenceType.daily,
          startDate: DateTime.now(),
        ),
        DateTime(2015, 1, 1, 14, 0),
        DateTime(2015, 1, 1, 15, 0),
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
