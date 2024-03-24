import 'package:intl/intl.dart';

class StringUtils {
  StringUtils._();

  static String dateForecastFormat(String date) {
    if (date.isEmpty) {
      return '';
    }

    final dateConvert = DateTime.parse(date);

    final hourFormat = DateFormat.Hm().format(dateConvert);

    final dayOfWeek = DateFormat.E().format(dateConvert);

    return '$dayOfWeek - $hourFormat';
  }
}
