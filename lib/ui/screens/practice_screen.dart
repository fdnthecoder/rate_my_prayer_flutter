import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rate_my_prayer_flutter/providers/salah_provider.dart';

class PracticeScreen extends ConsumerWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salahState = ref.watch(salahProvider);
    final salahNotifier = ref.read(salahProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Practice Salah')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPracticeDialog(context, salahNotifier),
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const _KhushuTipsCard(),
          const SizedBox(height: 24),
          Text(
            'Your Recent Practice',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          if (salahState.practiceLogs.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: Text('No practice logged yet. Tap + to start!'),
              ),
            ),
          ...salahState.practiceLogs.map((log) => _PracticeCard(log: log)),
        ],
      ),
    );
  }

  void _showPracticeDialog(BuildContext context, SalahNotifier notifier) {
    int rakat = 2;
    int rating = 5;
    String notes = '';

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Log Practice Salah'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('How many Rakat?'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: const Text('2 Rakat'),
                    selected: rakat == 2,
                    onSelected: (s) => setState(() => rakat = 2),
                  ),
                  const SizedBox(width: 12),
                  ChoiceChip(
                    label: const Text('4 Rakat'),
                    selected: rakat == 4,
                    onSelected: (s) => setState(() => rakat = 4),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text('Rating: $rating/10'),
              Slider(
                value: rating.toDouble(),
                min: 1,
                max: 10,
                divisions: 9,
                onChanged: (v) => setState(() => rating = v.round()),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Notes (optional)'),
                onChanged: (v) => notes = v,
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                notifier.savePracticeLog(rakat, rating, notes.isEmpty ? null : notes);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class _KhushuTipsCard extends StatelessWidget {
  const _KhushuTipsCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tips for Khushu (Concentration)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text('• Understand what you are reciting.'),
            Text('• Look at the place of prostration.'),
            Text('• Pray as if it is your last prayer.'),
            Text('• Avoid distractions before starting.'),
            Text('• Move slowly and calmly between positions.'),
          ],
        ),
      ),
    );
  }
}

class _PracticeCard extends StatelessWidget {
  final dynamic log; // Use dynamic for now until full integration
  const _PracticeCard({required this.log});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text('${log.rakat} Rakat Practice'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat('MMM dd, yyyy').format(log.date)),
            if (log.notes != null) Text(log.notes!, style: const TextStyle(fontStyle: FontStyle.italic)),
          ],
        ),
        trailing: Text(
          '${log.rating}/10',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
