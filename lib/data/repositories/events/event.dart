import 'dart:developer';

import '../../../models/network/event.dart';
import '../../../models/ui/event.dart';
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
    try {
      final List<NetworkEvent> networkEvents = await _api.getEvents();
      final List<DomainEvent> events =
          _mappers.mapNetworkEventsToUi(networkEvents);
      return events;
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }
}
