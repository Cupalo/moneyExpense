import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 1)
class Category extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String iconAssetPath;

  @HiveField(3)
  int colorHex;

  Category({
    required this.id,
    required this.name,
    required this.iconAssetPath,
    required this.colorHex,
  });
}
