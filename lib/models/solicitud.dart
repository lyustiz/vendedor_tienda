/*import 'package:drift/drift.dart';

part 'solicitud.g.dart';

@DataClassName("Solicitud")
class Solicitudes extends Table {
  IntColumn get idSolicitud => integer().autoIncrement()();
  IntColumn get idProgramacionJuego => integer()();
  TextColumn get tipoSolicitud => text()();
  IntColumn get cantidad => integer()();
  TextColumn get estado => text().withDefault(const Constant('P'))();
  DateTimeColumn get fechaSolicitud => dateTime().nullable()();
  DateTimeColumn get fechaRespuesta => dateTime().nullable()();
}

@DriftDatabase(tables: [Solicitudes])
class AppDatabase {}*/
