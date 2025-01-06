import 'package:http/http.dart' as http;

import '../../domine/datasources/datasource_rick_and_morty.dart';
import '../../domine/entities/character.dart';
import '../../domine/entities/epidode.dart';
import '../../domine/entities/location.dart';
import '../mapper/mapper_character.dart';
import '../mapper/mapper_episode.dart';
import '../mapper/mapper_location.dart';
import '../models/model_character.dart';
import '../models/model_episode.dart';
import '../models/model_location.dart';

class DataSourceImpRickAndMorty extends DataSourceRickAndMorty {

  Future<dynamic> _response( String typeRequest, Map<String,String> queryParameter) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'rickandmortyapi.com',
      path: '/api/$typeRequest',
      queryParameters: queryParameter 
    );
    
    final response = await http.get(uri);
    if (response.statusCode < 200 || response.statusCode > 299) {
        throw Exception("Error code: ${response.statusCode}");
      }  
      switch (typeRequest) {
        case "character":
         final ModelCharacter model = modelCharacterFromJson(response.body);
         return model;
         case "location":
         final ModelLocation model = modelLocationFromJson(response.body);
         return model;
         case "episode":
         final ModelEpisode model = modelEpisodeFromJson(response.body);
         return model;
         default:
         final String preResponse = '{"results": ${response.body}}';
         final ModelCharacter model = modelCharacterFromJson(preResponse);
         return model;
      }  
  }

  @override
 Future<List<Character>> getCharacter(int page) async {
  // Query and data modeling
  final ModelCharacter dataCharacter = await DataSourceImpRickAndMorty()._response("character", {"page": "$page"}) as ModelCharacter;
  
  // Mapping of the result to the entity
  // Asegúrate de que el mapeo sea a List<Character> explícitamente
  final List<Character> characters = dataCharacter.results!.map<Character>((ResultCharacter e) => MapperCharacter.characterModelToCharacterEntity(e)).toList();
  
  // Return list of entities Characters
  return characters;
}

  @override
  Future<List<Episode>> getEpisode(int page) async {
  final ModelEpisode dataEpisode = await DataSourceImpRickAndMorty()._response("episode", {"page": "$page"});
  final List<Episode> episodes = dataEpisode.results!.map<Episode>((ResultEpisode e) => MapperEpisode.episodeModelToEpisodeEntity(e)).toList();
  return episodes;
}


  @override
  Future<List<Location>> getLocation(int page) async {
  final ModelLocation dataLocation = await DataSourceImpRickAndMorty()._response("location", {"page": "$page"}) as ModelLocation;
  
  final List<Location> locations = dataLocation.results!.map<Location>((ResultLocation e) => MapperLocation.locationModelToLocationEntity(e)).toList();
  
  return locations;
}


  @override
  Future<List<Character>> getResidents(List<int> idCharacters) async {
  final String idList = idCharacters.join(',');
  final ModelCharacter dataCharacter = await DataSourceImpRickAndMorty()._response("character/$idList", {"":""}) as ModelCharacter;
  final List<Character> characters = dataCharacter.results!.map<Character>((ResultCharacter e) => MapperCharacter.characterModelToCharacterEntity(e)).toList();
  
  return characters;
  }

}