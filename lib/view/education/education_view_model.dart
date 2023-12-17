import 'package:flutter/material.dart';

import 'package:vidas/config/get_it.dart';
import 'package:vidas/database/dao/education_dao.dart';
import 'package:vidas/model/education.dart';
import 'package:vidas/model/vida.dart';
import 'package:vidas/model/education_repo_item.dart';

class EducationViewModel with ChangeNotifier {
  final Vida _vida = locator.get<Vida>();

  List<Education> get educations => _vida.educations;
  int get age => _vida.character.age;
  int get currentYear => _vida.currentYear;
  String get characterName => _vida.character.name;

  EducationViewModel();

  Education? getCurrentEducation() {
    if (educations.isNotEmpty) {
      return educations.last;
    }
    return null;
  }

  bool isCurrentlyEnrolled() {
    if (educations.isEmpty) return false;

    for (Education education in educations) {
      if (education.isEnrolled) return true;
    }

    return false;
  }

  Future<List<EducationRepoItem>> getCoursesToEnroll() async {
    int levelToEnroll = _getCurrentLevelOfStudies();

    if (age < 12) return [];

    if (educations.isEmpty ||
        (educations.last.graduationYear! <= currentYear)) {
      List<EducationRepoItem> coursesToEnroll =
          await EducationDao.getEducationsAvailable(levelToEnroll);
      return coursesToEnroll;
    }
    return [];
  }

  int _getCurrentLevelOfStudies() {
    return educations.length >= 4 ? 4 : educations.length + 1;
  }

  Future<void> startPreschool() async {
    EducationRepoItem preschool =
        (await EducationDao.getEducationsAvailable(1)).first;
    enroll(preschool);
  }

  Future<void> startMiddleSchool() async {
    EducationRepoItem middleSchool =
        (await EducationDao.getEducationsAvailable(2)).first;
    enroll(middleSchool);
  }

  Future<void> enroll(EducationRepoItem education) async {
    debugPrint(education.toString());
    int? educationId = await EducationDao.insertNewEducation(education, _vida);

    if (educationId != null) {
      Education newEducation = Education(
        id: educationId,
        field: education.field,
        levelName: education.levelName,
        graduationYear: currentYear + education.duration,
      );

      _vida.educations.add(newEducation);
      notifyListeners();
    }
  }

  Future<int> deleteEducation(int educationId) async {
    try {
      int educationsDeleted = await EducationDao.deleteEducation(educationId);
      _vida.educations.removeWhere((element) => element.id == educationId);
      notifyListeners();

      debugPrint('Educations: ${_vida.educations}');
      return educationsDeleted;
    } catch (e) {
      debugPrint(e.toString());
      return 0;
    }
  }
}
