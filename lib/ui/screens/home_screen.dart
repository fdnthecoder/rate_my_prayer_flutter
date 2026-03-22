import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rate_my_prayer_flutter/core/utils/constants.dart';
import 'package:rate_my_prayer_flutter/core/utils/date_utils.dart';
import 'package:rate_my_prayer_flutter/providers/clock_providers.dart';
import 'package:rate_my_prayer_flutter/providers/salah_provider.dart';
import 'package:rate_my_prayer_flutter/ui/widgets/motivational_card.dart';
import 'package:rate_my_prayer_flutter/ui/widgets/rating_dialog.dart';
import 'package:rate_my_prayer_flutter/ui/widgets/salah_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salahState = ref.watch(salahProvider);
    final currentTime = ref.watch(currentTimeProvider).value ?? DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Today\'s Prayers'),
            Text(
              DateUtilsHelper.getGregorianDateFormatted(currentTime),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Motivational Card
            const MotivationalCard(),
            const SizedBox(height: 16),
            
            // Hijri Date
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  DateUtilsHelper.getHijriDate(currentTime),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Salah Cards
            ...AppConstants.salahNames.map((name) {
              // Correct way to find or null in Dart
              final log = salahState.todaySalahs.cast<SalahLog?>().firstWhere(
                (l) => l?.salahName == name,
                orElse: () => null,
              );

              return SalahCard(
                salahName: name,
                salahLog: log,
                onRateClick: () {
                  showDialog(
                    context: context,
                    builder: (context) => RatingDialog(
                      salahName: name,
                      currentRating: log?.rating,
                      currentNotes: log?.notes,
                      onSave: (rating, notes) {
                        ref.read(salahProvider.notifier).saveSalahLog(
                          DateTime.now(),
                          name,
                          rating,
                          notes,
                        );
                      },
                    ),
                  );
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
