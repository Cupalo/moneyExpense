import '../models/category.dart';
import '../providers/storage_service.dart';

/// Repository for category data operations.
class CategoryRepository {
  final StorageService _storageService;

  CategoryRepository(this._storageService);

  /// Get all categories.
  List<Category> getAllCategories() {
    return _storageService.categoriesBox.values.toList();
  }

  /// Add a new category.
  Future<void> addCategory(Category category) async {
    await _storageService.categoriesBox.add(category);
  }

  /// Update an existing category.
  Future<void> updateCategory(Category category) async {
    await category.save();
  }

  /// Delete a category.
  Future<void> deleteCategory(String categoryId) async {
    final category = _storageService.categoriesBox.values.firstWhere(
      (c) => c.id == categoryId,
    );
    await category.delete();
  }

  /// Get category by ID.
  Category? getCategoryById(String id) {
    try {
      return _storageService.categoriesBox.values.firstWhere(
        (category) => category.id == id,
      );
    } catch (e) {
      return null;
    }
  }
}
