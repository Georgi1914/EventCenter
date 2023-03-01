import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/repositories/category/category.dart';
import '../../data/repositories/events/event.dart';
import '../../global_variables.dart';
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
  bool isFavorite = false;
  String selectedFilter = 'All';

  Future<void> init() async {
    events = await _eventRepo.getAllEvents();
    categories = await _categoryRepo.getCategories();
    notifyListeners();
  }

  int get eventsLength => events.length;

  String getEventAddress(int index) => events[index].address;

  String getEventName(int index) => events[index].name;

  DomainEvent getEvent(int index) => events[index];

  String formattedDate(int index) =>
      '${DateFormat('yMMMEd').format(events[index].date)} ${DateFormat('Hm').format(events[index].date)}';

  int get categoriesLength => categories.length;

  String getCategoryName(int index) => categories[index].name;

  bool isSelected(int index) => getCategoryName(index) == selectedFilter;

  void setSelected(int index) {
    selectedFilter = getCategoryName(index);
    events = categories[index].events;
    notifyListeners();
  }

  String generatePicture() {
    final random = Random();
    return imageUrls[random.nextInt(imageUrls.length)];
  }
}
