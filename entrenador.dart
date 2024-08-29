import 'senamon.dart';

class Entrenador {
  String nombre;
  String email;
  DateTime fechaNacimiento;
  int nivelExperiencia;
  int batallasGanadas;
  List<Senamon> equipo;

  Entrenador(this.nombre, this.email, this.fechaNacimiento, this.nivelExperiencia, this.batallasGanadas) {
    equipo = [];
  }

  void atraparSenamon(Senamon senamon) {
    if (equipo.length < 5) {
      equipo.add(senamon);
      print('$nombre atrapó a ${senamon.nombre}');
    } else {
      print('$nombre ya tiene 5 Senamones. Debes reemplazar uno.');
    }
  }

  void reemplazarSenamon(int posicion, Senamon nuevoSenamon) {
    if (posicion >= 0 && posicion < equipo.length) {
      print('${equipo[posicion].nombre} ha sido reemplazado por ${nuevoSenamon.nombre}');
      equipo[posicion] = nuevoSenamon;
    } else {
      print('Posición inválida.');
    }
  }

  void mostrarEquipo() {
    print('Equipo de $nombre:');
    for (var senamon in equipo) {
      print(senamon);
    }
  }

  void mostrarDetalles() {
    print('Entrenador: $nombre');
    print('Email: $email');
    print('Fecha de Nacimiento: $fechaNacimiento');
    print('Nivel de Experiencia: $nivelExperiencia');
    print('Batallas Ganadas: $batallasGanadas');
  }
}