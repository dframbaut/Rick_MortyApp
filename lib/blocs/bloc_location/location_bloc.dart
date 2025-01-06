import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domine/entities/character.dart';
import '../../domine/entities/location.dart';
import '../../infrastructure/datasource_imp/datasource_imp_rick_and_morty.dart';
import '../../utils/utils.dart';

part 'location_event.dart';
part 'location_state.dart';

// Bloc para manejar estados y eventos relacionados con las ubicaciones en la aplicación.
class LocationBloc extends Bloc<LocationEvent, LocationsState> {
  LocationBloc() : super(const LocationsState()) {
    // Manejador del evento de inicialización para cargar ubicaciones iniciales.
    on<InitLocationBloc>((event, emit) async{
      final List<Location> locations = await DataSourceImpRickAndMorty().getLocation(1);
      emit(state.copyWith(locationsList: locations));
    });

    // Manejador del evento para agregar residentes a una ubicación específica.
    on<AddResidents>((event, emit) async{
      final List<int> listIdResidents = extractIdsFromUrls(event.listResidents);
      final List<Character> residents = await DataSourceImpRickAndMorty().getResidents(listIdResidents);
      emit(state.copyWith(residents: residents));
    });
    
    // Manejador del evento para cargar más ubicaciones al alcanzar la siguiente página.
    on<AddNextPageOfLocationBloc>((event, emit) async{
      final List<Location> location = await DataSourceImpRickAndMorty().getLocation(event.currentPage);
      emit(state.copyWith(locationsList: [...state.locationsList ?? [], ...location], currentPage: event.currentPage));
    });
    
    // Manejador del evento para actualizar el estado de requerimiento de datos.
    on<IsRequeringData>((event, emit) async{                
      emit(state.copyWith(isRequeringData: event.isRequeringData));
    });
  }
}
