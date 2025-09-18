import 'package:get/get.dart';

import '../controllers/add_expense_controller.dart';

/// Expense module bindings for dependency injection.
class ExpenseBinding extends Bindings {
  @override
  void dependencies() {
    // Expense-specific controller only
    // Global controllers are already registered in AppBinding
    Get.lazyPut<AddExpenseController>(() => AddExpenseController());
  }
}
