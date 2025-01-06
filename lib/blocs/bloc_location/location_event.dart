// Este archivo es parte de 'location_bloc.dart', contiene definiciones de eventos que el LocationBloc puede manejar.
part of 'location_bloc.dart';

// Clase base abstracta para todos los eventos relacionados con las ubicaciones.
abstract class LocationEvent {}

// Evento para inicializar y cargar los datos iniciales en el LocationBloc.
class InitLocationBloc extends LocationEvent {
  InitLocationBloc();
}

// Evento para indicar que se deben agregar nuevos ítems al estado actual, podría usarse para actualizar la UI o cargar datos frescos.
class AddNewItems extends LocationEvent {
  AddNewItems();
}

// Evento utilizado para iniciar una búsqueda dentro de las ubicaciones disponibles.
class SearchEvent extends LocationEvent {
}

// Evento para agregar residentes a una ubicación específica, lleva una lista de identificadores de residentes.
class AddResidents extends LocationEvent {
  final List<String> listResidents; // Lista de identificadores de residentes que se deben cargar.

  AddResidents(this.listResidents);
}

// Evento para solicitar la carga de una nueva página de ubicaciones, utilizando el número de página actual para determinar la próxima carga.
class AddNextPageOfLocationBloc extends LocationEvent {
  final int currentPage; // Número de la página actual, utilizado para cargar la siguiente página de ubicaciones.

  AddNextPageOfLocationBloc(this.currentPage);
}

// Evento para indicar si se están requiriendo más datos, útil para gestionar estados de carga y actualizar la UI.
class IsRequeringData extends LocationEvent {
  final bool isRequeringData; // Booleano que indica si se están solicitando datos activamente.

  IsRequeringData(this.isRequeringData);
}
