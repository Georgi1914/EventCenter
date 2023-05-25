import 'package:dio/dio.dart';

import '../../../models/network/event.dart';
import '../../../models/ui/event.dart';
import '../../../models/ui/event_type.dart';
import '../../api.dart';
import '../../services/favorite_service.dart';
import 'event_interface.dart';
import 'event_repository_mappers.dart';

class EventRepo implements EventRepositoryInterface {
  final Api _api;
  final FavoriteService _favoriteService;
  final EventRepoMappers _mappers;

  EventRepo(
      {required Api api,
      required EventRepoMappers mappers,
      required FavoriteService favoriteService})
      : _api = api,
        _mappers = mappers,
        _favoriteService = favoriteService;

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

  @override
  Future<void> createEvent(EventType event, FormData image) async {
    final imageResponse = await _uploadImage(image);

    event.mainPicture = imageResponse.data[0]['id'];
    await _api.createEvent(event);
  }

  Future<Response> _uploadImage(FormData image) async {
    final response = await _api.uploadImage(image);
    return response;
  }

  Future<List<int>> getFavoritesIds() async =>
      await _favoriteService.getFavoriteIds();

  Future<void> addFavorite(int favoriteId) async {
    await _favoriteService.addFavorite(favoriteId);
  }

  Future<void> removeFavorite(int favoriteId) async {
    await _favoriteService.removeFavorite(favoriteId);
  }
}
