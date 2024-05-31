class Configuracion {
  final int idConfiguracion;
  final int numeroJuego;
  final int carton;
  final String serie;
  final int balotas;
  final String fechaRegistro;
  final int idUsuario;
  final String estado;
  final String? fechaModificacion;
  final int reconfigurado;

  Configuracion({
    required this.idConfiguracion,
    required this.numeroJuego,
    required this.carton,
    required this.serie,
    required this.balotas,
    required this.fechaRegistro,
    required this.idUsuario,
    required this.estado,
    this.fechaModificacion,
    required this.reconfigurado,
  });
}
