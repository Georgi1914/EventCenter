import '../../../models/ui/category.dart';

abstract class CategoryRepoInterface {
  Future<List<DomainCategory>> getCategories();
}
