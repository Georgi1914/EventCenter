import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../data/repositories/events/event.dart';
import '../../data/repositories/user/user.dart';
import '../../models/ui/event.dart';

class FavoriteVM extends ChangeNotifier {
  final UserRepo _userRepo;
  final EventRepo _eventRepo;

  FavoriteVM({required UserRepo userRepo, required EventRepo eventRepo})
      : _userRepo = userRepo,
        _eventRepo = eventRepo;

  List<DomainEvent> _favorites = [];

  Future<void> init() async {
    _favorites = await getFavorites();
    notifyListeners();
  }

  int get eventsLength => _favorites.length;

  String getEventAddress(int index) => _favorites[index].address;

  String getEventImage(int index) => _favorites[index].image.url;

  String getEventName(int index) => _favorites[index].name;

  DomainEvent getEvent(int index) => _favorites[index];

  int getEventId(int index) => _favorites[index].id;

  String formattedDate(int index) =>
      '${DateFormat('yMMMEd').format(_favorites[index].date)} ${DateFormat('Hm').format(_favorites[index].date)}';

  Future<List<DomainEvent>> getFavorites() async {
    final ids = await _userRepo.getFavoriteIds();
    final List<DomainEvent> list = await _eventRepo.getEventsFromIds(ids);
    return list;
  }

  Future<void> removeFavorite(int favoriteId) async {
    await _eventRepo.removeFavorite(favoriteId);
    _favorites = await getFavorites();
    notifyListeners();
  }
}
