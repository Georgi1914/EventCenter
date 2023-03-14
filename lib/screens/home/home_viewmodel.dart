import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/repositories/category/category.dart';
import '../../data/repositories/events/event.dart';
import '../../data/repositories/user/user.dart';
import '../../models/ui/category.dart';
import '../../models/ui/event.dart';
import '../../models/ui/user_model_data.dart';

class HomeVM extends ChangeNotifier {
  final EventRepo _eventRepo;
  final CategoryRepo _categoryRepo;
  final UserRepo _userRepo;
  HomeVM(
      {required EventRepo eventRepo,
      required CategoryRepo categoryRepo,
      required UserRepo userRepo})
      : _eventRepo = eventRepo,
        _categoryRepo = categoryRepo,
        _userRepo = userRepo;

  List<DomainEvent> events = [];
  List<DomainCategory> categories = [];
  String selectedFilter = 'All';
  List<int> favorites = [];
  UserDataModel? me;
  bool _hasLogged = true;

  Future<void> init(bool isUser) async {
    _hasLogged = isUser;
    events = await _eventRepo.getAllEvents();
    categories = await _categoryRepo.getCategories();
    if (_hasLogged) {
      me = await _userRepo.getMe();
      favorites = await getFavoriteIds();
    }
    notifyListeners();
  }

  int get eventsLength => events.length;

  bool get hasLogged => _hasLogged;

  String getEventAddress(int index) => events[index].address;

  String getEventImage(int index) => events[index].image.url;

  String getEventName(int index) => events[index].name;

  DomainEvent getEvent(int index) => events[index];

  int getEventId(int index) => events[index].id;

  String formattedDate(int index) =>
      '${DateFormat('yMMMEd').format(events[index].date)} ${DateFormat('Hm').format(events[index].date)}';

  int get categoriesLength => categories.length;

  String getCategoryName(int index) => categories[index].name;

  bool isSelected(int index) => getCategoryName(index) == selectedFilter;

  Future<void> addFavorite(int favoriteId) async {
    if (me != null) {
      await _eventRepo.addFavorite(favoriteId);
      favorites = await getFavoriteIds();
      notifyListeners();
    }
  }

  Future<void> removeFavorite(int favoriteId) async {
    if (me != null) {
      await _eventRepo.removeFavorite(favoriteId);
      favorites = await getFavoriteIds();
      notifyListeners();
    }
  }

  Future<List<int>> getFavoriteIds() async =>
      await _eventRepo.getFavoritesIds();

  bool isFavorite(int index) =>
      me != null && favorites.contains(getEventId(index));

  String getMeNames() => me != null ? '${me?.firstName} ${me?.lastName}' : '';

  void setSelected(int index) {
    selectedFilter = getCategoryName(index);
    events = categories[index].events;
    notifyListeners();
  }
}
