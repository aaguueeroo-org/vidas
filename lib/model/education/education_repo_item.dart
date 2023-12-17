/// Contains the information about education in the repo from the database.
class EducationRepoItem {
  final int id;
  final String? field;
  final String levelName;
  final int duration;

  EducationRepoItem({
    required this.id,
    this.field,
    required this.levelName,
    required this.duration,
  });

  factory EducationRepoItem.fromRepo(Map<String, dynamic> map) {
    return EducationRepoItem(
      id: map['education_id'] as int,
      field: map['field'],
      levelName: map['level'],
      duration: map['duration'] as int,
    );
  }

  @override
  String toString() {
    return 'EducationRepoItem: $id, $field, $levelName, $duration';
  }
}
