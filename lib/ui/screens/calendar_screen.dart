import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:rate_my_prayer_flutter/core/utils/constants.dart';
import 'package:rate_my_prayer_flutter/providers/salah_provider.dart';
import 'package:rate_my_prayer_flutter/ui/screens/day_detail_screen.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final salahState = ref.watch(salahProvider);

    // Group salahs by day and count unique names
    final Map<DateTime, int> eventCounts = {};
    for (var log in salahState.allSalahs) {
      final date = DateTime(log.date.year, log.date.month, log.date.day);
      // Logic to count unique salah names per day
      final dayLogs = salahState.allSalahs.where((s) => 
        s.date.year == date.year && 
        s.date.month == date.month && 
        s.date.day == date.day
      ).map((s) => s.salahName).toSet();
      
      eventCounts[date] = dayLogs.length;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Calendar')),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DayDetailScreen(date: selectedDay),
                ),
              );
            },
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) => _buildCell(day, eventCounts),
              todayBuilder: (context, day, focusedDay) => _buildCell(day, eventCounts, isToday: true),
              selectedBuilder: (context, day, focusedDay) => _buildCell(day, eventCounts, isSelected: true),
            ),
          ),
          const Spacer(),
          const _CalendarLegend(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildCell(DateTime day, Map<DateTime, int> counts, {bool isToday = false, bool isSelected = false}) {
    final date = DateTime(day.year, day.month, day.day);
    final count = counts[date] ?? 0;
    
    Color color = AppConstants.colorGray;
    if (count == 5) color = AppConstants.colorGreen;
    else if (count >= 3) color = AppConstants.colorYellow;
    else if (count >= 1) color = AppConstants.colorRed;

    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: isSelected ? Border.all(color: Colors.blue, width: 2) : (isToday ? Border.all(color: Colors.grey) : null),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${day.day}',
              style: TextStyle(fontWeight: isToday ? FontWeight.bold : FontWeight.normal),
            ),
            if (count > 0)
              Text(
                '$count',
                style: TextStyle(fontSize: 10, color: color),
              ),
          ],
        ),
      ),
    );
  }
}

class _CalendarLegend extends StatelessWidget {
  const _CalendarLegend();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Legend', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _LegendItem(color: AppConstants.colorGreen, text: '5 prayers'),
            _LegendItem(color: AppConstants.colorYellow, text: '3-4 prayers'),
            _LegendItem(color: AppConstants.colorRed, text: '1-2 prayers'),
            _LegendItem(color: AppConstants.colorGray, text: '0 prayers'),
          ],
        ),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;
  const _LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 12, height: 12, color: color),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
