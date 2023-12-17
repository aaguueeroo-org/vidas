class GameSavingSlot {
  final int id;
  final String name;
  final int avatarId;
  final int age;
  final DateTime createdOn;
  final DateTime lastModified;

  GameSavingSlot({
    required this.id,
    required this.name,
    required this.avatarId,
    required this.age,
    required this.createdOn,
    required this.lastModified,
  });

  Map<String, dynamic> toSqlMap() {
    return {
      'id': id,
      'name': name,
      'avatar_id': avatarId,
      'age': age,
      'created_on': createdOn.toIso8601String(),
      'last_modified': lastModified.toIso8601String(),
    };
  }

  factory GameSavingSlot.fromSqlMap(Map<String, dynamic> map) {
    return GameSavingSlot(
      id: map['id'] as int,
      name: map['name'],
      avatarId: map['avatar_id'] as int,
      age: map['age'] as int,
      createdOn: DateTime.parse(map['created_on']),
      lastModified: DateTime.parse(map['last_modified']),
    );
  }

  @override
  String toString() {
    return 'GameSavingSlot(id: $id, name: $name, avatarId: $avatarId, age: $age, createdOn: $createdOn, lastModified: $lastModified)';
  }
}