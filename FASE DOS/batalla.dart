import 'dart:math';
import 'dart:io';
import '../entrenador.dart';
import '../senamon.dart';

void prepararBatalla(List<Entrenador> entrenadores) {
  print('Preparación para la batalla');
  bool resultado = lanzarMoneda();

  Entrenador primerEntrenador = resultado ? entrenadores[0] : entrenadores[1];
  Entrenador segundoEntrenador = resultado ? entrenadores[1] : entrenadores[0];
  print('${primerEntrenador.nombre} seleccionará primero sus Senamones.');

  // Pasar 1 para obtener los Senamones predeterminados del primer entrenador
  List<Senamon> senamonesDisponibles1 = getSenamonesPredeterminados(1);
  seleccionarSenamones(primerEntrenador, senamonesDisponibles1);

  print('${segundoEntrenador.nombre} seleccionará ahora sus Senamones.');

  // Pasar 2 para obtener los Senamones predeterminados del segundo entrenador
  List<Senamon> senamonesDisponibles2 = getSenamonesPredeterminados(2);
  seleccionarSenamones(segundoEntrenador, senamonesDisponibles2);

  iniciarBatalla(entrenadores);
}
void seleccionarSenamones(Entrenador entrenador, List<Senamon> senamonesDisponibles) {
  List<Senamon> senamonesSeleccionados = [];
  print('${entrenador.nombre}, debes seleccionar 5 Senamones.');

  while (senamonesSeleccionados.length < 5) {
    mostrarSenamonesDisponibles(senamonesDisponibles);
    print('Selecciona el número del Senamon que quieres (${senamonesSeleccionados.length + 1}/5):');
    String? input = stdin.readLineSync();
    int? indice = int.tryParse(input ?? '');

    if (indice != null && indice >= 0 && indice < senamonesDisponibles.length) {
      Senamon senamonElegido = senamonesDisponibles[indice];
      senamonesSeleccionados.add(senamonElegido);
      senamonesDisponibles.removeAt(indice);  // Elimina el Senamon de la lista disponible
      print('Has seleccionado a ${senamonElegido.nombre}.');
    } else {
      print('Selección no válida. Por favor elige un número de la lista.');
    }
  }
  
  entrenador.senamones = senamonesSeleccionados;
  print('${entrenador.nombre} ha seleccionado sus 5 Senamones:');
  for (var senamon in senamonesSeleccionados) {
    print('- ${senamon.nombre}');
  }
}

void mostrarSenamonesDisponibles(List<Senamon> senamones) {
  print('\nLista de Senamones disponibles:');
  for (int i = 0; i < senamones.length; i++) {
    print('$i: ${senamones[i].nombre} (Tipo: ${senamones[i].tipo})');
  }
}


void mostrarSenamonesPredeterminados(List<Senamon> senamones) {
  print('\nLista de Senamones disponibles:');
  for (int i = 0; i < senamones.length; i++) {
    print('$i: ${senamones[i].nombre} (Tipo: ${senamones[i].tipo})');
  }
}

void iniciarBatalla(List<Entrenador> entrenadores) {
  Entrenador entrenador1 = entrenadores[0];
  Entrenador entrenador2 = entrenadores[1];
  print('\n¡Comienza la batalla entre ${entrenador1.nombre} y ${entrenador2.nombre}!');

  bool resultado = lanzarMoneda();
  Entrenador atacante = resultado ? entrenador1 : entrenador2;
  Entrenador defensor = resultado ? entrenador2 : entrenador1;

  int senamonesDerrotadosAtacante = 0;
  int senamonesDerrotadosDefensor = 0;

  while (senamonesDerrotadosAtacante < 3 && senamonesDerrotadosDefensor < 3) {
    print('\nTurno de ${atacante.nombre}');
    
    // Mostrar salud de los Senamones
    Senamon senamonAtacante = obtenerSenamonActivo(atacante);
    Senamon senamonDefensor = obtenerSenamonActivo(defensor);
    print('${senamonAtacante.nombre}: Salud ${senamonAtacante.puntosSalud}');
    print('${senamonDefensor.nombre}: Salud ${senamonDefensor.puntosSalud}');
    
    // Opciones de atacar o cambiar Senamon
    print('Elige una opción: 1. Atacar 2. Cambiar Senamon');
    String? opcion = stdin.readLineSync();

    if (opcion == '1') {
      // Realizar el ataque
      int danio = senamonAtacante.nivelAtaque; // Usar getter
      senamonDefensor.puntosSalud -= danio; // Usar setter
      print('${senamonAtacante.nombre} atacó a ${senamonDefensor.nombre} e infligió $danio de daño.');
      if (senamonDefensor.puntosSalud <= 0) {
        print('${senamonDefensor.nombre} ha sido derrotado.');
        senamonesDerrotadosDefensor++;
        if (senamonesDerrotadosDefensor < 3) {
          cambiarSenamon(defensor);
        }
      } else {
        print('${senamonDefensor.nombre} tiene ${senamonDefensor.puntosSalud} puntos de salud restantes.');
      }
    } else if (opcion == '2') {
      // Cambiar Senamon
      cambiarSenamon(atacante);
    } else {
      print('Opción no válida. Pierdes el turno.');
    }

    // Cambiar de turno
    Entrenador temp = atacante;
    atacante = defensor;
    defensor = temp;
  }

  if (senamonesDerrotadosAtacante >= 3) {
    print('${defensor.nombre} ha ganado la batalla.');
  } else {
    print('${atacante.nombre} ha ganado la batalla.');
  }
}


Senamon obtenerSenamonActivo(Entrenador entrenador) {
  return entrenador.senamones.firstWhere((s) => s.puntosSalud > 0);
}

void cambiarSenamon(Entrenador entrenador) {
  print('${entrenador.nombre}, selecciona otro Senamon que tenga vida mayor a 0:');
  for (int i = 0; i < entrenador.senamones.length; i++) {
    Senamon senamon = entrenador.senamones[i];
    if (senamon.puntosSalud > 0) {
      print('$i: ${senamon.nombre} (Salud: ${senamon.puntosSalud})');
    }
  }

  String? seleccion = stdin.readLineSync();
  int indice = int.tryParse(seleccion ?? '') ?? -1;

  if (indice >= 0 && indice < entrenador.senamones.length && entrenador.senamones[indice].puntosSalud > 0) {
    print('${entrenador.nombre} ha seleccionado a ${entrenador.senamones[indice].nombre}.');
  } else {
    print('Selección inválida.');
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

bool lanzarMoneda() {
  print('Lanzando una moneda para decidir quién elige primero...');
  bool resultado = Random().nextBool();
  print(resultado ? '¡Ha salido cara!' : '¡Ha salido cruz!');
  return resultado;
}