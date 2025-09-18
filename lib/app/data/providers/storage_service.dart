import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive_flutter/hive_flutter.dart';

import '../models/category.dart';
import '../models/expense.dart';

class StorageService {
  static const String categoriesBoxName = 'categories';
  static const String expensesBoxName = 'expenses';

  Future<void> init() async {
    if (!kIsWeb &&
        (Platform.isAndroid ||
            Platform.isIOS ||
            Platform.isMacOS ||
            Platform.isLinux ||
            Platform.isWindows)) {
      await Hive.initFlutter();
    } else {
      await Hive.initFlutter();
    }

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CategoryAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ExpenseAdapter());
    }

    await Hive.openBox<Category>(categoriesBoxName);
    await Hive.openBox<Expense>(expensesBoxName);
  }

  Box<Category> get categoriesBox => Hive.box<Category>(categoriesBoxName);
  Box<Expense> get expensesBox => Hive.box<Expense>(expensesBoxName);
}
