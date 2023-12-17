enum EducationLevels {
  preSchool,
  middleSchool,
  highSchool,
  university;

  static EducationLevels fromInt(int level) {
    switch (level) {
      case 1:
        return EducationLevels.preSchool;
      case 2:
        return EducationLevels.middleSchool;
      case 3:
        return EducationLevels.highSchool;
      case 4:
        return EducationLevels.university;
      default:
        throw Exception('Invalid education level');
    }
  }

  int toInt() {
    switch (this) {
      case EducationLevels.preSchool:
        return 1;
      case EducationLevels.middleSchool:
        return 2;
      case EducationLevels.highSchool:
        return 3;
      case EducationLevels.university:
        return 4;
      default:
        throw Exception('Invalid education level');
    }
  }

  @override
  String toString() {
    switch (this) {
      case EducationLevels.preSchool:
        return 'Preschool';
      case EducationLevels.middleSchool:
        return 'Middle school';
      case EducationLevels.highSchool:
        return 'High school';
      case EducationLevels.university:
        return 'University';
      default:
        throw Exception('Invalid education level');
    }
  }

}