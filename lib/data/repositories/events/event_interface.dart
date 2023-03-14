import 'package:dio/dio.dart';

import '../../../models/ui/event.dart';
import '../../../models/ui/event_type.dart';

abstract class EventRepositoryInterface {
  Future<List<DomainEvent>> getAllEvents();
  Future<List<DomainEvent>> getEventsFromIds(List<int> ids);
  Future<void> createEvent(EventType event, FormData image);
}
