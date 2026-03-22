import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class SalahLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  TextColumn get salahName => text()();
  IntColumn get rating => integer()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get loggedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {date, salahName}
      ];
}

class PracticeLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  IntColumn get rakat => integer()();
  IntColumn get rating => integer()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get loggedAt => dateTime()();
}

class AppSettingsTable extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  BoolColumn get isDarkMode => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [SalahLogs, PracticeLogs, AppSettingsTable])
class AppDatabase extends _${AppDatabase} {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(DatabaseConnection connection) : super(connection);

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'rate_my_prayer_2.sqlite'));
    return NativeDatabase(file);
  });
}
