// ignore_for_file: constant_identifier_names

enum Status { Alive, Dead, unknown }

enum Gender { Female, Male, unknown, Genderless }

final genderValues = EnumValues({
  "Female": Gender.Female,
  "Male": Gender.Male,
  "unknown": Gender.unknown,
  "Genderless": Gender.Genderless,
});

final statusValues = EnumValues(
    {"Alive": Status.Alive, "Dead": Status.Dead, "unknown": Status.unknown});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
