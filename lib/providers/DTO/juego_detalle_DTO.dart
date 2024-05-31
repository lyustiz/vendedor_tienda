import 'package:vendedor_tienda/entities/premio.dart';

import 'configuracion_DTO.dart';
import 'programacion_juego_DTO.dart';

class JuegoDetalleDTO {
  final int idProgramacionJuego;
  final int? idJuego;
  final String fechaHoraInicio;
  final int idEmpresa;
  final String terminado;
  final int idUsuario;
  final int totalCartones;
  final int cartonesAsignados;
  final int cartonesVendidos;
  final int totalModulos;
  final int modulosAsignados;
  final int modulosVendidos;
  final int numeroVendedores;
  final List<Premio> premios;
  final ConfiguracionDTO? configuracion;
  final List<ProgramacionJuegoDTO> programacionesJuego;

  JuegoDetalleDTO({
    required this.idProgramacionJuego,
    this.idJuego,
    required this.fechaHoraInicio,
    required this.idEmpresa,
    required this.terminado,
    required this.idUsuario,
    required this.totalCartones,
    required this.cartonesAsignados,
    required this.cartonesVendidos,
    required this.totalModulos,
    required this.modulosAsignados,
    required this.modulosVendidos,
    required this.numeroVendedores,
    required this.premios,
    this.configuracion,
    required this.programacionesJuego,
  });

  /* static JuegosWithDetalles toJuegosWithDetalles(JuegoDetalleDTO juegoDTO) {
    Juego juego = Juego(
        idProgramacionJuego: 0,
        tipoJuego: 'R',
        fechaProgramada: DateTime.parse(juegoDTO.fechaHoraInicio),
        valorCarton: 0,
        totalCartones: 0,
        valorModulo: 0,
        totalModulos: 0,
        totalPremios: 0,
        serie: 'A',
        cartonInicial: 0,
        cartonFinal: 0,
        hojaInicial: 0,
        hojaFinal: 0,
        previoCierre: 0,
        estado: 'A',
        permitirDevolucion: 'N',
        actualizado: DateTime.parse(juegoDTO.fechaHoraInicio),
        cobrado: 'N');

    List<Premio> listPremios = [];

    juegoDTO.premios.forEach((premio) {
      Premio addPremio = Premio(
          idPremio: premio.idPremio,
          idProgramacionJuego: premio.idProgramacionJuego,
          idPlenoAutomatico: premio.idPlenoAutomatico,
          nombre: premio.nombre,
          posiciones: premio.posiciones,
          valorPremio: premio.valorPremio,
          estado: premio.estado,
          actualizado: premio.actualizado);
      listPremios.add(addPremio);
    });

    List<ProgramacionJuego> listProgramacionJuego = [];

    juegoDTO.programacionesJuego.forEach((pjuego) {
      ProgramacionJuego addProgramacion = ProgramacionJuego(
          idProgramacionJuego: pjuego.idProgramacionJuego,
          fechaProgramada: pjuego.fechaProgramada,
          valorCarton: pjuego.valorCarton,
          totalCartones: pjuego.totalCartones,
          valorModulo: pjuego.valorModulo,
          totalModulos: pjuego.totalModulos,
          totalPremios: pjuego.totalPremios,
          idSerie: pjuego.idSerie,
          cartonInicial: pjuego.cartonInicial,
          cartonFinal: pjuego.cartonFinal,
          hojaInicial: pjuego.hojaInicial,
          hojaFinal: pjuego.hojaFinal,
          resultadoFinal: pjuego.resultadoFinal,
          estado: pjuego.estado);
      listProgramacionJuego.add(addProgramacion);
    });

    return JuegosWithDetalles(
        juego: juego,
        premios: listPremios,
        programacionJuego: listProgramacionJuego);
  }*/
}
