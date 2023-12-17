
import 'package:vidas/model/education/education.dart';

import 'package:vidas/model/education/education_repo_item.dart';

class TextUtils {
  static String getCourseNameFromEnroll(EducationRepoItem education) {
    return education.field != null
        ? '${education.levelName} - ${education.field!}'
        : education.levelName;
  }

  static String getCourseNameFromEducation(Education education) {
    return education.field != null
        ? '${education.levelName} - ${education.field!}'
        : education.levelName;
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
