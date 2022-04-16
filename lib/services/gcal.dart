import "package:googleapis_auth/auth_io.dart";
import 'package:googleapis/calendar/v3.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

Future<String> loadServiceAccountJson() async {
  return jsonDecode(
    await rootBundle.loadString('assets/brum_service_account.json'),
  );
}

// Use service account credentials to get an authenticated and auto refreshing client.
class GoogleCalendarService {
  static final _accountCredentials = ServiceAccountCredentials.fromJson(
    loadServiceAccountJson(),
  );

  static final _scopes = [
    CalendarApi.calendarEventsScope,
    CalendarApi.calendarReadonlyScope
  ];

  Future<Events> getCalendarEvents() async {
    AuthClient client =
        await clientViaServiceAccount(_accountCredentials, _scopes);

    CalendarApi calendar = CalendarApi(client);
    Events calendarEvents = await calendar.events.list(
        "msjf71eo0hbhjc72ggj0pv1390@group.calendar.google.com",
        timeMin: DateTime.now()
        // timeMin: DateTime.now()
        //     .subtract(
        //       const Duration(days: 4),
        //     )
        //     .toUtc(),
        // timeMax: DateTime.now()
        //     .add(
        //       const Duration(days: 5),
        //     )
        //     .toUtc(),
        // singleEvents: true,
        // orderBy: 'starttime',
        );

    return calendarEvents;
  }
}
