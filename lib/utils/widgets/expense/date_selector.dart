import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneyexpense/utils/constants/app_colors.dart';

/// A widget for selecting dates in forms.
class DateSelector extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onTap;

  const DateSelector({
    super.key,
    required this.selectedDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      'EEEE, d MMMM y',
      'id_ID',
    ).format(selectedDate);

    return InkWell(
      onTap: onTap,
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Tanggal Pengeluaran',
          border: OutlineInputBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(formattedDate),
            Icon(
              Icons.calendar_month_outlined,
              color: AppColors.grey,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
