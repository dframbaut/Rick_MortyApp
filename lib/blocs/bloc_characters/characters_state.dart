// Parte del CharactersBloc que maneja los estados relacionados con los personajes en la aplicación.
part of 'characters_bloc.dart';

// Define el estado de los personajes utilizando Equatable para comparaciones automáticas de estados.
class CharactersState extends Equatable {
  final List<Character>? characterList; // La lista de personajes cargados.
  final Character? searchResult;        // Resultado de una búsqueda activa.
  final String? queryParameters;        // Parámetros usados en la última búsqueda.
  final bool? isActiveSearch;           // Indica si la búsqueda está activa.
  final bool? isRequeringData;          // Indica si se están solicitando más datos.
  final int? currentPage;               // Número de la página actual para paginación.

  const CharactersState({
    this.characterList,
    this.searchResult,
    this.queryParameters,
    this.isActiveSearch,
    this.isRequeringData = false,
    this.currentPage = 1
  });

  // Crea una nueva instancia del estado con modificaciones selectivas, permitiendo actualizar partes del estado inmutable.
  CharactersState copyWith({
    List<Character>? characterList,
    Character? searchResult,
    String? queryParameters,
    bool? isActiveSearch,
    bool? isRequeringData,
    int? currentPage
  }) => CharactersState(
    characterList: characterList ?? this.characterList,
    searchResult: searchResult,
    queryParameters: queryParameters ?? this.queryParameters,
    isActiveSearch: isActiveSearch ?? this.isActiveSearch,
    isRequeringData: isRequeringData ?? this.isRequeringData,
    currentPage: currentPage ?? this.currentPage
  );

  // Propiedades que determinan si dos estados son iguales.
  @override
  List<Object?> get props => [
    characterList, 
    searchResult, 
    queryParameters, 
    isActiveSearch, 
    isRequeringData, 
    currentPage
  ];  
}
