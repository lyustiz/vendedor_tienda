/*import 'package:drift/drift.dart';

part 'figuras.g.dart';

@DataClassName("Figura")
class Figuras extends Table {
  IntColumn get idFigura => integer().autoIncrement()();
  IntColumn get idPlenoAutomatico => integer().nullable()();
  TextColumn get nombre => text()();
  TextColumn get posiciones => text().withLength(min: 20, max: 25)();
  TextColumn get estado => text().withDefault(const Constant('A'))();
  RealColumn get valorPremio => real().nullable()();
}

@DriftDatabase(tables: [Figuras])
class AppDatabase {}*/
