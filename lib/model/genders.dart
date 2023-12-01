enum Genders {
  male,
  female,
  diverse;

  @override
  String toString() {
    switch (this) {
      case Genders.male:
        return 'Male';
      case Genders.female:
        return 'Female';
      case Genders.diverse:
        return 'Diverse';
      default:
        return 'Male'; // Handle any additional cases or default
    }
  }

  static Genders fromString(String genderString) {
    switch (genderString.toLowerCase()) {
      case 'male':
        return Genders.male;
      case 'female':
        return Genders.female;
      case 'diverse':
        return Genders.diverse;
      default:
        throw ArgumentError('Invalid gender string: $genderString');
    }
  }


}