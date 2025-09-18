import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../data/models/category.dart';
import '../data/repositories/category_repository.dart';
import '../../utils/constants/app_colors.dart';

class CategoryController extends GetxController {
  final CategoryRepository _categoryRepository;
  final RxList<Category> categories = <Category>[].obs;

  CategoryController({required CategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  void _load() {
    categories.assignAll(_categoryRepository.getAllCategories());
    if (categories.isEmpty) {
      _seedDefaults();
    }
  }

  void _seedDefaults() {
    final defaults = [
      // Colors tuned to match design.png/icons.png palette
      Category(
        id: const Uuid().v4(),
        name: 'Makanan',
        iconAssetPath: 'assets/makanan.svg',
        colorHex: AppColors.catMakananHex,
      ),
      Category(
        id: const Uuid().v4(),
        name: 'Internet',
        iconAssetPath: 'assets/internet.svg',
        colorHex: AppColors.catInternetHex,
      ),
      Category(
        id: const Uuid().v4(),
        name: 'Edukasi',
        iconAssetPath: 'assets/edukasi.svg',
        colorHex: AppColors.catEdukasiHex,
      ),
      Category(
        id: const Uuid().v4(),
        name: 'Hadiah',
        iconAssetPath: 'assets/hadia.svg',
        colorHex: AppColors.catHadiahHex,
      ),
      Category(
        id: const Uuid().v4(),
        name: 'Transportasi',
        iconAssetPath: 'assets/transportasi.svg',
        colorHex: AppColors.catTransportHex,
      ),
      Category(
        id: const Uuid().v4(),
        name: 'Belanja',
        iconAssetPath: 'assets/belanja.svg',
        colorHex: AppColors.catBelanjaHex,
      ),
      Category(
        id: const Uuid().v4(),
        name: 'Alat Rumah',
        iconAssetPath: 'assets/alat_rumah.svg',
        colorHex: AppColors.catAlatRumahHex,
      ),
      Category(
        id: const Uuid().v4(),
        name: 'Olahraga',
        iconAssetPath: 'assets/olahraga.svg',
        colorHex: AppColors.catOlahragaHex,
      ),
      Category(
        id: const Uuid().v4(),
        name: 'Hiburan',
        iconAssetPath: 'assets/hiburan.svg',
        colorHex: AppColors.catHiburanHex,
      ),
    ];
    for (final c in defaults) {
      _categoryRepository.addCategory(c);
    }
    categories.assignAll(_categoryRepository.getAllCategories());
  }
}
