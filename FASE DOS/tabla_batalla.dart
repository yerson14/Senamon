class TablaBatalla {
  static const Map<String, Map<String, double>> efectividad = {
    'Fuego': {'Agua': 0.5, 'Hierba': 2.0, 'Fuego': 1.0, 'Eléctrico': 1.0, 'Roca': 0.5},
    'Agua': {'Fuego': 2.0, 'Hierba': 0.5, 'Agua': 1.0, 'Eléctrico': 0.5, 'Roca': 2.0},
    'Hierba': {'Fuego': 0.5, 'Agua': 2.0, 'Hierba': 1.0, 'Eléctrico': 1.0, 'Roca': 2.0},
    'Eléctrico': {'Fuego': 1.0, 'Agua': 2.0, 'Hierba': 1.0, 'Eléctrico': 1.0, 'Roca': 1.0},
    'Roca': {'Fuego': 2.0, 'Agua': 0.5, 'Hierba': 0.5, 'Eléctrico': 1.0, 'Roca': 1.0},
  };

  static double obtenerMultiplicador(String tipoAtacante, String tipoDefensor) {
    return efectividad[tipoAtacante]?[tipoDefensor] ?? 1.0;
  }
}