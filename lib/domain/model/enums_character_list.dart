// ignore_for_file: constant_identifier_names

enum Species { Alien, Human }

enum Status { Alive, Dead, unknown }

enum Gender { Female, Male, unknown }

final speciesValues =
    EnumValues({"Alien": Species.Alien, "Human": Species.Human});

final genderValues = EnumValues(
    {"Female": Gender.Female, "Male": Gender.Male, "unknown": Gender.unknown});

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
