import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/widgets/common/app_typography.dart';
import '../../../utils/widgets/common/section_header.dart';
import '../../../utils/widgets/expense/expense_stat_card.dart';
import '../../../utils/widgets/expense/category_card.dart';
import '../../../utils/widgets/expense/expense_list_for_date.dart';
import '../../../utils/constants/app_spacing.dart';
import '../controllers/home_controller.dart';

/// Home page view displaying expense statistics and recent transactions.
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('MoneyExpense')),
      body: SingleChildScrollView(
        padding: AppSpace.lg.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpace.xxl.height,
            const Text('Halo, User!', style: AppTypography.largeTitle),
            AppSpace.xs.height,
            Text(
              'Jangan lupa catat keuanganmu setiap hari!',
              style: AppTypography.subtitle,
            ),
            AppSpace.md.height,
            Row(
              children: [
                Obx(
                  () => ExpenseStatCards.todayExpense(
                    amount: controller.expenseController.todayTotal,
                  ),
                ),
                AppSpace.md.width,
                Obx(
                  () => ExpenseStatCards.monthExpense(
                    amount: controller.expenseController.monthTotal,
                  ),
                ),
              ],
            ),
            AppSpace.xl.height,
            const SectionHeader(title: 'Pengeluaran berdasarkan kategori'),
            AppSpace.md.height,
            SizedBox(
              height: 120,
              child: Obx(() {
                final monthCategoryTotals = controller.expenseController
                    .categoryTotalsForMonth();
                return SingleChildScrollView(
                  padding: AppSpace.xs.padding,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: controller.categoryController.categories.map((
                      category,
                    ) {
                      final totalForCategory =
                          monthCategoryTotals[category.id] ?? 0;
                      return CategoryCard(
                        category: category,
                        totalAmount: totalForCategory,
                      );
                    }).toList(),
                  ),
                );
              }),
            ),
            AppSpace.md.height,
            SectionHeaderWithSpacing(
              title: 'Hari ini',
              child: ExpenseListForDate(date: DateTime.now()),
            ),
            AppSpace.md.height,
            SectionHeaderWithSpacing(
              title: 'Kemarin',
              child: ExpenseListForDate(
                date: DateTime.now().subtract(const Duration(days: 1)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.navigateToAddExpense,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
