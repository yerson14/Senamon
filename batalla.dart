import 'dart:math';
import 'entrenador.dart';
import 'senamon.dart';

// Función para iniciar una batalla entre los entrenadores
void iniciarBatalla(List<Entrenador> entrenadores, List<Senamon> senamones) {
  Random random = Random();
  print('Iniciando batalla...');
  
  // Simulación de lanzamiento de moneda para determinar quién inicia
  bool quienInicia = random.nextBool();
  print(quienInicia ? 'El primer entrenador inicia.' : 'El segundo entrenador inicia.');

  // Aquí puedes agregar la lógica específica para la batalla
}

// Función para mostrar el entrenador que más batallas ha ganado
void mostrarEstadisticas(List<Entrenador> entrenadores) {
  Entrenador ganador = entrenadores.reduce((a, b) => a.batallasGanadas > b.batallasGanadas ? a : b);
  print('Jugador que más batallas ha ganado: ${ganador.nombre}');
}
