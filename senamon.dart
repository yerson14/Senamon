class Senamon {
  String nombre;
  String tipo;
  int nivel;

  Senamon(this.nombre, this.tipo, this.nivel);

  @override
  String toString() {
    return 'Senamon(nombre: $nombre, tipo: $tipo, nivel: $nivel)';
  }
}