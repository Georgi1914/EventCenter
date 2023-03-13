import '../../../models/network/event.dart';
import '../../../models/ui/event.dart';
import '../../../models/ui/event_type.dart';
import '../../api.dart';
import 'event_interface.dart';
import 'event_repository_mappers.dart';

class EventRepo implements EventRepositoryInterface {
  final Api _api;
  final EventRepoMappers _mappers;

  EventRepo({required Api api, required EventRepoMappers mappers})
      : _api = api,
        _mappers = mappers;

  @override
  Future<List<DomainEvent>> getAllEvents() async {
    final List<NetworkEvent> networkEvents = await _api.getEvents();
    final List<DomainEvent> events =
        _mappers.mapNetworkEventsToUi(networkEvents);
    return events;
  }

  @override
  Future<List<DomainEvent>> getEventsFromIds(List<int> ids) async {
    final List<NetworkEvent> networkEvents = [];
    for (final element in ids) {
      final event = await _api.getEventById(element);
      if (event != null) {
        networkEvents.add(event);
      }
    }
    return _mappers.mapNetworkEventsToUi(networkEvents);
  }

  Future<void> createEvent(EventType event) async {
    final response = await _api.createEvent(event);
    print(response);
  }
}
