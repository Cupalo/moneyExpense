import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/controllers/category_controller.dart';
import '../../../app/controllers/expense_controller.dart';
import '../common/card_container.dart';
import 'expense_item.dart';

/// A widget that displays a list of expenses for a specific date.
class ExpenseListForDate extends StatelessWidget {
  final DateTime date;

  const ExpenseListForDate({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();
    final expenseController = Get.find<ExpenseController>();

    return Obx(() {
      final dailyExpenses = expenseController.expensesForDate(date);

      if (dailyExpenses.isEmpty) {
        return CardContainer(child: const Text('Belum ada pengeluaran'));
      }

      return Column(
        children: dailyExpenses.map((expense) {
          final category = categoryController.categories.firstWhere(
            (cat) => cat.id == expense.categoryId,
          );
          return ExpenseItem(expense: expense, category: category);
        }).toList(),
      );
    });
  }
}
