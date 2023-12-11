
import 'package:vidas/model/education.dart';

class TextUtils {
  static String getCourseName(Education education) {
    return education.field != null
        ? '${education.level} - ${education.field!}'
        : education.level;
  }

  // Format DateTime to string in "dd/MM/yyyy" format
  static String dateToString(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  // Format DateTime to string in "dd/MM/yyyy HH:mm" format
  static String dateTimeToString(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}
