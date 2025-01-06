// Importaciones necesarias para el manejo de estado y eventos con Bloc, comparaciones de estado con Equatable, y estructuras de datos del dominio y acceso a datos.
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domine/entities/character.dart';
import '../../infrastructure/datasource_imp/datasource_imp_rick_and_morty.dart';

// Incluye definiciones de eventos y estados relacionados con el manejo de personajes en la aplicación.
part 'characters_event.dart';
part 'characters_state.dart';

// Bloc para manejar los estados y eventos de los personajes en la aplicación.
class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(const CharactersState()) {
    // Inicialización del Bloc cargando personajes desde una fuente de datos.
    on<InitCharacterBloc>((event, emit) async {
      final List<Character> characters = await DataSourceImpRickAndMorty().getCharacter(1);
      emit(state.copyWith(characterList: characters));
    });

    // Agrega personajes al estado actual desde una página específica.
    on<AddNextPageOfCharactersBloc>((event, emit) async {
      final List<Character> characters = await DataSourceImpRickAndMorty().getCharacter(event.currentPage);
      emit(state.copyWith(
          characterList: [...state.characterList ?? [], ...characters],
          currentPage: event.currentPage));
    });

    // Maneja la actualización del estado de requerimiento de datos.
    on<IsRequeringData>((event, emit) {
      emit(state.copyWith(isRequeringData: event.isRequeringData));
    });
  }
}
