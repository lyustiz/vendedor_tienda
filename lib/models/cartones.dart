/*import 'package:drift/drift.dart';

part 'cartones.g.dart';

@DataClassName("Carton")
class Cartones extends Table {
  IntColumn get idCarton => integer().autoIncrement()();
  IntColumn get idJuego => integer().nullable()();
  IntColumn get idProgramacionJuego => integer()();
  IntColumn get idModulo => integer().nullable()();
  IntColumn get numeroModulo => integer().nullable()();
  IntColumn get idPromocion => integer().nullable()();
  TextColumn get serie => text()();
  IntColumn get numeroSerie => integer()();
  IntColumn get idCliente => integer().nullable()();
  TextColumn get estado => text().nullable()();
  IntColumn get p1 => integer()();
  IntColumn get p2 => integer()();
  IntColumn get p3 => integer()();
  IntColumn get p4 => integer()();
  IntColumn get p5 => integer()();
  IntColumn get p6 => integer()();
  IntColumn get p7 => integer()();
  IntColumn get p8 => integer()();
  IntColumn get p9 => integer()();
  IntColumn get p10 => integer()();
  IntColumn get p11 => integer()();
  IntColumn get p12 => integer()();
  IntColumn get p13 => integer()();
  IntColumn get p14 => integer()();
  IntColumn get p15 => integer()();
  IntColumn get p16 => integer()();
  IntColumn get p17 => integer()();
  IntColumn get p18 => integer()();
  IntColumn get p19 => integer()();
  IntColumn get p20 => integer()();
  IntColumn get p21 => integer().nullable().withDefault(const Constant(0))();
  IntColumn get p22 => integer().nullable().withDefault(const Constant(0))();
  IntColumn get p23 => integer().nullable().withDefault(const Constant(0))();
  IntColumn get p24 => integer().nullable().withDefault(const Constant(0))();
  IntColumn get p25 => integer().nullable().withDefault(const Constant(0))();
  DateTimeColumn get actualizado => dateTime().nullable()();
}

// @JsonKey('user_name')  json mapper

@DriftDatabase(tables: [Cartones])
class AppDatabase {}
*/