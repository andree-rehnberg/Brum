import 'package:brum/services/gcal.dart';
import 'package:brum/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart' as GCal;
import 'package:googleapis_auth/auth_io.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('sv');
    return FutureBuilder<GCal.Events>(
      future: GoogleCalendarService().getCalendarEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: Loader(
                width: 50,
                height: 50,
              ),
            ),
          );
        }

        if (snapshot.hasData && !snapshot.hasError) {
          var calendarEvents = snapshot.data!.items!;

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                    child: Text(
                      'Kommande turer',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    child: calendarEvents.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  '😱',
                                  style: TextStyle(fontSize: 60),
                                ),
                              ),
                              Text(
                                'Inga turer på g!',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          )
                        : ListView(
                            shrinkWrap: true,
                            children: calendarEvents.map(
                              (event) {
                                var startDay = event.start?.dateTime != null
                                    ? DateFormat.MMMEd('sv_SE')
                                        .format(event.start!.dateTime!)
                                    : DateFormat.MMMEd('sv_SE')
                                        .format(event.start!.date!);
                                var endDay = event.end?.dateTime != null
                                    ? DateFormat.MMMEd('sv_SE').format(
                                        event.end!.dateTime!.subtract(
                                          const Duration(days: 1),
                                        ),
                                      )
                                    : DateFormat.MMMEd('sv_SE').format(
                                        event.end!.date!.subtract(
                                          const Duration(days: 1),
                                        ),
                                      );

                                var startDateTimeString = event
                                            .start?.dateTime !=
                                        null
                                    ? '$startDay | ${DateFormat.Hm().format(event.start!.dateTime!)} - '
                                    : '$startDay - ';
                                var endDateTimeString =
                                    event.end?.dateTime != null
                                        ? DateFormat.Hm()
                                            .format(event.end!.dateTime!)
                                        : endDay;

                                return Card(
                                  child: InkWell(
                                    onTap: () => {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                event.summary!,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(children: [
                                            Text(
                                              startDateTimeString,
                                            ),
                                            Text(
                                              endDateTimeString,
                                            )
                                          ])
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                  ),
                ),
              ],
            ),
          );
        }

        return const Scaffold(
          body: Center(
            child: Text('Calendar error!'),
          ),
        );
      },
    );
  }
}
