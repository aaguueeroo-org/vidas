
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vidas/config/get_it.dart';
import 'package:vidas/database/dao/education_dao.dart';

import 'package:vidas/model/education.dart';
import 'package:vidas/view/vida/vida_view_model.dart';

import 'package:vidas/model/vida.dart';

class EducationViewModel with ChangeNotifier {

  String playerName = locator.get<Vida>().character.name;
  List<Education> educations = locator.get<Vida>().educations;

  EducationViewModel();

  Future<int> deleteEducation(int educationId) async {
    try {
      int educationsDeleted = await EducationDao.deleteEducation(educationId);
      educations.removeWhere((element) => element.id == educationId);
      notifyListeners();

      debugPrint('Educations: $educations');
      return educationsDeleted;
    } catch (e) {
      debugPrint(e.toString());
      return 0;
    }
  }

  Education? getCurrentEducation() {
    if (educations.isNotEmpty) {
      return educations.last;
    }
    return null;
  }

  bool isCurrentlyEnrolled(BuildContext context) {
    final vidaController = Provider.of<VidaViewModel>(context, listen: false);

    for (Education education in educations) {
      if (education.graduationYear == vidaController.age) {
        return true;
      }
    }
    return false;
  }

  Future<List<Education>> getCoursesToEnroll(BuildContext context) async {
    final VidaViewModel vidaController = Provider.of<VidaViewModel>(context, listen: false);
    int currentYear = vidaController.age;

    debugPrint('Current year: $currentYear');
    debugPrint('Graduation year: ${educations.last.graduationYear}');
    if (educations.last.graduationYear! <= currentYear) {
      int levelToEnroll = _getCurrentLevelOfStudies();
      List<Education> coursesToEnroll =
          await EducationDao.getEducationsAvailable(levelToEnroll);
      debugPrint('Courses to enroll: $coursesToEnroll');
      return coursesToEnroll;
    }
    return [];
  }

  int _getCurrentLevelOfStudies() {
    return educations.length >= 4 ? 4 : educations.length + 1;
  }

  Future<void> enroll(Education education, Vida vida) async {
    Education newEducation = await EducationDao.insertNewEducation(education, vida);
    educations.add(newEducation);
    notifyListeners();
  }

  // void updateEducationLevels() {
  //   for (Education education in educations) {
  //     if (education.graduationYear == currentYear) {
  //       education.finished = true;
  //     }
  //   }
  //   notifyListeners();
  // }
  //
  // void _graduate() {
  //   for (Education education in educations) {
  //     if (education.graduationYear == currentYear) {
  //       education.finished = true;
  //     }
  //   }
  //   notifyListeners();
  // }
}
