import '../models/expense.dart';
import '../providers/storage_service.dart';

/// Repository for expense data operations.
class ExpenseRepository {
  final StorageService _storageService;

  ExpenseRepository(this._storageService);

  /// Get all expenses sorted by creation date (newest first).
  List<Expense> getAllExpenses() {
    final expenses = _storageService.expensesBox.values.toList();
    expenses.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return expenses;
  }

  /// Add a new expense.
  Future<void> addExpense(Expense expense) async {
    await _storageService.expensesBox.add(expense);
  }

  /// Update an existing expense.
  Future<void> updateExpense(Expense expense) async {
    await expense.save();
  }

  /// Delete an expense.
  Future<void> deleteExpense(String expenseId) async {
    final expense = _storageService.expensesBox.values.firstWhere(
      (e) => e.id == expenseId,
    );
    await expense.delete();
  }

  /// Get expenses for a specific date.
  List<Expense> getExpensesForDate(DateTime date) {
    return _storageService.expensesBox.values
        .where(
          (expense) =>
              expense.createdAt.year == date.year &&
              expense.createdAt.month == date.month &&
              expense.createdAt.day == date.day,
        )
        .toList();
  }

  /// Get expenses for current month.
  List<Expense> getExpensesForCurrentMonth() {
    final now = DateTime.now();
    return _storageService.expensesBox.values
        .where(
          (expense) =>
              expense.createdAt.year == now.year &&
              expense.createdAt.month == now.month,
        )
        .toList();
  }

  /// Get expenses for today.
  List<Expense> getExpensesForToday() {
    final now = DateTime.now();
    return getExpensesForDate(now);
  }

  /// Get total amount for a specific date.
  double getTotalForDate(DateTime date) {
    return getExpensesForDate(
      date,
    ).fold(0.0, (sum, expense) => sum + expense.amount);
  }

  /// Get total amount for current month.
  double getTotalForCurrentMonth() {
    return getExpensesForCurrentMonth().fold(
      0.0,
      (sum, expense) => sum + expense.amount,
    );
  }

  /// Get total amount for today.
  double getTotalForToday() {
    return getTotalForDate(DateTime.now());
  }

  /// Get category totals for current month.
  Map<String, double> getCategoryTotalsForCurrentMonth() {
    final monthExpenses = getExpensesForCurrentMonth();
    final Map<String, double> totals = {};

    for (final expense in monthExpenses) {
      totals.update(
        expense.categoryId,
        (value) => value + expense.amount,
        ifAbsent: () => expense.amount,
      );
    }

    return totals;
  }
}
