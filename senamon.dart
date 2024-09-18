class Senamon {
  // Atributos privados
  String _nombre;
  int _nivel;
  String _tipo;
  double _peso;
  int _puntosSalud;
  int _nivelAtaque;
  String _fase;
  int _nivelEnergia;
  String _descripcion;

  // Constructor
  Senamon({
    required String nombre,
    required int nivel,
    required String tipo,
    required double peso,
    required int puntosSalud,
    required int nivelAtaque,
    required String fase,
    required int nivelEnergia,
    required String descripcion,
  })  : _nombre = nombre,
        _nivel = nivel,
        _tipo = tipo,
        _peso = peso,
        _puntosSalud = puntosSalud,
        _nivelAtaque = nivelAtaque,
        _fase = fase,
        _nivelEnergia = nivelEnergia,
        _descripcion = descripcion;

  // Getters
  String get nombre => _nombre;
  int get nivel => _nivel;
  String get tipo => _tipo;
  double get peso => _peso;
  int get puntosSalud => _puntosSalud;
  int get nivelAtaque => _nivelAtaque;
  String get fase => _fase;
  int get nivelEnergia => _nivelEnergia;
  String get descripcion => _descripcion;

  // Setters
  set nombre(String nombre) => _nombre = nombre;
  set nivel(int nivel) => _nivel = nivel;
  set tipo(String tipo) => _tipo = tipo;
  set peso(double peso) => _peso = peso;
  set puntosSalud(int puntosSalud) => _puntosSalud = puntosSalud;
  set nivelAtaque(int nivelAtaque) => _nivelAtaque = nivelAtaque;
  set fase(String fase) => _fase = fase;
  set nivelEnergia(int nivelEnergia) => _nivelEnergia = nivelEnergia;
  set descripcion(String descripcion) => _descripcion = descripcion;
}

// Función para obtener los Senamones predeterminados
List<Senamon> getSenamonesPredeterminados(int entrenadorId) {
  if (entrenadorId == 1) {
    return [
      Senamon( nombre: 'FuegoMon', nivel: 5, tipo: 'Fuego', peso: 12.5, puntosSalud: 100, nivelAtaque: 50, fase: 'Evolucionado', nivelEnergia: 80, descripcion: 'Un Senamon de tipo fuego muy poderoso.',),
      Senamon( nombre: 'AquaMon', nivel: 6, tipo: 'Agua', peso: 14.0, puntosSalud: 90,nivelAtaque: 45, fase: 'Normal', nivelEnergia: 75, descripcion: 'Un Senamon de tipo agua rápido y ágil.', ),
      Senamon(nombre: 'HierMon', nivel: 1, tipo: 'hierba', peso: 4.5, puntosSalud: 105, nivelAtaque: 40, fase: 'juvenil', nivelEnergia: 105, descripcion: 'Senamon de hierba.'),
      Senamon(nombre: 'VoladMpn', nivel: 1, tipo: 'volador', peso: 3.0, puntosSalud: 95, nivelAtaque: 60, fase: 'juvenil', nivelEnergia: 90, descripcion: 'Senamon volador.'),
      Senamon(nombre: 'Eléctric', nivel: 1, tipo: 'eléctrico', peso: 4.0, puntosSalud: 90, nivelAtaque: 55, fase: 'juvenil', nivelEnergia: 95, descripcion: 'Senamon eléctrico.'),
      Senamon(nombre: 'Terrafang', nivel: 10, tipo: 'Tierra', peso: 85.0, puntosSalud: 88, nivelAtaque: 29, fase: "Normal", nivelEnergia: 68,descripcion: 'Controla la tierra con sus garras afiladas.', ),
      Senamon( nombre: 'Aqualis', nivel: 12, tipo: 'Agua', peso: 52.0, puntosSalud: 90, nivelAtaque: 27, fase: "Juvenil", nivelEnergia: 63,descripcion: 'Capaz de crear oleadas para atacar.'),
      Senamon(nombre: 'Pyrox',nivel: 15,tipo: 'Fuego',peso: 70.0,puntosSalud: 85,nivelAtaque: 40,fase: "Normal",nivelEnergia: 60,descripcion: 'Un Senamon volcánico que libera calor extremo.'),
      Senamon(nombre: 'Arboron',nivel: 11,tipo: 'Planta',peso: 40.0,puntosSalud: 80,nivelAtaque: 23,fase: "Evolucionado",nivelEnergia: 85,descripcion: 'Absorbe energía del sol para atacar.'),
      Senamon( nombre: 'Stormex', nivel: 13, tipo: 'Eléctrico', peso: 55.5, puntosSalud: 92, nivelAtaque: 34, fase: "Normal", nivelEnergia: 78, descripcion: 'Puede invocar tormentas eléctricas.' ),
    ];
  } else {
    return [
      Senamon( nombre: 'PlantaMon',  nivel: 5,  tipo: 'Planta', peso: 10.0, puntosSalud: 110, nivelAtaque: 40, fase: 'Evolucionado',nivelEnergia: 70,descripcion: 'Un Senamon de tipo planta con gran resistencia.'),
      Senamon(nombre: 'RocaMon', nivel: 7, tipo: 'Roca', peso: 20.0, puntosSalud: 120, nivelAtaque: 55, fase: 'Normal',  nivelEnergia: 85, descripcion: 'Un Senamon de tipo roca muy fuerte.'),
      Senamon(nombre: 'PikaMon', nivel: 1, tipo: 'viento', peso: 4.7, puntosSalud: 107, nivelAtaque: 42, fase: 'juvenil', nivelEnergia: 107, descripcion: 'Senamon de viento.'),
      Senamon(nombre: 'VolMon', nivel: 1, tipo: 'madera', peso: 3.2, puntosSalud: 97, nivelAtaque: 62, fase: 'juvenil', nivelEnergia: 92, descripcion: 'Senamon de madera.'),
      Senamon(nombre: 'ThorMon', nivel: 1, tipo: 'hielo', peso: 4.2, puntosSalud: 92, nivelAtaque: 57, fase: 'juvenil', nivelEnergia: 97, descripcion: 'Senamon de hielo.'),
      Senamon(nombre: 'Flamanteon',nivel: 10,tipo: 'Fuego',peso: 60.0, puntosSalud: 80,nivelAtaque: 30,fase: 'Normal',nivelEnergia: 70,descripcion: 'Un Senamon de cuerpo llameante.'),
      Senamon( nombre: 'Aguamarino', nivel: 12, tipo: 'Agua', peso: 50.5, puntosSalud: 85, nivelAtaque: 28,fase: "Juvenil",nivelEnergia: 65,descripcion: 'Domina las aguas profundas.',),
      Senamon( nombre: 'Electrobuzz',nivel: 9,tipo: 'Eléctrico',peso: 45.3,puntosSalud: 78,nivelAtaque: 32,fase: "Evolucionado",nivelEnergia: 60,descripcion: 'Puede generar descargas eléctricas a gran potencia.' ),
      Senamon(nombre: 'Rocko',nivel: 14,tipo: 'Roca',peso: 120.0,puntosSalud: 90, nivelAtaque: 35,fase: "Juvenil", nivelEnergia: 75,descripcion: 'Tan duro como una roca, literalmente.'),
      Senamon(nombre: 'Ventus',nivel: 11,tipo: 'Viento',peso: 30.0,puntosSalud: 82,nivelAtaque: 25,fase: "Normal",nivelEnergia: 80,descripcion: 'Un maestro de las corrientes de aire.',
      ),
    ];
  }
}
