import 'senamon.dart';

class Entrenador {
  String nombre;
  String email;
  DateTime fechaNacimiento;
  int experiencia;
  int batallasGanadas;
  List<Senamon> senamones;

  Entrenador({
    required this.nombre,
    required this.email,
    required this.fechaNacimiento,
    this.experiencia = 0,
    this.batallasGanadas = 0,
    required this.senamones,
  });

  void entrenarSenamon(int indice, int cantidad, bool esAtaque) {
    if (indice < 0 || indice >= senamones.length) {
      print('Índice de Senamon inválido.');
      return;
    }

    int puntosRequeridos = (cantidad / 20).toInt();
    if (experiencia >= puntosRequeridos) {
      if (esAtaque) {
        senamones[indice].nivelAtaque += cantidad;
      } else {
        senamones[indice].puntosSalud += cantidad;
      }
      experiencia -= puntosRequeridos;
    } else {
      print('No tienes suficiente experiencia.');
    }
  }

  void reemplazarSenamon(int indice, Senamon nuevoSenamon) {
    if (indice < 0 || indice >= senamones.length) {
      print('Índice de Senamon inválido.');
      return;
    }
    senamones[indice] = nuevoSenamon;
    print('Senamon reemplazado con éxito.');
  }
}

List<Entrenador> getEntrenadoresPredeterminados() {
  return [
    Entrenador(
      nombre: 'María Paula',
      email: 'maria.paula@example.com',
      fechaNacimiento: DateTime(2007, 4, 23),
      experiencia: 200,
      batallasGanadas: 10,
      senamones: getSenamonesPredeterminados(1),
    ),
    Entrenador(
      nombre: 'Yerson Stiven ',
      email: 'yersonNegro@example.com',
      fechaNacimiento: DateTime(2006, 6, 12),
      experiencia: 150,
      batallasGanadas: 8,
      senamones: getSenamonesPredeterminados(2),
    ),
  ];
}
