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
List<Senamon> getSenamonesPredeterminados() {
  return [
    Senamon(nombre: 'Fuego1', nivel: 1, tipo: 'fuego', peso: 5.0, puntosSalud: 100, nivelAtaque: 50, fase: 'juvenil', nivelEnergia: 100, descripcion: 'Senamon de fuego.'),
    Senamon(nombre: 'Agua1', nivel: 1, tipo: 'agua', peso: 5.5, puntosSalud: 110, nivelAtaque: 45, fase: 'juvenil', nivelEnergia: 110, descripcion: 'Senamon de agua.'),
    // Agrega más Senamones aquí según las necesidades
  ];
}
