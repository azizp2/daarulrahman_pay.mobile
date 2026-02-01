import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'bottom_sheet_date_picker.dart';

class InputDateWithTitle extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final DateTime? initialDate;
  final String pattern;
  final String? hintText;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const InputDateWithTitle({
    super.key,
    required this.label,
    required this.controller,
    this.initialDate,
    this.pattern = 'dd/MM/yyyy',
    this.hintText,
    this.firstDate,
    this.lastDate,
  });

  Future<void> _openPicker(BuildContext context) async {
    final result = await showBottomSheetDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (result != null) {
      controller.text = DateFormat(pattern).format(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () => _openPicker(context),
          child: AbsorbPointer(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: const Icon(Icons.calendar_today),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
