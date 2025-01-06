// Importaciones necesarias para el manejo de estado con Bloc, comparaciones de estado con Equatable, y acceso a datos de dominio.
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domine/entities/character.dart';
import '../../domine/entities/epidode.dart';
import '../../infrastructure/datasource_imp/datasource_imp_rick_and_morty.dart';
import '../../utils/utils.dart';

// Declaraciones de las partes del Bloc para manejar eventos y estados de episodios.
part 'episodes_event.dart';
part 'episodes_state.dart';

// Bloc que gestiona los estados y eventos relacionados con episodios de una serie.
class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  EpisodesBloc() : super(const EpisodesState()) {
    // Inicializa y carga episodios desde la fuente de datos al recibir el evento de inicio.
    on<InitEpisodesBloc>((event, emit) async {
      final List<Episode> episodes = await DataSourceImpRickAndMorty().getEpisode(1);
      emit(state.copyWith(episodesList: episodes));
    });

    // Añade personajes de un episodio al estado cuando se recibe el evento correspondiente.
    on<AddCharacterOfEpisodeEvent>((event, emit) async {
      final List<int> listIdResidents = extractIdsFromUrls(event.listCharactersOfEpisode);
      final List<Character> characterInEpisode = await DataSourceImpRickAndMorty().getResidents(listIdResidents);
      emit(state.copyWith(characterInEpisode: characterInEpisode));
    });

    // Carga más episodios al estado actual al avanzar a la siguiente página.
    on<AddNextPageOfEpisodesBloc>((event, emit) async {
      final List<Episode> episode = await DataSourceImpRickAndMorty().getEpisode(event.currentPage);
      emit(state.copyWith(episodesList: [...state.episodesList ?? [], ...episode], currentPage: event.currentPage));
    });

    // Actualiza el estado de requerimiento de datos en el sistema.
    on<IsRequeringData>((event, emit) async {
      emit(state.copyWith(isRequeringData: event.isRequeringData));
    });
  }
}
