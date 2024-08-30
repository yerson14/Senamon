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

  // Método para entrenar un Senamon, incrementando ataque o salud
  void entrenarSenamon(int indice, int cantidad, bool esAtaque) {
    // Verificar que el índice sea válido
    if (indice < 0 || indice >= senamones.length) {
      print('Índice de Senamon inválido.');
      return;
    }

    // Validar cantidad de experiencia suficiente
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
}
