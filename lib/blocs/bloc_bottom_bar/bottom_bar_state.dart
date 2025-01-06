// Indica que este archivo es parte de 'bottom_bar_bloc.dart', lo que sugiere que este estado es manejado por BottomBarBloc.
part of 'bottom_bar_bloc.dart';

// Define el estado de la barra de navegación inferior utilizando Equatable para facilitar la comparación de estados.
class BottomBarState extends Equatable {
  // Propiedad inmutable que guarda el índice de la página activa.
  final int pageIndex;

  // Constructor constante con un valor predeterminado para pageIndex.
  const BottomBarState({this.pageIndex = 0});

  // Método para crear una nueva instancia del estado con un nuevo pageIndex si se proporciona.
  BottomBarState copywith({    
    final int? pageIndex
  }) => BottomBarState(
    pageIndex: pageIndex ?? this.pageIndex
  );

  // Lista de propiedades que se utilizarán para determinar si dos instancias son iguales.
  @override
  List<Object> get props => [pageIndex];
}
