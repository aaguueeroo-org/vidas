import 'package:flutter/cupertino.dart';
import 'package:vidas/model/education/education_levels.dart';

/// Contains the information about education that the player has. It differs
/// from the repository model in that it contains information about the
/// graduation year and the grade.
class Education {
  /// The id of the saved education corresponding to GAME_EDUCATION table in the
  /// database. It contains data that is specific to the game, such as the
  /// grade, the graduation year and whether the education is completed or not.
  final int id;

  final String levelName;
  final String? field;

  String get name {
    return levelName == EducationLevels.preSchool.toString() ||
            levelName == EducationLevels.middleSchool.toString()
        ? levelName
        : '$levelName - $field';
  }

  double grade;
  late int? graduationYear;
  bool isEnrolled;
  bool isGraduated;

  Education({
    required this.id,
    required this.levelName,
    this.field,
    this.grade = 5,
    required this.graduationYear,
    this.isEnrolled = true,
    this.isGraduated = false,
  });

  void advanceYear(int currentYear) {
    if (currentYear == graduationYear! && isEnrolled) _graduate();
  }

  void _graduate() {
    debugPrint('Graduated from $levelName');
    isGraduated = true;
    isEnrolled = false;
  }

  void enroll(int graduationYear) {
    isEnrolled = true;
    this.graduationYear = graduationYear;
  }

  void dropOut() {
    isEnrolled = false;
    graduationYear = null;
  }

  factory Education.fromSaved(Map<String, dynamic> map) {
    return Education(
      id: map['id'] as int,
      levelName: map['level'],
      field: map['field'],
      grade: map['grade'] as double,
      graduationYear: map['graduation_year'] as int?,
      isGraduated: map['is_graduated'] == 1,
      isEnrolled: map['is_enrolled'] == 1,
    );
  }

  Map<String, dynamic> toSqlMapSaveMode() {
    return {
      'id': id,
      'grade': grade,
      'graduation_year': graduationYear,
      'is_enrolled': isEnrolled ? 1 : 0,
    };
  }

  @override
  String toString() {
    return 'Education: $levelName, $field, $grade, $graduationYear, $isGraduated, $isEnrolled';
  }

  canDropOut() {
    return isEnrolled &&
        !isGraduated &&
        levelName != EducationLevels.middleSchool.toString() &&
        levelName != EducationLevels.preSchool.toString();
  }
}
