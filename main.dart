import 'dart:io';
import 'entrenador.dart';
import 'senamon.dart';
import 'batalla.dart';

void main() {
  List<Entrenador> entrenadores = [];
  List<Senamon> senamones = getSenamonesPredeterminados();

  print('Bienvenido al mundo Senamon');
  print("*" * 30);

  // Crear o cargar entrenadores
  for (int i = 0; i < 2; i++) {
    print('Entrenador ${i + 1}:');
    print('¿Ya tienes un entrenador? (sí/no)');
    String? tieneEntrenador = stdin.readLineSync()?.toLowerCase();

    if (tieneEntrenador == 'no') {
      // Crear un nuevo entrenador
      crearEntrenador(entrenadores);
    } else if (tieneEntrenador == 'sí') {
      // Armar el equipo del entrenador con Senamones disponibles
      print('Por favor, arma tu equipo de Senamones.');
      armarEquipo(entrenadores, senamones);
    } else {
      print('Opción no válida, por favor, responde "sí" o "no".');
      i--; // Repetir el ciclo para el mismo entrenador
    }

    print("*" * 30);
  }

  // Selección de Senamones para iniciar la batalla
  seleccionarSenamonInicial(entrenadores);

  // Menú de opciones para iniciar batalla o mostrar estadísticas
  while (true) {
    print('\n1. Iniciar batalla');
    print('2. Mostrar estadísticas');
    print('3. Salir');
    print('Selecciona una opción:');
    
    String? opcion = stdin.readLineSync();
    
    switch (opcion) {
      case '1':
        iniciarBatalla(entrenadores, senamones);
        break;
      case '2':
        mostrarEstadisticas(entrenadores);
        break;
      case '3':
        exit(0);
      default:
        print('Opción no válida.');
    }

    print("*" * 30);
  }
}

// Función para crear un nuevo entrenador
void crearEntrenador(List<Entrenador> entrenadores) {
  print('Ingrese el nombre del entrenador:');
  String? nombre = stdin.readLineSync();

  print('Ingrese el email del entrenador:');
  String? email = stdin.readLineSync();

  print('Ingrese la fecha de nacimiento (formato: yyyy-mm-dd):');
  DateTime? fechaNacimiento;
  while (fechaNacimiento == null) {
    try {
      fechaNacimiento = DateTime.parse(stdin.readLineSync()!);
    } catch (e) {
      print('Fecha inválida. Inténtalo de nuevo (formato: yyyy-mm-dd):');
    }
  }

  // Inicializar el equipo con Senamones vacíos
  List<Senamon> senamones = List.filled(5, Senamon(
    nombre: '', nivel: 0, tipo: '', peso: 0.0, puntosSalud: 0, nivelAtaque: 0,
    fase: '', nivelEnergia: 0, descripcion: '',
  ));
  
  entrenadores.add(Entrenador(
    nombre: nombre!,
    email: email!,
    fechaNacimiento: fechaNacimiento,
    experiencia: 0,
    batallasGanadas: 0,
    senamones: senamones,
  ));

  print('Entrenador creado exitosamente.');
  print("*" * 30);
}

// Función para armar el equipo del entrenador con Senamones disponibles
void armarEquipo(List<Entrenador> entrenadores, List<Senamon> senamones) {
  Entrenador entrenador = entrenadores.last;

  for (int i = 0; i < 5; i++) {
    print('Selecciona el tipo de Senamon para la posición ${i + 1}:');
    mostrarTiposSenamones(senamones);
    
    String? tipo = stdin.readLineSync()?.toLowerCase();
    List<Senamon> senamonesTipo = senamones.where((s) => s.tipo.toLowerCase() == tipo).toList();

    if (senamonesTipo.isEmpty) {
      print('Tipo inválido o no hay Senamones de este tipo. Intenta de nuevo.');
      i--; // Repetir la selección para la misma posición
      continue;
    }

    print('Elige un Senamon del tipo $tipo para la posición ${i + 1}:');
    mostrarSenamonesDisponibles(senamonesTipo);

    String? eleccion = stdin.readLineSync();
    int indice = int.tryParse(eleccion!) ?? -1;

    if (indice >= 0 && indice < senamonesTipo.length) {
      entrenador.senamones[i] = senamonesTipo[indice];
      print('Senamon ${senamonesTipo[indice].nombre} añadido a la posición ${i + 1}.');
    } else {
      print('Elección inválida.');
      i--; // Repetir la selección para la misma posición
    }

    print("*" * 30);
  }
}

// Función para mostrar los tipos de Senamones disponibles
void mostrarTiposSenamones(List<Senamon> senamones) {
  Set<String> tipos = senamones.map((s) => s.tipo).toSet();
  for (String tipo in tipos) {
    print(tipo);
  }
  print("*" * 30);
}

// Función para mostrar los Senamones disponibles de un tipo específico
void mostrarSenamonesDisponibles(List<Senamon> senamones) {
  for (int i = 0; i < senamones.length; i++) {
    print('$i: ${senamones[i].nombre} (${senamones[i].tipo})');
  }
  print("*" * 30);
}

// Función para seleccionar el Senamon inicial para la batalla
void seleccionarSenamonInicial(List<Entrenador> entrenadores) {
  for (int i = 0; i < entrenadores.length; i++) {
    print('Entrenador ${i + 1}, selecciona tu Senamon inicial para la batalla:');
    mostrarSenamonesDisponibles(entrenadores[i].senamones);

    String? eleccion = stdin.readLineSync();
    int indice = int.tryParse(eleccion!) ?? -1;

    if (indice >= 0 && indice < entrenadores[i].senamones.length) {
      entrenadores[i].senamones[indice] = entrenadores[i].senamones[indice];
      print('Senamon inicial seleccionado: ${entrenadores[i].senamones[indice].nombre}');
    } else {
      print('Elección inválida. Selecciona de nuevo.');
      i--; // Repetir la selección para el mismo entrenador
    }

    print("*" * 30);
  }
}

// Función para iniciar la batalla
void iniciarBatalla(List<Entrenador> entrenadores, List<Senamon> senamones) {
  print('¡La batalla está por comenzar!');
  print('*' * 30);
  print('1. Atacar');
  print('2. Huir');
  print('3. Mostrar estado de los Senamones');
  print('Selecciona una opción:');
  
  String? opcion = stdin.readLineSync();
  
  switch (opcion) {
    case '1':
      print('Elige el Senamon atacante:');
      seleccionarSenamonParaAccion(entrenadores, senamones, 'atacar');
      break;
    case '2':
      print('Has decidido huir de la batalla.');
      break;
    case '3':
      mostrarEstadoSenamones(entrenadores);
      break;
    default:
      print('Opción no válida.');
  }

  print('*' * 30);
}

// Función para seleccionar el Senamon para una acción específica (ataque, huir, etc.)
void seleccionarSenamonParaAccion(List<Entrenador> entrenadores, List<Senamon> senamones, String accion) {
  for (int i = 0; i < entrenadores.length; i++) {
    print('Entrenador ${i + 1}, elige el Senamon para $accion:');
    mostrarSenamonesDisponibles(entrenadores[i].senamones);

    String? eleccion = stdin.readLineSync();
    int indice = int.tryParse(eleccion!) ?? -1;

    if (indice >= 0 && indice < entrenadores[i].senamones.length) {
      Senamon senamonSeleccionado = entrenadores[i].senamones[indice];
      print('Senamon ${senamonSeleccionado.nombre} seleccionado para $accion.');
      // Aquí se debería llamar al método correspondiente para realizar la acción
    } else {
      print('Elección inválida.');
      i--; // Repetir la selección para el mismo entrenador
    }

    print('*' * 30);
  }
}

// Función para mostrar el estado de los Senamones
void mostrarEstadoSenamones(List<Entrenador> entrenadores) {
  for (int i = 0; i < entrenadores.length; i++) {
    print('Estado del equipo del Entrenador ${i + 1}:');
    for (Senamon senamon in entrenadores[i].senamones) {
      print('Nombre: ${senamon.nombre}, Salud: ${senamon.puntosSalud}, Ataque: ${senamon.nivelAtaque}');
    }
    print("*" * 30);
  }
}
