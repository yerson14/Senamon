import 'dart:io';
import 'entrenador.dart';
import 'senamon.dart';
import 'batalla.dart';


void main() {
  List<Entrenador> entrenadores = [];
  print('Bienvenido al mundo Senamon');
  print("*" * 30);

  List<Entrenador> entrenadoresPredeterminados = getEntrenadoresPredeterminados();

  for (int i = 0; i < 2; i++) {
    print('Entrenador ${i + 1}:');
    print('Selecciona un entrenador predeterminado:');
    for (int j = 0; j < entrenadoresPredeterminados.length; j++) {
      print('${j + 1}. ${entrenadoresPredeterminados[j].nombre}');
    }
    
    int seleccion = -1;
    while (seleccion < 0 || seleccion >= entrenadoresPredeterminados.length) {
      print('Ingresa el número del entrenador que deseas seleccionar:');
      seleccion = int.parse(stdin.readLineSync()!) - 1;
      if (seleccion < 0 || seleccion >= entrenadoresPredeterminados.length) {
        print('Selección inválida. Por favor, elige un número válido.');
      }
    }
    
    entrenadores.add(entrenadoresPredeterminados[seleccion]);
    entrenadoresPredeterminados.removeAt(seleccion);
    
    print('Has seleccionado a ${entrenadores[i].nombre}');
    print("*" * 30);
  }

  if (entrenadores.isNotEmpty) {
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
          prepararBatalla(entrenadores);
          break;
        case '2':
          entrenarSenamones(entrenadores);
          break;
        case '3':
          mostrarEstadisticas(entrenadores);
          break;
        case '4':
          reemplazarSenamonMenu(entrenadores);
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

  // Asignar Senamones predeterminados al nuevo entrenador
  List<Senamon> senamones =
      getSenamonesPredeterminados(entrenadores.length + 1);

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

void seleccionarSenamonInicial(List<Entrenador> entrenadores) {
  for (int i = 0; i < entrenadores.length; i++) {
    Entrenador entrenador = entrenadores[i];
    print('Entrenador ${entrenador.nombre}, selecciona tu Senamon inicial:');
    for (int j = 0; j < entrenador.senamones.length; j++) {
      print('$j: ${entrenador.senamones[j].nombre}');
    }
    String? eleccion = stdin.readLineSync();
    int indice = int.tryParse(eleccion!) ?? -1;
    if (indice >= 0 && indice < entrenador.senamones.length) {
      print(
          '${entrenador.nombre} ha seleccionado a ${entrenador.senamones[indice].nombre} como Senamon inicial.');
    } else {
      print('Selección inválida.');
    }
    print("*" * 30);
  }
}

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

void reemplazarSenamonMenu(List<Entrenador> entrenadores) {
  print('Selecciona el entrenador (1 o 2):');
  int entrenadorIndex = int.tryParse(stdin.readLineSync()!)! - 1;
  if (entrenadorIndex < 0 || entrenadorIndex >= entrenadores.length) {
    print('Entrenador inválido.');
    return;
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
}

void reemplazarSenamon(
    Entrenador entrenador, int indice, Senamon nuevoSenamon) {
  if (indice < 0 || indice >= entrenador.senamones.length) {
    print('Índice inválido.');
    return;
  }
  entrenador.senamones[indice] = nuevoSenamon;
  print(
      'Senamon en la posición $indice reemplazado con ${nuevoSenamon.nombre}.');
}

void crearSenamon(Entrenador entrenador){
  print("Ingrese el nombre del senamon");
  String nombre = stdin.readLineSync()!;
  print("Ingrese el peso del senamon");
  double peso = double.parse(stdin.readLineSync()!);
  print("Ingrese el tipo de Senamon");
  List<String> tipos = ["fuego", "agua", "hierba", "volador", "eléctrico"];
  for (var i = 0; i < tipos.length; i++) {
    print("${i + 1}. ${tipos[i]}");
  }
  print("Ingrese el número del tipo de senamon que desea seleccionar");
  int posicionTipo = int.parse(stdin.readLineSync()!);
  do {
    if (posicionTipo <= 0 || posicionTipo > tipos.length) {
      print("Ingrese un número que esté dentro de la lista");
      posicionTipo = int.parse(stdin.readLineSync()!);
    }
  } while (posicionTipo <= 0 || posicionTipo > tipos.length);
  print("Ingrese la vida que tendrá el senamon");
  int salud = int.parse(stdin.readLineSync()!);
  do {
    if (salud < 0 || salud > 1000) {
      print("Ingrese un número entre 1 y 1000");
      salud = int.parse(stdin.readLineSync()!);
    }
  } while (salud < 0 || salud > 1000);
  print("Ingrese el daño que tendrá el senamon");
  int ataque = int.parse(stdin.readLineSync()!);
  do {
    if (ataque < 0 || ataque > 1000) {
      print("Ingrese un número entre 1 y 1000");
      ataque = int.parse(stdin.readLineSync()!);
    }
  } while (ataque < 0 || ataque > 1000);
  print("Ingrese el nivel del senamon");
  int nivel = int.parse(stdin.readLineSync()!);
  print("Ingrese la fase en la que está el Senamon");
  String fase = stdin.readLineSync()!;
  print("Ingrese el nivel de energía que tiene el Senamon");
  int energia = int.parse(stdin.readLineSync()!);
  do {
    if (energia < 0 || energia > 100) {
      print("Ingrese un número entre 1 y 100");
      energia = int.parse(stdin.readLineSync()!);
    }
  } while (energia < 0 || energia > 100);
}
