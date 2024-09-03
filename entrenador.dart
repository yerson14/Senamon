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
        print('El nivel de ataque de ${senamones[indice].nombre} ha aumentado a ${senamones[indice].nivelAtaque}.');
      } else {
        senamones[indice].puntosSalud += cantidad;
        print('Los puntos de salud de ${senamones[indice].nombre} han aumentado a ${senamones[indice].puntosSalud}.');
      }

      experiencia -= puntosRequeridos;
    } else {
      print('No tienes suficiente experiencia para mejorar este Senamon.');
    }
  }
}

// Función para obtener entrenadores predeterminados
List<Entrenador> getEntrenadoresPredeterminados() {
  List<Senamon> senamones1 = getSenamonesPredeterminados(1);
  List<Senamon> senamones2 = getSenamonesPredeterminados(2);

  return [
    Entrenador(
      nombre: 'Yerson',
      email: 'yersonnegro@gmail.com',
      fechaNacimiento: DateTime(1998, 5, 22),
      experiencia: 200,
      batallasGanadas: 5,
      senamones: senamones1,
    ),
    Entrenador(
      nombre: 'Maria melo',
      email: 'mariamelo@gmail.com',
      fechaNacimiento: DateTime(2000, 6, 1),
      experiencia: 150,
      batallasGanadas: 3,
      senamones: senamones2,
    ),
  ];
}
