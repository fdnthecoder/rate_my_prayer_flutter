import 'package:flutter/material.dart';
import 'package:rate_my_prayer_flutter/domain/entities/salah_log.dart';

class SalahCard extends StatelessWidget {
  final String salahName;
  final SalahLog? salahLog;
  final VoidCallback onRateClick;
  final bool enabled;

  const SalahCard({
    super.key,
    required this.salahName,
    this.salahLog,
    required this.onRateClick,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    salahName,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (salahLog != null) ...[
                    Text(
                      'Rating: ${salahLog!.rating}/10',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14,
                      ),
                    ),
                    if (salahLog!.notes != null && salahLog!.notes!.isNotEmpty)
                      Text(
                        salahLog!.notes!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                      ),
                  ] else
                    Text(
                      'Not logged yet',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: enabled ? onRateClick : null,
              child: Text(salahLog != null ? 'Edit' : 'Rate'),
            ),
          ],
        ),
      ),
    );
  }
}
