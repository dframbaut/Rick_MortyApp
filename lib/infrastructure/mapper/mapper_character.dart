

import '../../domine/entities/character.dart';
import '../models/model_character.dart';

class MapperCharacter {
  static Character characterModelToCharacterEntity( ResultCharacter resultCharacter ) {
    return Character(
     id: resultCharacter.id ?? 00001,
     name: resultCharacter.name ?? "unknown",
     status: statusValues.getValue(resultCharacter.status ?? "unknown"),
     species: resultCharacter.species ?? "unknown",
     type: resultCharacter.type ?? "unknown",
     gender: genderValues.getValue(resultCharacter.gender ?? "unknown"),
     origin: OriginCharacter(
      name: resultCharacter.origin?.name ?? "unknown",
      url: resultCharacter.origin?.url ?? "unknown"
      ),
     location: LocationCharacterEntity(      
      name: resultCharacter.location?.name ?? "unknown",
      url: resultCharacter.location?.url ?? "unknown"      
     ),
     image: resultCharacter.image ?? "unknown",
     episode: resultCharacter.episode ?? [],
     url: resultCharacter.url ?? "unknown",
     created: resultCharacter.created ?? "unknown");

  }
}

final genderValues = EnumValues({
  "Female": Gender.female,
  "Male": Gender.male,
  "Genderless": Gender.genderless,
  "unknown": Gender.unknown,
});

final statusValues = EnumValues({
  "Alive": Status.alive,
  "Dead": Status.dead,
  "unknown": Status.unknown,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);
  
  T getValue(String key) {
    return map[key]!;
  }

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

