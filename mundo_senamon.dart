import 'senamon.dart';

class MundoSenamon {
  List<Senamon> todosLosSenamones;

  MundoSenamon() {
    todosLosSenamones = [];
  }

  void agregarSenamon(Senamon senamon) {
    todosLosSenamones.add(senamon);
  }

  Senamon obtenerSenamon(int indice) {
    if (indice >= 0 && indice < todosLosSenamones.length) {
      return todosLosSenamones[indice];
    } else {
      print('Índice inválido.');
      return null;
    }
  }

  void mostrarTodosLosSenamones() {
    print('Todos los Senamones en el mundo:');
    for (var senamon in todosLosSenamones) {
      print(senamon);
    }
  }
}