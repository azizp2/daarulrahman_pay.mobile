import 'package:darul_rahman_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

Future<DateTime?> showBottomSheetDatePicker({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  DateTime selectedDate = initialDate ?? DateTime.now();

  return showModalBottomSheet<DateTime>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // drag indicator
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            Text(
              'Pilih Tanggal',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 250,
              child: CalendarDatePicker(
                initialDate: selectedDate,
                firstDate: firstDate ?? DateTime(2000),
                lastDate: lastDate ?? DateTime(2100),
                onDateChanged: (date) {
                  selectedDate = date;
                },
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.surface),
                    onPressed: () => Navigator.pop(context, selectedDate),
                    child: const Text('OK'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
