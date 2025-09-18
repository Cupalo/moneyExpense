import 'package:get/get.dart';

import '../modules/home/views/home_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/expense/views/add_expense_view.dart';
import '../modules/expense/bindings/expense_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.addExpense,
      page: () => const AddExpenseView(),
      binding: ExpenseBinding(),
    ),
  ];
}
