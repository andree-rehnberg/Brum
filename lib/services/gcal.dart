import "package:googleapis_auth/auth_io.dart";
import 'package:googleapis/calendar/v3.dart';

// Use service account credentials to get an authenticated and auto refreshing client.
class GoogleCalendarService {
  static final _accountCredentials = ServiceAccountCredentials.fromJson({
    "type": "service_account",
    "project_id": "brum-89bac",
    "private_key_id": "8e507546d103c5a3ad729d6273822311d632e0af",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDReies/HpFg8YW\nc4BGL7aOnCDkhMPPGZVTX6LvFG4OnyZCN80Q35bu/7XhvAtpuZ0REaebwGVvt2f8\nwmWa50LYkcQsH/Xic4OxsGoHtujNex6FZFKZSHf6w4V4c2owSCkBqsSOZ23nP0bq\nNuk+xC0ODtRTuM6slpDxr3wVf8mtyakdVJAkwMB/FvU4KxMpJ/EgUiuxar3tGVUD\nZiiW+b/wnvwqCrncVXmuvQ5QiTQC7Yg8ivi2g4SqoxqSeW/dZli2rxHtG3e+JdNB\nGU+ZtYnZqBD/oV5l1cmrcLNlBaWHRlSIOkeS7seAP2Cvh13LYaHdKATYOquy9c0U\nidVWEORpAgMBAAECggEAGE48csuz00OMNTgvItWv8MGoZmOKRcox46Pl56g+8ebg\n/U90tZe/71jPzZKwX1LYaO3bvQx4qJsHD5Ktz+iz/qWBNd56fQ1Ks1AlKWJ9hjQa\nMT+X/u2j8D6GCtkXceU5jtY16tEQ9UNIEu6Op0gDc01gsRsxLeDljgl+1A7JA6c7\n+WfJFL4RvFCCFU8PR+QxcwZvXODxX6A2sTsaicGWK6p+VFJwsjhX1RcPcGsSiOHM\nmA3s5FWrZsozKP4kDG6QcCRPWRqFO4TmiOX1mrHUlufHjslHlucY+9euhPETTEOD\n5KztKZfXbxLVCvrps2ZRY+ULK4q2FUcC5CtGhb4hQQKBgQDvbgzuCdbeGi/dTbBY\nHIvCCG3dfbHk/Ad5Or+BQ97JQdaVudhU3dF1KuNh/5IhtScNpOEQKL8l+MOn4++M\nVSOmPy81DpoRE/Ft4d14c4yGVPsNFaPU0neerlWxI191l9wiSrKJ9865ZUGNYFxc\n2lMI6nI7NA43D5HF4UJQX38zyQKBgQDf+W+YMJJ9YGzoib7bo5VYyfooeCuarwPt\nW+bepD49LY+mHTgtCXSjowC3Lrf3okoYMYWz/kzKedVZnIajgbV1WUjr0/KH2WQB\nZICpKlZAHc6oGzbzEYOf3laTcVMXz5t6IoDE2g3ZgZHDmAV4FvjXAMjSwNol4OLD\not/fwhI7oQKBgQCZ+0jNff518Jl/1grnX9RyAUHHBKN4BK45xRKMa73H6VO8Dz2V\ntuKSW/bIe7jbfMmU+MjVv57PKOGMBAd3VPoMXO5bTPzApvbKGEx6vrVNXzHmBFjM\n8l6D6tKpjXpDAltMooWYPYrxqLEz3xkHjlGAlmbItH2/4394p5oiXohMIQKBgQCw\nEGb3Hgep42j5i36rLfay62No+L5eRIIzznC4SChc8zne/U0xqiM0l2hyl5kqYzsX\ntaZDDf7Tk95xKSh10/sPGnbGW8BlpjCFH7o8QPm4QTY409voS7ZKr/8ivIzzRNIV\nupW7KSaF+uLY/OIfuv82FHnJoqxZ5mScIacXQHoQwQKBgGYwXbiTEuFz0jk2xeXs\nq0o3A8tKzD3nap5glbCAqiz1TE+W5UzrOJREuPzVFcMcUIP0NoyNoVDGEses9VUt\n+LOrG5x4E+Q+wLwtDHp0B8hhEYC4Q0p4UKfWGs4g4r2RbmeyF08bAmWImH2gEAS5\nMP1RpaqjPTCXs62D3j+ztYd4\n-----END PRIVATE KEY-----\n",
    "client_email":
        "brum-calendar-service-account@brum-89bac.iam.gserviceaccount.com",
    "client_id": "117871640459359356122",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/brum-calendar-service-account%40brum-89bac.iam.gserviceaccount.com"
  });
  // .fromJson({
  //   "private_key_id": "<please fill in>",
  //   "private_key": "<please fill in>",
  //   "client_email": "<please fill in>@developer.gserviceaccount.com",
  //   "client_id": "<please fill in>.apps.googleusercontent.com",
  //   "type": "service_account"
  // });
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
