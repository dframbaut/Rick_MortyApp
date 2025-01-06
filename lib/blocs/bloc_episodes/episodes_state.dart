part of 'episodes_bloc.dart';

// Define el estado para el manejo de episodios con características adicionales como búsqueda y paginación.
class EpisodesState extends Equatable {
  final List<Episode>? episodesList;  // Lista de episodios cargados o nula si no se han cargado.
  final Episode? searchResult;        // Resultado de una búsqueda específica de un episodio.
  final String? queryParameters;      // Parámetros de consulta utilizados en la búsqueda.
  final bool? isActiveSearch;         // Indica si hay una búsqueda activa.
  final List<Character>? characterInEpisode; // Personajes en el episodio seleccionado.
  final bool? isRequeringData;        // Indica si la aplicación está solicitando datos (cargando más contenido).
  final int? currentPage;             // Página actual en el contexto de paginación de episodios.

  const EpisodesState({
    this.episodesList,
    this.searchResult,
    this.queryParameters,
    this.isActiveSearch,
    this.characterInEpisode,
    this.isRequeringData = false, // Valor predeterminado es 'false'.
    this.currentPage = 1          // Valor predeterminado es '1'.
  });

  // Método para copiar y modificar cualquier campo del estado de forma inmutable.
  EpisodesState copyWith({
    List<Episode>? episodesList,
    Episode? searchResult,
    String? queryParameters,
    bool? isActiveSearch,
    List<Character>? characterInEpisode,
    bool? isRequeringData,
    int? currentPage
  }) => EpisodesState(
    episodesList: episodesList ?? this.episodesList,
    searchResult: searchResult, // Si es nulo, conserva el valor actual.
    queryParameters: queryParameters ?? this.queryParameters,
    isActiveSearch: isActiveSearch ?? this.isActiveSearch,
    characterInEpisode: characterInEpisode ?? this.characterInEpisode,
    isRequeringData: isRequeringData ?? this.isRequeringData,
    currentPage: currentPage ?? this.currentPage
  );
    
  // Lista de propiedades que se utilizan para determinar si dos estados son iguales.
  @override
  List<Object?> get props => [
    episodesList,
    searchResult,
    queryParameters,
    isActiveSearch,
    characterInEpisode,
    isRequeringData,
    currentPage
  ];
}
