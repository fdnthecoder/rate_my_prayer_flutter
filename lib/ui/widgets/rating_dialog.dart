import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RatingDialog extends StatefulWidget {
  final String salahName;
  final int? currentRating;
  final String? currentNotes;
  final Function(int rating, String? notes) onSave;

  const RatingDialog({
    super.key,
    required this.salahName,
    this.currentRating,
    this.currentNotes,
    required this.onSave,
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  late TextEditingController _ratingController;
  late TextEditingController _notesController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: widget.currentRating?.toString() ?? '');
    _notesController = TextEditingController(text: widget.currentNotes ?? '');
  }

  @override
  void dispose() {
    _ratingController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Rate ${widget.salahName}'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _ratingController,
              decoration: const InputDecoration(
                labelText: 'Rating (1-10)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a rating';
                }
                final rating = int.tryParse(value);
                if (rating == null || rating < 1 || rating > 10) {
                  return 'Enter a number between 1 and 10';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Notes (optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onSave(
                int.parse(_ratingController.text),
                _notesController.text.isEmpty ? null : _notesController.text,
              );
              Navigator.pop(context);
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
