import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moneyexpense/utils/constants/app_border_radius.dart';
import 'package:moneyexpense/utils/constants/app_colors.dart';
import 'package:moneyexpense/utils/widgets/common/app_typography.dart';

import '../../../utils/widgets/expense/category_selector.dart';
import '../../../utils/widgets/expense/date_selector.dart';
import '../../../utils/constants/app_spacing.dart';
import '../controllers/add_expense_controller.dart';

/// Add expense page view for creating new expenses.
class AddExpenseView extends GetView<AddExpenseController> {
  const AddExpenseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Pengeluaran Baru')),
      body: Padding(
        padding: AppSpace.lg.padding,
        child: Column(
          children: [
            TextField(
              controller: controller.expenseNameController,
              decoration: const InputDecoration(labelText: 'Nama Pengeluaran'),
            ),
            AppSpace.md.height,
            Obx(
              () => CategorySelector(
                selectedCategory: controller.selectedCategory,
                onTap: controller.openCategoryPicker,
              ),
            ),
            AppSpace.md.height,
            Obx(
              () => DateSelector(
                selectedDate: controller.date.value,
                onTap: controller.pickDate,
              ),
            ),
            AppSpace.md.height,
            TextFormField(
              controller: controller.amountController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Nominal',
                prefixText: 'Rp. ',
              ),
            ),
            AppSpace.md.height,
            SizedBox(
              width: double.infinity,
              child: Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.isFormValid
                        ? null
                        : AppColors.greyLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: AppBorderRadius.small,
                    ),
                  ),
                  onPressed: controller.saveExpense,
                  child: Text('Simpan', style: AppTypography.button),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
