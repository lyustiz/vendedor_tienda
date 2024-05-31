class ProgramacionJuegoDTO {
  final int idProgramacionJuego;
  final String fechaProgramada;
  final int valorCarton;
  final int totalCartones;
  final int valorModulo;
  final int totalModulos;
  final int totalPremios;
  final int idSerie;
  final int cartonInicial;
  final int cartonFinal;
  final int hojaInicial;
  final int hojaFinal;
  final int resultadoFinal;
  final String estado;
  final int previoCierre;

  ProgramacionJuegoDTO(
      {required this.idProgramacionJuego,
      required this.fechaProgramada,
      required this.valorCarton,
      required this.totalCartones,
      required this.valorModulo,
      required this.totalModulos,
      required this.totalPremios,
      required this.idSerie,
      required this.cartonInicial,
      required this.cartonFinal,
      required this.hojaInicial,
      required this.hojaFinal,
      required this.resultadoFinal,
      required this.estado,
      required this.previoCierre});
}

/*

{
  "idJuego": 784,
  "fechaHoraInicio": "2021-08-02T17:51:04",
  "idEmpresa": 1,
  "terminado": "N",
  "idUsuario": 3,
  "totalCartones": 990,
  "cartonesAsignados": 450,
  "cartonesVendidos": 3,
  "totalModulos": 5,
  "modulosAsignados": 5,
  "modulosVendidos": 0,
  "numeroVendedores": 6,
  "premios": [
    {
      "idFigura": 6,
      "idPlenoAutomatico": 56,
      "idSerie": 1,
      "estado": "A",
      "valorPremio": 100
    },
    {
      "idFigura": 9,
      "idPlenoAutomatico": 1,
      "idSerie": 1,
      "estado": "A",
      "valorPremio": 500000
    }
  ],
  "configuracion": {
    "idConfiguracion": 6,
    "numeroJuego": 784,
    "carton": 55,
    "serie": "A",
    "balotas": 9,
    "fechaRegistro": "2020-08-04T21:57:52",
    "idUsuario": 3,
    "estado": "A",
    "fechaModificacion": "2022-02-07T18:43:22",
    "reconfigurado": 1
  },
  "programacionjuegos": [
    {
      "idProgramacionJuego": 2,
      "fechaProgramada": "2021-08-13T19:38:29",
      "valorCarton": 2000,
      "totalCartones": 0,
      "valorModulo": 10000,
      "totalModulos": 0,
      "totalPremios": 100,
      "idSerie": 1,
      "cartonInicial": 1,
      "cartonFinal": 1020,
      "hojaInicial": 1,
      "hojaFinal": 34,
      "resultadoFinal": 0,
      "estado": "A"
    }
  ]
}*/
