import '../../../models/network/category.dart';
import '../../../models/ui/category.dart';
import '../../api.dart';
import 'category_interface.dart';
import 'category_repository_mappers.dart';

class CategoryRepo implements CategoryRepoInterface {
  final Api _api;
  final CategoryRepoMappers _mappers;

  CategoryRepo({required Api api, required CategoryRepoMappers mappers})
      : _api = api,
        _mappers = mappers;

  @override
  Future<List<DomainCategory>> getCategories() async {
    final List<NetworkCategory> categories = await _api.getCategories();
    final domainCategories = _mappers.mapNetworkCategoriesToUi(categories);
    return domainCategories;
  }
}
