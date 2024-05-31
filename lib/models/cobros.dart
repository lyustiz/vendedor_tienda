/*import 'package:drift/drift.dart';

part 'cobros.g.dart';

@DataClassName("Cobro")
class Cobros extends Table {
  IntColumn get idVendedorCobroCarton => integer()();
  IntColumn get idProgramacionJuego => integer()();
  IntColumn get idVendedor => integer()();
  IntColumn get totalCartones => integer()();
  IntColumn get cartonesDevueltos => integer()();
  IntColumn get numeroHojasEntregadas => integer()();
  RealColumn get porcentajeComision => real()();
  RealColumn get totalVentas => real()();
  IntColumn get cartonesCortesia => integer()();
  RealColumn get valorComision => real()();
  RealColumn get abonos => real()();
  RealColumn get totalPagado => real()();
  RealColumn get faltante => real()();
  RealColumn get totalRecibido => real()();
  RealColumn get gastoCortesia => real()();
  RealColumn get totalModulos => real()();
  TextColumn get estado => text()();
  DateTimeColumn get fechaHora => dateTime().nullable()();
  IntColumn get idUsuario => integer()();
  DateTimeColumn get fechaCobroApp => dateTime().nullable()();
  DateTimeColumn get actualizado => dateTime().nullable()();
}

@DriftDatabase(tables: [Cobros])
class AppDatabase {}
*/