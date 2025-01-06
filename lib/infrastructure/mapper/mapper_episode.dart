import '../../domine/entities/epidode.dart';
import '../models/model_episode.dart';

class MapperEpisode {
  static Episode episodeModelToEpisodeEntity( ResultEpisode 
    resultEpisode) {
      return Episode(
        id: resultEpisode.id!, 
      name: resultEpisode.name ?? "unknown", 
      airDate: resultEpisode.airDate ?? "unknown", 
      episode: resultEpisode.episode ?? "unknown", 
      characters: resultEpisode.characters ?? ["unknown"], 
      url: resultEpisode.url ?? "unknown", 
      created: resultEpisode.created ?? "unknown");
    }
}