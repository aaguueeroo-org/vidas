class Education {
  String id;
  String field;
  String level;
  double grade;
  late int graduationYear;
  late bool isGraduated;

  Education({
    required this.id,
    required this.field,
    required this.level,
    required this.grade,
    required currentYear,
  }) {
    graduationYear = currentYear + 4;
    isGraduated = currentYear >= graduationYear;
  }
}
