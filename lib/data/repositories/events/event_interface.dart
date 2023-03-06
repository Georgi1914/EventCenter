import '../../../models/ui/event.dart';

abstract class EventRepositoryInterface {
  Future<List<DomainEvent>> getAllEvents();
  Future<List<DomainEvent>> getEventsFromIds(List<int> ids);
}
