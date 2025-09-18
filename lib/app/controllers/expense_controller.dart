import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../data/models/expense.dart';
import '../data/repositories/expense_repository.dart';

class ExpenseController extends GetxController {
  final ExpenseRepository _expenseRepository;
  final RxList<Expense> expenses = <Expense>[].obs;

  ExpenseController({required ExpenseRepository expenseRepository})
    : _expenseRepository = expenseRepository;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  void _load() {
    expenses.assignAll(_expenseRepository.getAllExpenses());
  }

  void addExpense({
    required String categoryId,
    required String note,
    required double amount,
    DateTime? createdAt,
  }) {
    final expense = Expense(
      id: const Uuid().v4(),
      categoryId: categoryId,
      note: note,
      amount: amount,
      createdAt: createdAt ?? DateTime.now(),
    );
    _expenseRepository.addExpense(expense);
    _load();
  }

  double get todayTotal {
    final now = DateTime.now();
    return expenses
        .where(
          (e) =>
              e.createdAt.year == now.year &&
              e.createdAt.month == now.month &&
              e.createdAt.day == now.day,
        )
        .fold(0.0, (p, e) => p + e.amount);
  }

  double get monthTotal {
    final now = DateTime.now();
    return expenses
        .where(
          (e) => e.createdAt.year == now.year && e.createdAt.month == now.month,
        )
        .fold(0.0, (p, e) => p + e.amount);
  }

  Map<String, double> categoryTotalsForMonth() {
    final now = DateTime.now();
    final Map<String, double> sums = {};
    for (final e in expenses.where(
      (e) => e.createdAt.year == now.year && e.createdAt.month == now.month,
    )) {
      sums.update(e.categoryId, (v) => v + e.amount, ifAbsent: () => e.amount);
    }
    return sums;
  }

  List<Expense> expensesForDate(DateTime date) {
    return expenses
        .where(
          (e) =>
              e.createdAt.year == date.year &&
              e.createdAt.month == date.month &&
              e.createdAt.day == date.day,
        )
        .toList();
  }
}
