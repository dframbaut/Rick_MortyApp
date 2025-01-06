// Parte del 'episodes_bloc.dart', contiene definiciones de eventos que el EpisodesBloc puede manejar.
part of 'episodes_bloc.dart';

// Clase base abstracta para todos los eventos relacionados con los episodios.
abstract class EpisodesEvent {}

// Evento para inicializar y cargar los datos iniciales en el EpisodesBloc.
class InitEpisodesBloc extends EpisodesEvent {
  InitEpisodesBloc();
}

// Evento para indicar que se deben agregar nuevos ítems al estado actual, podría usarse para actualizar la UI o cargar datos frescos.
class AddNewItems extends EpisodesEvent {
  AddNewItems();
}

// Evento utilizado para iniciar una búsqueda dentro de los episodios disponibles.
class SearchEvent extends EpisodesEvent {
}

// Evento para agregar personajes específicos de un episodio al estado. Lleva una lista de URLs o identificadores de los personajes.
class AddCharacterOfEpisodeEvent extends EpisodesEvent {
  final List<String> listCharactersOfEpisode; // Lista de identificadores de personajes que aparecen en un episodio.

  AddCharacterOfEpisodeEvent(this.listCharactersOfEpisode);
}

// Evento para solicitar la carga de una nueva página de episodios, usando el número de página actual para determinar la próxima carga.
class AddNextPageOfEpisodesBloc extends EpisodesEvent {
  final int currentPage; // Número de la página actual, utilizado para cargar la siguiente página de episodios.

  AddNextPageOfEpisodesBloc(this.currentPage);
}

// Evento para indicar si se están requiriendo más datos, útil para gestionar estados de carga y actualizar la UI.
class IsRequeringData extends EpisodesEvent {
  final bool isRequeringData; // Booleano que indica si se están solicitando datos activamente.

  IsRequeringData(this.isRequeringData);
}
