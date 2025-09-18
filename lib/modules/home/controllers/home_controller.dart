import 'package:get/get.dart';
import 'package:moneyexpense/routes/app_routes.dart';

import '../../../app/controllers/category_controller.dart';
import '../../../app/controllers/expense_controller.dart';

/// Home page controller for managing home-specific logic.
class HomeController extends GetxController {
  final CategoryController categoryController = Get.find<CategoryController>();
  final ExpenseController expenseController = Get.find<ExpenseController>();

  /// Navigate to add expense page.
  void navigateToAddExpense() => Get.toNamed(AppRoutes.addExpense);
}
