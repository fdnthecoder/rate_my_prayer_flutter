import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rate_my_prayer_flutter/data/database/app_database.dart';
import 'package:rate_my_prayer_flutter/data/repositories/salah_repository_impl.dart';
import 'package:rate_my_prayer_flutter/domain/entities/salah_log.dart';
import 'package:rate_my_prayer_flutter/domain/entities/practice_log.dart';
import 'package:rate_my_prayer_flutter/domain/entities/app_settings.dart';

void main() {
  late AppDatabase db;
  late SalahRepositoryImpl repository;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    repository = SalahRepositoryImpl(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('SalahLog Tests', () {
    test('Insert and retrieve SalahLog', () async {
      final date = DateTime(2024, 5, 20);
      final log = SalahLog(
        date: date,
        salahName: 'Fajr',
        rating: 8,
        notes: 'Good focus',
        loggedAt: DateTime.now(),
      );

      await repository.insertSalahLog(log);
      final logs = await repository.getSalahsForDate(date);

      expect(logs.length, 1);
      expect(logs[0].salahName, 'Fajr');
      expect(logs[0].rating, 8);
    });

    test('UniqueKey constraint updates existing log', () async {
      final date = DateTime(2024, 5, 20);
      final log1 = SalahLog(
        date: date,
        salahName: 'Fajr',
        rating: 8,
        loggedAt: DateTime.now(),
      );
      final log2 = SalahLog(
        date: date,
        salahName: 'Fajr',
        rating: 9,
        notes: 'Improved',
        loggedAt: DateTime.now(),
      );

      await repository.insertSalahLog(log1);
      await repository.insertSalahLog(log2);

      final logs = await repository.getSalahsForDate(date);

      expect(logs.length, 1);
      expect(logs[0].rating, 9);
      expect(logs[0].notes, 'Improved');
    });
  });

  group('PracticeLog Tests', () {
    test('Insert and retrieve PracticeLog', () async {
      final date = DateTime(2024, 5, 20);
      final log = PracticeLog(
        date: date,
        rakat: 2,
        rating: 7,
        loggedAt: DateTime.now(),
      );

      await repository.insertPracticeLog(log);

      final logsStream = repository.getPracticeLogsForDate(date);
      final logs = await logsStream.first;

      expect(logs.length, 1);
      expect(logs[0].rakat, 2);
    });
  });

  group('AppSettings Tests', () {
    test('Update and get settings', () async {
      final settings = AppSettings(isDarkMode: true);
      await repository.updateSettings(settings);

      final retrieved = await repository.getSettings();
      expect(retrieved?.isDarkMode, true);
    });
  });
}
