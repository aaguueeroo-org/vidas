class Education {
  final int id;
  final String level;
  final String? field;
  double? grade;
  late int? graduationYear;
  bool isGraduated;

  Education({
    required this.id,
    this.field,
    required this.level,
    this.grade = 5,
    required this.graduationYear,
    this.isGraduated = false,
  });

  void advanceYear(int currentYear) {
    if (currentYear > graduationYear!) _graduate();
  }

  void _graduate() {
    isGraduated = true;
  }

  factory Education.fromSqlMap(Map<String, dynamic> map) {
    return Education(
      id: map['id'] as int,
      level: map['level'],
      field: map['field'],
      grade: map['grade'] as double,
      graduationYear: map['graduation_year'] as int,
      isGraduated: map['is_graduated'] == 1,
    );
  }

  Map<String, dynamic> toSqlMapSaveMode() {
    return {
      // 'id': ,
      'level': level,
      'grade': grade,
      'graduation_year': graduationYear,
    };
  }

  Map<String, dynamic> toSqlMapCreateMode() {
    return {
      // 'education_id': ,
      'grade': grade,
      'graduation_year': graduationYear,
    };
  }

  @override
  String toString() {
    return 'Education: $level, $field, $grade, $graduationYear, $isGraduated';
  }
}
