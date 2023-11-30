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

}