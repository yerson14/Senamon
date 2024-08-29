import 'senamon.dart';       // Asegúrate de importar tus archivos de clases si están en archivos separados
import 'entrenador.dart';
import 'mundo_senamon.dart';

void main() {
  // Crear algunos Senamones
  Senamon pikachu = Senamon('Pikachu', 'Eléctrico', 5);
  Senamon charmander = Senamon('Charmander', 'Fuego', 6);
  Senamon squirtle = Senamon('Squirtle', 'Agua', 4);

  // Crear el mundo Senamon y agregar Senamones
  MundoSenamon mundo = MundoSenamon();
  mundo.agregarSenamon(pikachu);
  mundo.agregarSenamon(charmander);
  mundo.agregarSenamon(squirtle);

  // Crear los entrenadores con la nueva información
  Entrenador ash = Entrenador('Ash', 'ash@example.com', DateTime(1997, 5, 22), 10, 25);
  Entrenador misty = Entrenador('Misty', 'misty@example.com', DateTime(1998, 4, 10), 8, 20);

  // Los entrenadores atrapan Senamones
  ash.atraparSenamon(pikachu);
  ash.atraparSenamon(charmander);

  misty.atraparSenamon(squirtle);

  // Mostrar equipos y detalles de los entrenadores
  ash.mostrarEquipo();
  ash.mostrarDetalles();

  misty.mostrarEquipo();
  misty.mostrarDetalles();

  // Reemplazar un Senamon en el equipo de Ash
  Senamon bulbasaur = Senamon('Bulbasaur', 'Planta', 5);
  ash.reemplazarSenamon(0, bulbasaur);
  ash.mostrarEquipo();
}