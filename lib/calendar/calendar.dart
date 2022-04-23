import 'package:brum/services/gcal.dart';
import 'package:brum/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart' as GCal;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

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

          return ListView(
            shrinkWrap: calendarEvents.isEmpty,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 100, 20, 20),
                child: Text(
                  'Kommande turer',
                  style: TextStyle(fontSize: 34),
                ),
              ),
              calendarEvents.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                          child: Text(
                            '😱',
                            style: TextStyle(fontSize: 60),
                          ),
                        ),
                        Text(
                          'Inget brum på g!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        ...calendarEvents.map(
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
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                        const SizedBox(height: 20),
                      ],
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
