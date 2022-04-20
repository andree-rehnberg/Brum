import "package:googleapis_auth/auth_io.dart";
import 'package:googleapis/calendar/v3.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

Future<ServiceAccountCredentials> loadServiceAccountCredentials() async {
  final String jsonString =
      await rootBundle.loadString('assets/brum_service_account.json');

  return ServiceAccountCredentials.fromJson(json.decode(jsonString));
}

// Use service account credentials to get an authenticated and auto refreshing client.
class GoogleCalendarService {
  Future<Events> getCalendarEvents() async {
    final _accountCredentials = await loadServiceAccountCredentials();

    final _scopes = [
      CalendarApi.calendarEventsScope,
      CalendarApi.calendarReadonlyScope
    ];

    AuthClient client =
        await clientViaServiceAccount(_accountCredentials, _scopes);

    String localTimeZone = await FlutterNativeTimezone.getLocalTimezone();

    CalendarApi calendar = CalendarApi(client);
    Events calendarEvents = await calendar.events.list(
      "msjf71eo0hbhjc72ggj0pv1390@group.calendar.google.com",
      timeMin: DateTime.now(),
      timeZone: localTimeZone,
    );

    return calendarEvents;
  }
}
