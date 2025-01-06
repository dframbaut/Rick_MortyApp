import '../entities/character.dart';
import '../entities/epidode.dart';
import '../entities/location.dart';

abstract class DataSourceRickAndMorty {

  Future<List<Character>> getCharacter(int page);

  Future<List<Episode>> getEpisode(int page);
  
  Future<List<Location>> getLocation(int page);

  Future<List<Character>> getResidents(List<int> idCharacters);

}