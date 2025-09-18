import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneyexpense/utils/widgets/expense/category_picker.dart';

import '../../../app/controllers/category_controller.dart';
import '../../../app/controllers/expense_controller.dart';
import '../../../app/data/models/category.dart';

/// Controller for managing add expense page logic.
class AddExpenseController extends GetxController {
  final CategoryController categoryController = Get.find<CategoryController>();
  final ExpenseController expenseController = Get.find<ExpenseController>();

  // Form controllers
  final TextEditingController expenseNameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  // Form state
  final Rxn<Category> category = Rxn<Category>();
  final Rx<DateTime> date = DateTime.now().obs;
  final RxString note = ''.obs;
  final RxDouble amount = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
    expenseNameController.addListener(() {
      note.value = expenseNameController.text.trim();
    });
    amountController.addListener(() {
      amount.value = double.tryParse(amountController.text.trim()) ?? 0;
    });
  }

  @override
  void onClose() {
    expenseNameController.dispose();
    amountController.dispose();
    super.onClose();
  }

  /// Pick date for expense.
  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: date.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      date.value = picked;
    }
  }

  /// Open category picker modal.
  void openCategoryPicker() {
    showModalBottomSheet(
      context: Get.context!,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => CategoryPicker(
        categories: categoryController.categories,
        onCategorySelected: category.call,
      ),
    );
  }

  /// Get selected category.
  Category? get selectedCategory {
    if (category.value == null) return null;
    return categoryController.categories.firstWhereOrNull(
      (c) => c.id == category.value?.id,
    );
  }

  bool get isFormValid =>
      note.isNotEmpty && category.value != null && amount > 0;

  /// Save expense.
  void saveExpense() {
    if (!isFormValid) return;

    expenseController.addExpense(
      categoryId: category.value?.id ?? '',
      note: note.value,
      amount: amount.value,
      createdAt: date.value,
    );

    Get.back(result: 1);
  }
}
