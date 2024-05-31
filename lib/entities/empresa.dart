class Empresa {
  final int idEmpresa;
  final String nombreEmpresa;
  final String nit;
  final String? direccion;
  final String? telefono;
  final String? ciudad;
  final String? pais;
  final String? prefijo;
  final DateTime? actualizado;

  Empresa({
    required this.idEmpresa,
    required this.nombreEmpresa,
    required this.nit,
    this.direccion,
    this.telefono,
    this.ciudad,
    this.pais,
    this.prefijo,
    this.actualizado,
  });
}
