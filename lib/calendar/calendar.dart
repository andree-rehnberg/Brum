import 'package:brum/services/gcal.dart';
import 'package:brum/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart' as GCal;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('sv_SE', null);
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

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 80, 20, 20),
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
                              String startDate = event.start?.date != null
                                  ? DateFormat.MMMEd('sv_SE').format(
                                      event.start!.date!.toLocal(),
                                    )
                                  : DateFormat.MMMEd('sv_SE').format(
                                      event.start!.dateTime!.toLocal(),
                                    );

                              String endDate = event.end!.date != null
                                  ? DateFormat.MMMEd('sv_SE').format(
                                      event.end!.date!.toLocal().subtract(
                                            const Duration(days: 1),
                                          ),
                                    )
                                  : DateFormat.MMMEd('sv_SE').format(
                                      event.end!.dateTime!.toLocal(),
                                    );

                              var startTime = event.start!.dateTime != null
                                  ? DateFormat.Hm().format(
                                      event.start!.dateTime!.toLocal(),
                                    )
                                  : null;

                              var endTime = event.end!.dateTime != null
                                  ? DateFormat.Hm().format(
                                      event.end!.dateTime!.toLocal(),
                                    )
                                  : null;

                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Card(
                                  child: InkWell(
                                    onTap: () => {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 8,
                                                ),
                                                child: Text(
                                                  event.summary!,
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                                child: Icon(
                                                  Icons.calendar_month,
                                                  size: 20,
                                                ),
                                              ),
                                              Text(
                                                startDate != endDate
                                                    ? '$startDate - $endDate'
                                                    : startDate,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                                child: Icon(
                                                  Icons.access_time,
                                                  size: 20,
                                                ),
                                              ),
                                              Text(
                                                startTime != null ||
                                                        endTime != null
                                                    ? '$startTime - $endTime'
                                                    : 'Heldagsbrum!',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
