import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rate_my_prayer_flutter/data/database/app_database.dart';
import 'package:rate_my_prayer_flutter/data/repositories/salah_repository_impl.dart';
import 'package:rate_my_prayer_flutter/domain/repositories/salah_repository.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final salahRepositoryProvider = Provider<ISalahRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return SalahRepositoryImpl(db);
});
