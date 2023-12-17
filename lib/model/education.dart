import 'package:flutter/cupertino.dart';

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
  double? grade;
  late int? graduationYear;
  bool isGraduated;

  Education({
    required this.id,
    required this.levelName,
    this.field,
    this.grade = 5,
    required this.graduationYear,
    this.isGraduated = false,
  });

  void advanceYear(int currentYear) {
    if (currentYear == graduationYear!) _graduate();
  }

  void _graduate() {
    debugPrint('Graduated from $levelName');
    isGraduated = true;
  }

  factory Education.fromSaved(Map<String, dynamic> map) {
    return Education(
      id: map['id'] as int,
      levelName: map['level'],
      field: map['field'],
      grade: map['grade'] as double,
      graduationYear: map['graduation_year'] as int,
      isGraduated: map['is_graduated'] == 1,
    );
  }

  Map<String, dynamic> toSqlMapSaveMode() {
    return {
      'id': id,
      'grade': grade,
      'graduation_year': graduationYear,
    };
  }

  @override
  String toString() {
    return 'Education: $levelName, $field, $grade, $graduationYear, $isGraduated';
  }
}
