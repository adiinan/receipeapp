import 'package:hive/hive.dart';
 part 'recipe.g.dart';
@HiveType(typeId: 0)
class Recipe {
  @HiveField(0)
  String? receipename;
  @HiveField(1)
  String? description;
  Recipe({required this.receipename, required this.description});
}
