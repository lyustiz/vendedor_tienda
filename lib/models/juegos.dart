/*import 'package:drift/drift.dart';

part 'juegos.g.dart';

@DataClassName("Juego")
class Juegos extends Table {
  IntColumn get idProgramacionJuego => integer().autoIncrement()();
  IntColumn get idJuego => integer().nullable()();
  TextColumn get tipoJuego => text()();
  DateTimeColumn get fechaProgramada => dateTime()();
  IntColumn get moduloCartones => integer().nullable()();
  TextColumn get moneda => text().nullable()();
  RealColumn get valorCarton => real()();
  IntColumn get totalCartones => integer()();
  RealColumn get valorModulo => real()();
  IntColumn get totalModulos => integer()();
  RealColumn get totalPremios => real()();
  TextColumn get serie => text()();
  IntColumn get cartonInicial => integer()();
  IntColumn get cartonFinal => integer()();
  IntColumn get hojaInicial => integer()();
  IntColumn get hojaFinal => integer()();
  DateTimeColumn get horaCierre => dateTime().nullable()();
  IntColumn get previoCierre => integer().withDefault(Constant(0))();
  TextColumn get estado => text()();
  TextColumn get permitirDevolucion => text().withDefault(Constant('N'))();
  DateTimeColumn get actualizado => dateTime()();
  TextColumn get cobrado => text().withDefault(Constant('N'))();
  DateTimeColumn get fechaCobro => dateTime().nullable()();
  DateTimeColumn get fechaEntregaCartones => dateTime().nullable()();

  String getNroJuego() {
    return '$idProgramacionJuego'.padLeft(3, '0');
  }
}

@DriftDatabase(tables: [Juegos])
class AppDatabase {}
*/