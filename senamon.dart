class Senamon {
  String nombre;
  int nivel;
  String tipo;
  double peso;
  int puntosSalud;
  int nivelAtaque;
  String fase;
  int nivelEnergia;
  String descripcion;

  Senamon({
    required this.nombre,
    required this.nivel,
    required this.tipo,
    required this.peso,
    required this.puntosSalud,
    required this.nivelAtaque,
    required this.fase,
    required this.nivelEnergia,
    required this.descripcion,
  });
}

// Función para obtener una lista de Senamones predeterminados
List<Senamon> getSenamonesPredeterminados(int entrenadorNumero) {
  if (entrenadorNumero == 1) {
    return [
      Senamon(nombre: 'Fuegolast', nivel: 1, tipo: 'fuego', peso: 5.0, puntosSalud: 100, nivelAtaque: 50, fase: 'juvenil', nivelEnergia: 100, descripcion: 'Senamon de fuego.'),
      Senamon(nombre: 'Aguaman', nivel: 1, tipo: 'agua', peso: 5.5, puntosSalud: 110, nivelAtaque: 45, fase: 'juvenil', nivelEnergia: 110, descripcion: 'Senamon de agua.'),
      Senamon(nombre: 'Hierbem', nivel: 1, tipo: 'hierba', peso: 4.5, puntosSalud: 105, nivelAtaque: 40, fase: 'juvenil', nivelEnergia: 105, descripcion: 'Senamon de hierba.'),
      Senamon(nombre: 'Volad', nivel: 1, tipo: 'volador', peso: 3.0, puntosSalud: 95, nivelAtaque: 60, fase: 'juvenil', nivelEnergia: 90, descripcion: 'Senamon volador.'),
      Senamon(nombre: 'Eléctric', nivel: 1, tipo: 'eléctrico', peso: 4.0, puntosSalud: 90, nivelAtaque: 55, fase: 'juvenil', nivelEnergia: 95, descripcion: 'Senamon eléctrico.'),
    ];
  } else {
    return [
      Senamon(nombre: 'Piedra', nivel: 1, tipo: 'piedras', peso: 5.2, puntosSalud: 102, nivelAtaque: 52, fase: 'juvenil', nivelEnergia: 102, descripcion: 'Senamon de piedras.'),
      Senamon(nombre: 'Metale', nivel: 1, tipo: 'metal', peso: 5.7, puntosSalud: 112, nivelAtaque: 47, fase: 'juvenil', nivelEnergia: 112, descripcion: 'Senamon de metal.'),
      Senamon(nombre: 'Pika', nivel: 1, tipo: 'viento', peso: 4.7, puntosSalud: 107, nivelAtaque: 42, fase: 'juvenil', nivelEnergia: 107, descripcion: 'Senamon de viento.'),
      Senamon(nombre: 'Vol', nivel: 1, tipo: 'madera', peso: 3.2, puntosSalud: 97, nivelAtaque: 62, fase: 'juvenil', nivelEnergia: 92, descripcion: 'Senamon de madera.'),
      Senamon(nombre: 'Thor', nivel: 1, tipo: 'hielo', peso: 4.2, puntosSalud: 92, nivelAtaque: 57, fase: 'juvenil', nivelEnergia: 97, descripcion: 'Senamon de hielo.'),
    ];
  }
}