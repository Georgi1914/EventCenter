import '../../../models/network/category.dart';
import '../../../models/network/event.dart';
import '../../../models/ui/category.dart';
import '../../../models/ui/event.dart';

class CategoryRepoMappers {
  List<DomainCategory> mapNetworkCategoriesToUi(
    List<NetworkCategory> categories,
  ) =>
      categories.map(toDomainCategory).toList();

  DomainCategory toDomainCategory(NetworkCategory category) => DomainCategory(
        category.id,
        category.attributes.name,
        mapNetworkEventsToUi(category.attributes.events),
      );

  List<DomainEvent> mapNetworkEventsToUi(List<NetworkEvent> networkEvents) =>
      networkEvents.map((e) => e.toEvent()).toList();
}
