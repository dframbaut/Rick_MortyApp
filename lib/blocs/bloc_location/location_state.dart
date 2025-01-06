// Parte del 'location_bloc.dart', contiene la definición del estado que maneja el LocationBloc.
part of 'location_bloc.dart';

// Define el estado para la gestión de ubicaciones utilizando Equatable para comparaciones automáticas de estados.
class LocationsState extends Equatable {
  final List<Location>? locationsList;  // Lista de ubicaciones cargadas o nula si no se han cargado.
  final Location? searchResult;        // Resultado de una búsqueda específica de ubicación.
  final String? queryParameters;       // Parámetros de consulta utilizados en la búsqueda.
  final bool? isActiveSearch;          // Indica si hay una búsqueda activa.
  final List<Character>? residents;    // Personajes residentes en la ubicación seleccionada.
  final bool? isRequeringData;         // Indica si la aplicación está solicitando datos (cargando más contenido).
  final int? currentPage;              // Página actual en el contexto de paginación de ubicaciones.

  const LocationsState({
    this.locationsList,
    this.searchResult,
    this.queryParameters,
    this.isActiveSearch,
    this.residents,
    this.isRequeringData = false, // Valor predeterminado es 'false'.
    this.currentPage = 1          // Valor predeterminado es '1'.
  });

  // Método para copiar y modificar cualquier campo del estado de forma inmutable.
  LocationsState copyWith({
    List<Location>? locationsList,
    Location? searchResult,
    String? queryParameters,
    bool? isActiveSearch,
    List<Character>? residents,
    bool? isRequeringData,
    int? currentPage
  }) => LocationsState(
    locationsList: locationsList ?? this.locationsList,
    searchResult: searchResult, // Si es nulo, conserva el valor actual.
    queryParameters: queryParameters ?? this.queryParameters,
    isActiveSearch: isActiveSearch ?? this.isActiveSearch,
    residents: residents ?? this.residents,
    isRequeringData: isRequeringData ?? this.isRequeringData,
    currentPage: currentPage ?? this.currentPage
  );
    
  // Propiedades que determinan si dos estados son iguales.
  @override
  List<Object?> get props => [
    locationsList,
    searchResult,
    queryParameters,
    isActiveSearch,
    residents,
    isRequeringData,
    currentPage
  ];
}
