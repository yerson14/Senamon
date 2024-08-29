import 'dart:io';
import 'entrenador.dart';
void main(List<String> args) {
  List<Entrenador> datosEntrenadores=[];
    String nombreEntrenador;
    String email;
    DateTime fechaNacimiento;
    int nivelXP=1;
    int batallasGanadas=0;

  print("Bienvenido al mundo SENAMON");

    print("Ingrese el nombre del empleado:");
    nombreEntrenador = stdin.readLineSync()!;

    print("Ingrese su email");
    email = stdin.readLineSync()!;

    print("Ingrese su fecha de nacimiento");
    fechaNacimiento=DateTime()


    datosEntrenadores.add(Entrenador(nombreEntrenador, email,nivelXP,));
    print(datosEntrenadores);
  
}