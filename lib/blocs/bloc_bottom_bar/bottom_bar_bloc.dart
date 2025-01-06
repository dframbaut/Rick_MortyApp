// Importación de las librerías necesarias para el Bloc, Equatable para comparaciones de estado, y elementos de interfaz de usuario de Flutter.
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// Parte de las declaraciones para organizar el código relacionado con el BottomBarBloc.
// Estos archivos deben contener la definición de eventos y estados utilizados por BottomBarBloc.
part 'bottom_bar_event.dart';
part 'bottom_bar_state.dart';

// Definición del Bloc BottomBarBloc que gestiona el estado de una barra de navegación inferior.
class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState> {
  // Constructor de BottomBarBloc, inicializando el estado inicial con BottomBarState().
  BottomBarBloc() : super(const BottomBarState()) {
    // Registro del evento ChangeIndex. Cuando se recibe este evento, el Bloc emitirá un nuevo estado.
    on<ChangeIndex>((event, emit) {
      // Emite un nuevo estado con el índice de página actualizado según el evento recibido.
      emit(state.copywith(pageIndex: event.pageIndex));
    });
  }
}
