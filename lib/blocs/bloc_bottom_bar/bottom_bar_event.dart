// Forma parte del archivo 'bottom_bar_bloc.dart', lo que indica que está relacionado y dependiente de la definición del Bloc.
part of 'bottom_bar_bloc.dart';

// Anotación para asegurar que las instancias de eventos no sean modificables una vez creadas.
@immutable
abstract class BottomBarEvent{}

// Clase concreta de evento que extiende BottomBarEvent para cambiar el índice activo en la barra de navegación.
class ChangeIndex extends BottomBarEvent {
  // Propiedad final que almacena el índice de la página a la que se debe cambiar.
  final int pageIndex;
  
  // Constructor que inicializa el índice de la página.
  ChangeIndex(this.pageIndex);
}
