import 'dart:io';

import 'entrenador.dart';
import 'senamon.dart';
import 'batalla.dart';

// Función principal
void main() {
  List<Entrenador> entrenadores = [];

  print('Bienvenido al mundo Senamon');
  print("*" * 30);

  for (int i = 0; i < 2; i++) {
    print('Entrenador ${i + 1}:');
    print('¿Ya tienes un entrenador? (si/no)');
    String? tieneEntrenador = stdin.readLineSync()?.trim().toLowerCase();

    if (tieneEntrenador == 'no') {
      crearEntrenador(entrenadores);
    } else if (tieneEntrenador == 'si') {
      entrenadores = getEntrenadoresPredeterminados();

      print('Entrenadores guardados:');
      for (int j = 0; j < entrenadores.length; j++) {
        print('Entrenador ${j + 1}: ${entrenadores[j].nombre}');
        print('Email: ${entrenadores[j].email}');
        print('Fecha de Nacimiento: ${entrenadores[j].fechaNacimiento}');
        print('Experiencia: ${entrenadores[j].experiencia}');
        print('Batallas Ganadas: ${entrenadores[j].batallasGanadas}');
        print("*" * 30);
      }

      break;
    } else {
      print('Opción no válida, por favor, responde "sí" o "no".');
      i--; // Decrementa el contador para repetir la pregunta
    }
  }

  if (entrenadores.isNotEmpty) {
    seleccionarSenamonInicial(entrenadores);

    while (true) {
      print('\n1. Iniciar batalla');
      print('2. Entrenar Senamon');
      print('3. Mostrar estadísticas');
      print('4. Reemplazar Senamon');
      print('5. Salir');
      print('Selecciona una opción:');

      String? opcion = stdin.readLineSync();

      switch (opcion) {
        case '1':
          iniciarBatalla(entrenadores);
          break;
        case '2':
          entrenarSenamones(entrenadores);
          break;
        case '3':
          mostrarEstadisticas(entrenadores);
          break;
        case '4':
          print('Selecciona el entrenador (1 o 2):');
          int entrenadorIndex = int.tryParse(stdin.readLineSync()!)! - 1;
          if (entrenadorIndex < 0 || entrenadorIndex >= entrenadores.length) {
            print('Entrenador inválido.');
            break;
          }

          print('Selecciona la posición del Senamon a reemplazar (0-4):');
          int senamonIndex = int.tryParse(stdin.readLineSync()!)!;

          print('Ingrese el nombre del nuevo Senamon:');
          String? nombre = stdin.readLineSync();

          print('Ingrese el nivel del nuevo Senamon:');
          int nivel = int.tryParse(stdin.readLineSync()!)!;

          print('Ingrese el tipo del nuevo Senamon:');
          String? tipo = stdin.readLineSync();

          print('Ingrese el peso del nuevo Senamon:');
          double peso = double.tryParse(stdin.readLineSync()!)!;

          print('Ingrese los puntos de salud del nuevo Senamon:');
          int puntosSalud = int.tryParse(stdin.readLineSync()!)!;

          print('Ingrese el nivel de ataque del nuevo Senamon:');
          int nivelAtaque = int.tryParse(stdin.readLineSync()!)!;

          print('Ingrese la fase del nuevo Senamon:');
          String? fase = stdin.readLineSync();

          print('Ingrese el nivel de energía del nuevo Senamon:');
          int nivelEnergia = int.tryParse(stdin.readLineSync()!)!;

          print('Ingrese la descripción del nuevo Senamon:');
          String? descripcion = stdin.readLineSync();

          Senamon nuevoSenamon = Senamon(
            nombre: nombre!,
            nivel: nivel,
            tipo: tipo!,
            peso: peso,
            puntosSalud: puntosSalud,
            nivelAtaque: nivelAtaque,
            fase: fase!,
            nivelEnergia: nivelEnergia,
            descripcion: descripcion!,
          );

          reemplazarSenamon(entrenadores[entrenadorIndex], senamonIndex, nuevoSenamon);
          break;
        case '5':
          exit(0);
        default:
          print('Opción no válida.');
      }

      print("*" * 30);
    }
  } else {
    print('No se han cargado entrenadores.');
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

// Función para que los entrenadores seleccionen su Senamon inicial
void seleccionarSenamonInicial(List<Entrenador> entrenadores) {
  for (Entrenador entrenador in entrenadores) {
    print('Entrenador ${entrenador.nombre}, selecciona tu Senamon inicial:');
    for (int i = 0; i < entrenador.senamones.length; i++) {
      print('$i: ${entrenador.senamones[i].nombre}');
    }

    String? eleccion = stdin.readLineSync();
    int indice = int.tryParse(eleccion!) ?? -1;

    if (indice >= 0 && indice < entrenador.senamones.length) {
      print('${entrenador.nombre} ha seleccionado a ${entrenador.senamones[indice].nombre} como Senamon inicial.');
    } else {
      print('Selección inválida.');
    }

    print("*" * 30);
  }
}

// Función para entrenar los Senamones
void entrenarSenamones(List<Entrenador> entrenadores) {
  for (Entrenador entrenador in entrenadores) {
    print('Entrenador ${entrenador.nombre}, elige un Senamon para entrenar:');
    for (int i = 0; i < entrenador.senamones.length; i++) {
      print('$i: ${entrenador.senamones[i].nombre}');
    }

    String? eleccion = stdin.readLineSync();
    int indice = int.tryParse(eleccion!) ?? -1;

    if (indice >= 0 && indice < entrenador.senamones.length) {
      print('¿Qué deseas mejorar? (1. Ataque, 2. Salud)');
      String? mejora = stdin.readLineSync();

      print('¿Cuántos puntos quieres añadir?');
      String? puntos = stdin.readLineSync();
      int cantidad = int.tryParse(puntos!) ?? 0;

      bool esAtaque = mejora == '1';
      entrenador.entrenarSenamon(indice, cantidad, esAtaque);
    } else {
      print('Selección inválida.');
    }
  }
}

// Función para reemplazar un Senamon en la lista de un entrenador
void reemplazarSenamon(Entrenador entrenador, int indice, Senamon nuevoSenamon) {
  if (indice < 0 || indice >= entrenador.senamones.length) {
    print('Índice inválido.');
    return;
  }

  entrenador.senamones[indice] = nuevoSenamon;
  print('Senamon en la posición $indice reemplazado con ${nuevoSenamon.nombre}.');
}