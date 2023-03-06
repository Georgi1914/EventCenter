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

  List<DomainEvent> favorites = [];

  Future<void> init() async {
    favorites = await getFavorites();
    notifyListeners();
  }

  int get eventsLength => favorites.length;

  String getEventAddress(int index) => favorites[index].address;

  String getEventImage(int index) => favorites[index].image.url;

  String getEventName(int index) => favorites[index].name;

  DomainEvent getEvent(int index) => favorites[index];

  String formattedDate(int index) =>
      '${DateFormat('yMMMEd').format(favorites[index].date)} ${DateFormat('Hm').format(favorites[index].date)}';

  Future<List<DomainEvent>> getFavorites() async {
    final ids = await _userRepo.getFavoriteIds();
    final List<DomainEvent> list = await _eventRepo.getEventsFromIds(ids);
    return list;
  }
}
