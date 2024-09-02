import 'dart:math';
import 'entrenador.dart';
import 'senamon.dart';
void iniciarBatalla(List<Entrenador> entrenadores) {
  Entrenador entrenador1 = entrenadores[0];
  Entrenador entrenador2 = entrenadores[1];

  print('Lanzando una moneda para decidir quién comienza la batalla...');
  bool turnoEntrenador1 = Random().nextBool();

  Entrenador atacante = turnoEntrenador1 ? entrenador1 : entrenador2;
  Entrenador defensor = turnoEntrenador1 ? entrenador2 : entrenador1;

  print('¡${atacante.nombre} inicia la batalla!');

  int senamonesDerrotadosAtacante = 0;
  int senamonesDerrotadosDefensor = 0;

  while (senamonesDerrotadosAtacante < 3 && senamonesDerrotadosDefensor < 3) {
    int i = Random().nextInt(5);

    Senamon senamonAtacante = atacante.senamones[i];
    Senamon senamonDefensor = defensor.senamones[i];

    print('${atacante.nombre} ataca con ${senamonAtacante.nombre}!');
    int danio = senamonAtacante.nivelAtaque;
    senamonDefensor.puntosSalud -= danio;

    if (senamonDefensor.puntosSalud <= 0) {
      print('${senamonDefensor.nombre} ha sido derrotado.');
      senamonesDerrotadosDefensor++;
    } else {
      print('${senamonDefensor.nombre} tiene ${senamonDefensor.puntosSalud} puntos de salud restantes.');
    }

    if (senamonesDerrotadosDefensor < 3) {
      print('${defensor.nombre} contraataca con ${senamonDefensor.nombre}!');
      danio = senamonDefensor.nivelAtaque;
      senamonAtacante.puntosSalud -= danio;

      if (senamonAtacante.puntosSalud <= 0) {
        print('${senamonAtacante.nombre} ha sido derrotado.');
        senamonesDerrotadosAtacante++;
      } else {
        print('${senamonAtacante.nombre} tiene ${senamonAtacante.puntosSalud} puntos de salud restantes.');
      }
    }

    // Cambiar de turno
    Entrenador temp = atacante;
    atacante = defensor;
    defensor = temp;
  }

  if (senamonesDerrotadosAtacante >= 3) {
    defensor.batallasGanadas += 1;
    print('${defensor.nombre} ha ganado la batalla.');
  } else {
    atacante.batallasGanadas += 1;
    print('${atacante.nombre} ha ganado la batalla.');
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
