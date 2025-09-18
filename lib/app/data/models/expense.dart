import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 2)
class Expense extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String categoryId;

  @HiveField(2)
  String note;

  @HiveField(3)
  double amount;

  @HiveField(4)
  DateTime createdAt;

  Expense({
    required this.id,
    required this.categoryId,
    required this.note,
    required this.amount,
    required this.createdAt,
  });
}
