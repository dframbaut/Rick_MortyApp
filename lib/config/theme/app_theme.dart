import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,  // Asegura que usas la última versión de los componentes de Material Design
    colorScheme: ColorScheme.dark(
      primary: Colors.green.shade700, // Un tono más oscuro de verde que es más adecuado para fondos oscuros
      secondary: Colors.tealAccent.shade700, // Un color secundario que complementa el primario
      error: Colors.red.shade400, // Color para indicaciones de errores, visible contra fondos oscuros
      surface: Colors.grey.shade800, // Color de superficies de componentes, como tarjetas
      background: Colors.grey.shade900, // Color de fondo general para pantallas
      onPrimary: Colors.black, // Color para texto e iconos sobre el color primario
      onSecondary: Colors.black, // Color para texto e iconos sobre el color secundario
      onSurface: Colors.white, // Color para texto e iconos sobre superficies
      onError: Colors.black, // Color para texto e iconos sobre errores
      onBackground: Colors.white, // Color de texto general contra el fondo
    ),
    brightness: Brightness.dark, // Usando el modo oscuro
    shadowColor: const Color.fromARGB(191, 12, 255, 49), // Color de sombras, más sutil con transparencia
    disabledColor: const Color.fromRGBO(150, 150, 150, 1) // Un gris medio para elementos deshabilitados
  );
}
