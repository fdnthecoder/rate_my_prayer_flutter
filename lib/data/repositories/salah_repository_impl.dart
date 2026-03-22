import 'package:drift/drift.dart';
import 'package:rate_my_prayer_flutter/data/database/app_database.dart';
import 'package:rate_my_prayer_flutter/domain/entities/app_settings.dart';
import 'package:rate_my_prayer_flutter/domain/entities/practice_log.dart';
import 'package:rate_my_prayer_flutter/domain/entities/salah_log.dart';
import 'package:rate_my_prayer_flutter/domain/repositories/salah_repository.dart';

class SalahRepositoryImpl implements ISalahRepository {
  final AppDatabase _db;

  SalahRepositoryImpl(this._db);

  @override
  Future<void> insertSalahLog(SalahLog salahLog) async {
    await _db.into(_db.salahLogs).insertOnConflictUpdate(
          SalahLogsCompanion.insert(
            date: salahLog.date,
            salahName: salahLog.salahName,
            rating: salahLog.rating,
            loggedAt: salahLog.loggedAt,
            notes: Value(salahLog.notes),
          ),
        );
  }

  @override
  Future<SalahLog?> getSalahLog(DateTime date, String salahName) async {
    final query = _db.select(_db.salahLogs)
      ..where((t) => t.date.equals(date))
      ..where((t) => t.salahName.equals(salahName));

    final result = await query.getSingleOrNull();
    return result != null ? _mapToSalahLog(result) : null;
  }

  @override
  Future<List<SalahLog>> getSalahsForDate(DateTime date) async {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final query = _db.select(_db.salahLogs)..where((t) => t.date.equals(normalizedDate));
    final results = await query.get();
    return results.map(_mapToSalahLog).toList();
  }

  @override
  Future<List<SalahLog>> getSalahsForMonth(DateTime startDate, DateTime endDate) async {
    final query = _db.select(_db.salahLogs)
      ..where((t) => t.date.isBetweenValues(startDate, endDate));
    final results = await query.get();
    return results.map(_mapToSalahLog).toList();
  }

  @override
  Stream<List<SalahLog>> getAllSalahsStream() {
    return _db.select(_db.salahLogs).watch().map((rows) => rows.map(_mapToSalahLog).toList());
  }

  @override
  Future<void> deleteSalahLog(SalahLog salahLog) async {
    if (salahLog.id == null) return;
    await (_db.delete(_db.salahLogs)..where((t) => t.id.equals(salahLog.id!))).go();
  }

  @override
  Future<void> insertPracticeLog(PracticeLog practiceLog) async {
    await _db.into(_db.practiceLogs).insert(
          PracticeLogsCompanion.insert(
            date: practiceLog.date,
            rakat: practiceLog.rakat,
            rating: practiceLog.rating,
            loggedAt: practiceLog.loggedAt,
            notes: Value(practiceLog.notes),
          ),
        );
  }

  @override
  Stream<List<PracticeLog>> getPracticeLogsForDate(DateTime date) {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final query = _db.select(_db.practiceLogs)..where((t) => t.date.equals(normalizedDate));
    return query.watch().map((rows) => rows.map(_mapToPracticeLog).toList());
  }

  @override
  Stream<List<PracticeLog>> getAllPracticeLogsStream() {
    return _db.select(_db.practiceLogs).watch().map((rows) => rows.map(_mapToPracticeLog).toList());
  }

  @override
  Future<void> deletePracticeLog(PracticeLog practiceLog) async {
    if (practiceLog.id == null) return;
    await (_db.delete(_db.practiceLogs)..where((t) => t.id.equals(practiceLog.id!))).go();
  }

  @override
  Stream<AppSettings?> getSettingsStream() {
    return _db.select(_db.appSettingsTable).watchSingleOrNull().map(
          (row) => row != null ? AppSettings(isDarkMode: row.isDarkMode) : null,
        );
  }

  @override
  Future<AppSettings?> getSettings() async {
    final row = await _db.select(_db.appSettingsTable).getSingleOrNull();
    return row != null ? AppSettings(isDarkMode: row.isDarkMode) : null;
  }

  @override
  Future<void> updateSettings(AppSettings settings) async {
    await _db.into(_db.appSettingsTable).insertOnConflictUpdate(
          AppSettingsTableCompanion.insert(
            id: const Value(1),
            isDarkMode: Value(settings.isDarkMode),
          ),
        );
  }

  // Helper mappers
  SalahLog _mapToSalahLog(SalahLogData row) {
    return SalahLog(
      id: row.id,
      date: row.date,
      salahName: row.salahName,
      rating: row.rating,
      notes: row.notes,
      loggedAt: row.loggedAt,
    );
  }

  PracticeLog _mapToPracticeLog(PracticeLogData row) {
    return PracticeLog(
      id: row.id,
      date: row.date,
      rakat: row.rakat,
      rating: row.rating,
      notes: row.notes,
      loggedAt: row.loggedAt,
    );
  }
}
