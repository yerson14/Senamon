import 'dart:math';
import 'entrenador.dart';

void iniciarBatalla(List<Entrenador> entrenadores) {
  Entrenador entrenador1 = entrenadores[0];
  Entrenador entrenador2 = entrenadores[1];

  print('Lanzando una moneda para decidir quién comienza la batalla...');
  bool turnoEntrenador1 = Random().nextBool();

  Entrenador atacante = turnoEntrenador1 ? entrenador1 : entrenador2;
  Entrenador defensor = turnoEntrenador1 ? entrenador2 : entrenador1;

  print('¡${atacante.nombre} inicia la batalla!');

  for (int i = 0; i < 5; i++) {
    int danio = atacante.senamones[i].nivelAtaque - defensor.senamones[i].puntosSalud;
    defensor.senamones[i].puntosSalud -= danio;
    if (defensor.senamones[i].puntosSalud <= 0) {
      print('${defensor.senamones[i].nombre} ha sido derrotado.');
      defensor.senamones[i].puntosSalud = 0;
    } else {
      print('${defensor.senamones[i].nombre} tiene ${defensor.senamones[i].puntosSalud} puntos de salud restantes.');
    }

    // Cambiar de turno
    Entrenador temp = atacante;
    atacante = defensor;
    defensor = temp;
  }

  if (entrenador1.senamones.every((senamon) => senamon.puntosSalud <= 0)) {
    entrenador2.batallasGanadas += 1;
    print('${entrenador2.nombre} ha ganado la batalla.');
  } else if (entrenador2.senamones.every((senamon) => senamon.puntosSalud <= 0)) {
    entrenador1.batallasGanadas += 1;
    print('${entrenador1.nombre} ha ganado la batalla.');
  } else {
    print('La batalla ha terminado en empate.');
  }
}

void mostrarEstadisticas(List<Entrenador> entrenadores) {
  for (Entrenador entrenador in entrenadores) {
    print('Entrenador: ${entrenador.nombre}');
    print('Batallas ganadas: ${entrenador.batallasGanadas}');
    print("*" * 30);
  }

  if (entrenadores[0].batallasGanadas > entrenadores[1].batallasGanadas) {
    print('${entrenadores[0].nombre} es el jugador que más batallas ha ganado.');
  } else if (entrenadores[1].batallasGanadas > entrenadores[0].batallasGanadas) {
    print('${entrenadores[1].nombre} es el jugador que más batallas ha ganado.');
  } else {
    print('Ambos jugadores han ganado la misma cantidad de batallas.');
  }
}