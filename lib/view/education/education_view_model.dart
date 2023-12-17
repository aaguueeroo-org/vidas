import 'package:flutter/cupertino.dart';
import 'package:vidas/config/get_it.dart';
import 'package:vidas/database/dao/education_dao.dart';

import 'package:vidas/model/education.dart';

import 'package:vidas/model/vida.dart';

import 'package:vidas/model/education_repo_item.dart';



class EducationViewModel with ChangeNotifier {
  Vida vida = locator.get<Vida>();

  EducationViewModel();

  Education? getCurrentEducation() {
    if (vida.educations.isNotEmpty) {
      return vida.educations.last;
    }
    return null;
  }

  bool isCurrentlyEnrolled() {

    if (vida.educations.isEmpty) return false;

    for (Education education in vida.educations) {
      if (education.graduationYear == vida.currentYear) {
        return true;
      }
    }

    return false;
  }

  Future<List<EducationRepoItem>> getCoursesToEnroll() async {
    int levelToEnroll = _getCurrentLevelOfStudies();

    if(vida.character.age < 12) return [];

    if (vida.educations.isEmpty ||
        (vida.educations.last.graduationYear! <= vida.currentYear)) {
      List<EducationRepoItem> coursesToEnroll =
          await EducationDao.getEducationsAvailable(levelToEnroll);
      return coursesToEnroll;
    }
    return [];
  }

  int _getCurrentLevelOfStudies() {
    return vida.educations.length >= 4 ? 4 : vida.educations.length + 1;
  }

  Future<void> startPreschool() async {
    List<EducationRepoItem> preschool = await EducationDao.getEducationsAvailable(1);
    enroll(preschool.first);
  }

  Future<void> startMiddleSchool() async {
    List<EducationRepoItem> middleSchool = await EducationDao.getEducationsAvailable(2);
    enroll(middleSchool.first);
  }

  Future<void> enroll(EducationRepoItem education) async {
    debugPrint(education.toString());
    int? educationId = await EducationDao.insertNewEducation(education, vida);

    if (educationId != null) {
      Education newEducation = Education(
        id: educationId,
        field: education.field,
        levelName: education.levelName,
        graduationYear: vida.currentYear + education.duration,
      );

      vida.educations.add(newEducation);
      notifyListeners();
    }

  }

  Future<int> deleteEducation(int educationId) async {
    try {
      int educationsDeleted = await EducationDao.deleteEducation(educationId);
      vida.educations.removeWhere((element) => element.id == educationId);
      notifyListeners();

      debugPrint('Educations: ${vida.educations}');
      return educationsDeleted;
    } catch (e) {
      debugPrint(e.toString());
      return 0;
    }
  }

  // void updateEducationLevels() {
  //   for (Education education in educations) {
  //     if (education.graduationYear == currentYear) {
  //       education.finished = true;
  //     }
  //   }
  //   notifyListeners();
  // }
}
