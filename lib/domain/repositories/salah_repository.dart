import 'package:rate_my_prayer_flutter/domain/entities/app_settings.dart';
import 'package:rate_my_prayer_flutter/domain/entities/practice_log.dart';
import 'package:rate_my_prayer_flutter/domain/entities/salah_log.dart';

abstract class ISalahRepository {
  // Salah Log operations
  Future<void> insertSalahLog(SalahLog salahLog);
  Future<SalahLog?> getSalahLog(DateTime date, String salahName);
  Future<List<SalahLog>> getSalahsForDate(DateTime date);
  Future<List<SalahLog>> getSalahsForMonth(DateTime startDate, DateTime endDate);
  Stream<List<SalahLog>> getAllSalahsStream();
  Future<void> deleteSalahLog(SalahLog salahLog);

  // Practice operations
  Future<void> insertPracticeLog(PracticeLog practiceLog);
  Stream<List<PracticeLog>> getPracticeLogsForDate(DateTime date);
  Stream<List<PracticeLog>> getAllPracticeLogsStream();
  Future<void> deletePracticeLog(PracticeLog practiceLog);

  // Settings operations
  Stream<AppSettings?> getSettingsStream();
  Future<AppSettings?> getSettings();
  Future<void> updateSettings(AppSettings settings);
}
