import 'package:intl/intl.dart';

class AppDateFormatter {
  static const String DMMY = 'dd MMMM yyyy';
  static const String HHMMSS = 'hh:mm:ss';
  static const String YearMothDay = 'yyyy-MM-dd';

  static DateTime textToDate(String text, String lang) {
    try {
      return DateFormat("yyyy-MM-ddThh:mm:ss", lang).parse(text);
    } catch (_) {
      return DateTime.now();
    }
  }

  static String textTFormate(String text, String formate, String lang) {
    try {
      final DateFormat format = DateFormat(formate, lang);
      return format.format(DateFormat("yyyy-MM-ddThh:mm:ss").parse(text));
    } catch (_) {
      return '';
    }
  }

  static String dateToFormate(
    DateTime time,
    String formate,
  ) {
    try {
      final DateFormat format = DateFormat(formate, 'en');
      return format.format(time);
    } catch (_) {
      return '';
    }
  }

  static String dateToString(DateTime time) {
    try {
      final DateFormat format = DateFormat('dd/MM/yyyy', 'en');
      return format.format(time);
    } catch (_) {
      return '';
    }
  }

  static DateTime textToTime(String text, String lang) {
    try {
      return DateFormat("hh:mm:ss", lang).parse(text);
    } catch (_) {
      return DateTime.now();
    }
  }
}
