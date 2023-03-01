import '../../../models/network/event.dart';
import '../../../models/ui/event.dart';

class EventRepoMappers {
  List<DomainEvent> mapNetworkEventsToUi(List<NetworkEvent> networkEvents) =>
      networkEvents.map((e) => e.toEvent()).toList();
}
