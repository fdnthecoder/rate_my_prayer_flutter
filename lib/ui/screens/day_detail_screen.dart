import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rate_my_prayer_flutter/core/utils/constants.dart';
import 'package:rate_my_prayer_flutter/core/utils/date_utils.dart';
import 'package:rate_my_prayer_flutter/domain/entities/salah_log.dart';
import 'package:rate_my_prayer_flutter/providers/salah_provider.dart';
import 'package:rate_my_prayer_flutter/ui/widgets/rating_dialog.dart';
import 'package:rate_my_prayer_flutter/ui/widgets/salah_card.dart';

class DayDetailScreen extends ConsumerWidget {
  final DateTime date;

  const DayDetailScreen({super.key, required this.date});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salahState = ref.watch(salahProvider);
    final salahNotifier = ref.read(salahProvider.notifier);
    final isFuture = DateUtilsHelper.isFutureDate(date);

    // Filter logs for the selected date
    final dayLogs = salahState.allSalahs.where((s) =>
      s.date.year == date.year &&
      s.date.month == date.month &&
      s.date.day == date.day
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Prayer Details'),
            Text(
              DateUtilsHelper.getGregorianDateFormatted(date),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                DateUtilsHelper.getHijriDate(date),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ...AppConstants.salahNames.map((name) {
            SalahLog? existingLog;
            try {
              existingLog = dayLogs.firstWhere((s) => s.salahName == name);
            } catch (_) {
              existingLog = null;
            }

            return SalahCard(
              salahName: name,
              salahLog: existingLog,
              enabled: !isFuture,
              onRateClick: () {
                showDialog(
                  context: context,
                  builder: (context) => RatingDialog(
                    salahName: name,
                    currentRating: existingLog?.rating,
                    currentNotes: existingLog?.notes,
                    onSave: (rating, notes) {
                      salahNotifier.saveSalahLog(date, name, rating, notes);
                    },
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
