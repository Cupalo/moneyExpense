import 'package:get/get.dart';

import '../data/providers/storage_service.dart';
import '../data/repositories/category_repository.dart';
import '../data/repositories/expense_repository.dart';
import '../controllers/category_controller.dart';
import '../controllers/expense_controller.dart';

/// Global app bindings for dependency injection.
class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Core services
    Get.lazyPut<StorageService>(() => StorageService(), fenix: true);

    // Repositories
    Get.lazyPut<CategoryRepository>(
      () => CategoryRepository(Get.find<StorageService>()),
      fenix: true,
    );
    Get.lazyPut<ExpenseRepository>(
      () => ExpenseRepository(Get.find<StorageService>()),
      fenix: true,
    );

    // Global controllers
    Get.lazyPut<CategoryController>(
      () => CategoryController(
        categoryRepository: Get.find<CategoryRepository>(),
      ),
      fenix: true,
    );
    Get.lazyPut<ExpenseController>(
      () => ExpenseController(expenseRepository: Get.find<ExpenseRepository>()),
      fenix: true,
    );
  }
}
