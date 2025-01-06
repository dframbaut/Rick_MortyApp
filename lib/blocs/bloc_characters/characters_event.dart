// Este archivo forma parte del 'characters_bloc.dart', conteniendo las definiciones de los eventos que se pueden lanzar dentro del Bloc para la gestión de personajes.
part of 'characters_bloc.dart';

// Clase abstracta base para todos los eventos relacionados con los personajes, usada para definir una interfaz común para todos los eventos en este Bloc.
abstract class CharactersEvent {}

// Evento específico para inicializar y cargar los datos iniciales en el CharactersBloc.
class InitCharacterBloc extends CharactersEvent {
  InitCharacterBloc();
}

// Evento para indicar que se deben agregar nuevos ítems a la lista actual de personajes, como cuando se actualiza la lista.
class AddNewItems extends CharactersEvent {
  AddNewItems();
}

// Evento para realizar una búsqueda específica dentro de los datos de personajes disponibles.
class SearchEvent extends CharactersEvent {
}

// Evento para solicitar la carga de una nueva página de personajes basada en el número de página actual.
class AddNextPageOfCharactersBloc extends CharactersEvent {
  final int currentPage; // Almacena el número de página actual para saber qué página cargar a continuación.

  AddNextPageOfCharactersBloc(this.currentPage);
}

// Evento que se dispara para actualizar el estado de la aplicación sobre si se están requiriendo más datos, útil para mostrar indicadores de carga.
class IsRequeringData extends CharactersEvent {
  final bool isRequeringData; // Booleano que indica si actualmente se están requiriendo más datos.

  IsRequeringData(this.isRequeringData);
}
