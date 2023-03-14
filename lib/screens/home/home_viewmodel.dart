import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/repositories/category/category.dart';
import '../../data/repositories/events/event.dart';
import '../../models/ui/category.dart';
import '../../models/ui/event.dart';

class HomeVM extends ChangeNotifier {
  final EventRepo _eventRepo;
  final CategoryRepo _categoryRepo;
  HomeVM({required EventRepo eventRepo, required CategoryRepo categoryRepo})
      : _eventRepo = eventRepo,
        _categoryRepo = categoryRepo;

  List<DomainEvent> events = [];
  List<DomainCategory> categories = [];
  String selectedFilter = 'All';
  List<int> favorites = [];

  Future<void> init() async {
    events = await _eventRepo.getAllEvents();
    categories = await _categoryRepo.getCategories();
    favorites = await getFavoriteIds();
    notifyListeners();
  }

  int get eventsLength => events.length;

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
    await _eventRepo.addFavorite(favoriteId);
    favorites = await getFavoriteIds();
    notifyListeners();
  }

  Future<void> removeFavorite(int favoriteId) async {
    await _eventRepo.removeFavorite(favoriteId);
    favorites = await getFavoriteIds();
    notifyListeners();
  }

  Future<List<int>> getFavoriteIds() async =>
      await _eventRepo.getFavoritesIds();

  bool isFavorite(int index) => favorites.contains(getEventId(index));

  void setSelected(int index) {
    selectedFilter = getCategoryName(index);
    events = categories[index].events;
    notifyListeners();
  }
}
