import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rate_my_prayer_flutter/core/utils/date_utils.dart';
import 'package:rate_my_prayer_flutter/domain/entities/app_settings.dart';
import 'package:rate_my_prayer_flutter/domain/entities/salah_log.dart';
import 'package:rate_my_prayer_flutter/domain/entities/practice_log.dart';
import 'package:rate_my_prayer_flutter/domain/repositories/salah_repository.dart';
import 'package:rate_my_prayer_flutter/providers/repository_providers.dart';
import 'package:rate_my_prayer_flutter/providers/clock_providers.dart';

class SalahState {
  final List<SalahLog> todaySalahs;
  final List<SalahLog> selectedDateSalahs;
  final List<SalahLog> monthSalahs;
  final List<SalahLog> allSalahs;
  final List<PracticeLog> practiceLogs;
  final AppSettings settings;

  SalahState({
    this.todaySalahs = const [],
    this.selectedDateSalahs = const [],
    this.monthSalahs = const [],
    this.allSalahs = const [],
    this.practiceLogs = const [],
    this.settings = AppSettings(),
  });

  SalahState copyWith({
    List<SalahLog>? todaySalahs,
    List<SalahLog>? selectedDateSalahs,
    List<SalahLog>? monthSalahs,
    List<SalahLog>? allSalahs,
    List<PracticeLog>? practiceLogs,
    AppSettings? settings,
  }) {
    return SalahState(
      todaySalahs: todaySalahs ?? this.todaySalahs,
      selectedDateSalahs: selectedDateSalahs ?? this.selectedDateSalahs,
      monthSalahs: monthSalahs ?? this.monthSalahs,
      allSalahs: allSalahs ?? this.allSalahs,
      practiceLogs: practiceLogs ?? this.practiceLogs,
      settings: settings ?? this.settings,
    );
  }
}

class SalahNotifier extends StateNotifier<SalahState> {
  final ISalahRepository _repository;
  DateTime _lastDate;

  SalahNotifier(this._repository)
      : _lastDate = DateTime.now(),
        super(SalahState()) {
    _init();
  }

  Future<void> _init() async {
    // Load initial settings
    final settings = await _repository.getSettings();
    if (settings != null) {
      state = state.copyWith(settings: settings);
    }

    // Subscribe to all salahs stream
    _repository.getAllSalahsStream().listen((salahs) {
      state = state.copyWith(allSalahs: salahs);
      _updateTodaySalahs(salahs);
    });

    // Subscribe to practice logs stream
    _repository.getAllPracticeLogsStream().listen((logs) {
      state = state.copyWith(practiceLogs: logs);
    });

    loadTodaySalahs();
  }

  void handleMidnightTransition(DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    final last = DateTime(_lastDate.year, _lastDate.month, _lastDate.day);
    
    if (today.isAfter(last)) {
      _lastDate = now;
      loadTodaySalahs();
    }
  }

  Future<void> loadTodaySalahs() async {
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);
    final salahs = await _repository.getSalahsForDate(normalizedToday);
    state = state.copyWith(todaySalahs: salahs);
  }

  Future<void> loadSalahsForDate(DateTime date) async {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    final salahs = await _repository.getSalahsForDate(normalizedDate);
    state = state.copyWith(selectedDateSalahs: salahs);
  }

  Future<void> loadSalahsForMonth(DateTime date) async {
    final start = DateUtilsHelper.getMonthStart(date);
    final end = DateUtilsHelper.getMonthEnd(date);
    final salahs = await _repository.getSalahsForMonth(start, end);
    state = state.copyWith(monthSalahs: salahs);
  }

  Future<void> saveSalahLog(DateTime date, String name, int rating, String? notes) async {
    if (DateUtilsHelper.isFutureDate(date)) return;

    final normalizedDate = DateTime(date.year, date.month, date.day);
    
    // In Flutter, insertOnConflictUpdate handles replacement if (date, name) unique key matches
    final log = SalahLog(
      date: normalizedDate,
      salahName: name,
      rating: rating,
      notes: notes,
      loggedAt: DateTime.now(),
    );

    await _repository.insertSalahLog(log);
    // Drift's watch streams will automatically update the state via listeners in _init
  }

  Future<void> deleteSalahLog(SalahLog log) async {
    await _repository.deleteSalahLog(log);
  }

  Future<void> savePracticeLog(int rakat, int rating, String? notes) async {
    final now = DateTime.now();
    final normalizedDate = DateTime(now.year, now.month, now.day);
    final log = PracticeLog(
      date: normalizedDate,
      rakat: rakat,
      rating: rating,
      notes: notes,
      loggedAt: now,
    );
    await _repository.insertPracticeLog(log);
  }

  Future<void> deletePracticeLog(PracticeLog log) async {
    await _repository.deletePracticeLog(log);
  }

  Future<void> toggleDarkMode() async {
    final newSettings = state.settings.copyWith(isDarkMode: !state.settings.isDarkMode);
    await _repository.updateSettings(newSettings);
    state = state.copyWith(settings: newSettings);
  }

  void _updateTodaySalahs(List<SalahLog> allSalahs) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final filtered = allSalahs.where((s) => 
      s.date.year == today.year && 
      s.date.month == today.month && 
      s.date.day == today.day
    ).toList();
    state = state.copyWith(todaySalahs: filtered);
  }
}

final salahProvider = StateNotifierProvider<SalahNotifier, SalahState>((ref) {
  final repository = ref.watch(salahRepositoryProvider);
  final notifier = SalahNotifier(repository);

  ref.listen(currentTimeProvider, (previous, next) {
    next.whenData((now) => notifier.handleMidnightTransition(now));
  });

  return notifier;
});
