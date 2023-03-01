import '../../../models/ui/event.dart';

abstract class EventRepositoryInterface {
  Future<List<DomainEvent>> getAllEvents();
}
