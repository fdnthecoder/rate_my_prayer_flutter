import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rate_my_prayer_flutter/core/utils/constants.dart';
import 'package:rate_my_prayer_flutter/providers/salah_provider.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salahState = ref.watch(salahProvider);
    final allSalahs = salahState.allSalahs;

    double overallAverage = 0;
    if (allSalahs.isNotEmpty) {
      overallAverage = allSalahs.map((s) => s.rating).reduce((a, b) => a + b) / allSalahs.length;
    }

    final Map<String, double> prayerAverages = {};
    for (var name in AppConstants.salahNames) {
      final filtered = allSalahs.where((s) => s.salahName == name).toList();
      if (filtered.isNotEmpty) {
        prayerAverages[name] = filtered.map((s) => s.rating).reduce((a, b) => a + b) / filtered.length;
      } else {
        prayerAverages[name] = 0.0;
      }
    }

    return Scaffold(
      app_bar: AppBar(title: const Text('Statistics')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _StatCard(
            title: 'Overall Average Rating',
            value: overallAverage.toStringAsFixed(1),
            icon: Icons.analytics,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 24),
          Text(
            'Individual Prayer Averages',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...AppConstants.salahNames.map((name) => _StatCard(
                title: name,
                value: '${prayerAverages[name]?.toStringAsFixed(1)}/10',
                icon: Icons.star,
                color: Theme.of(context).colorScheme.secondary,
              )),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title),
        trailing: Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: color,
          ),
        ),
      ),
    );
  }
}
