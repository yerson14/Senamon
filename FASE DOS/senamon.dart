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

List<Senamon> getSenamonesPredeterminados(int entrenadorId) {
  if (entrenadorId == 1) {
    return [
      Senamon(nombre: 'FuegoMon', nivel: 5, tipo: 'Fuego', peso: 12.5, puntosSalud: 100, nivelAtaque: 50, fase: 'Evolucionado', nivelEnergia: 80, descripcion: 'Un Senamon de tipo fuego muy poderoso.'),
      Senamon(nombre: 'AquaMon', nivel: 6, tipo: 'Agua', peso: 14.0, puntosSalud: 90, nivelAtaque: 45, fase: 'Normal', nivelEnergia: 75, descripcion: 'Un Senamon de tipo agua rápido y ágil.'),
      Senamon(nombre: 'HierbaMon', nivel: 1, tipo: 'Hierba', peso: 4.5, puntosSalud: 105, nivelAtaque: 40, fase: 'Juvenil', nivelEnergia: 105, descripcion: 'Senamon de hierba.'),
      Senamon(nombre: 'ElectroMon', nivel: 1, tipo: 'Eléctrico', peso: 4.0, puntosSalud: 90, nivelAtaque: 55, fase: 'Juvenil', nivelEnergia: 95, descripcion: 'Senamon eléctrico.'),
      Senamon(nombre: 'RocaMon', nivel: 7, tipo: 'Roca', peso: 20.0, puntosSalud: 120, nivelAtaque: 55, fase: 'Normal', nivelEnergia: 85, descripcion: 'Un Senamon de tipo roca muy fuerte.'),
    ];
  } else {
    return [
      Senamon(nombre: 'PlantaMon', nivel: 5, tipo: 'Hierba', peso: 10.0, puntosSalud: 110, nivelAtaque: 40, fase: 'Evolucionado', nivelEnergia: 70, descripcion: 'Un Senamon de tipo planta con gran resistencia.'),
      Senamon(nombre: 'LavaMon', nivel: 6, tipo: 'Fuego', peso: 15.0, puntosSalud: 95, nivelAtaque: 50, fase: 'Normal', nivelEnergia: 80, descripcion: 'Un Senamon de tipo fuego con alta temperatura.'),
      Senamon(nombre: 'TorrenteMon', nivel: 1, tipo: 'Agua', peso: 5.5, puntosSalud: 100, nivelAtaque: 45, fase: 'Juvenil', nivelEnergia: 100, descripcion: 'Senamon de agua con gran potencial.'),
      Senamon(nombre: 'TruenMon', nivel: 1, tipo: 'Eléctrico', peso: 4.2, puntosSalud: 92, nivelAtaque: 57, fase: 'Juvenil', nivelEnergia: 97, descripcion: 'Senamon eléctrico con descargas potentes.'),
      Senamon(nombre: 'MontañaMon', nivel: 7, tipo: 'Roca', peso: 22.0, puntosSalud: 125, nivelAtaque: 52, fase: 'Normal', nivelEnergia: 88, descripcion: 'Un Senamon de tipo roca con gran defensa.'),
    ];
  }
}