import 'package:flutter/material.dart';

import '../../data/repositories/events/event.dart';
import '../../models/ui/event.dart';

class HomeVM extends ChangeNotifier {
  final EventRepo _repo;
  HomeVM({required EventRepo eventRepo}) : _repo = eventRepo;

  List<DomainEvent> events = [];

  Future<void> init() async {
    events = await _repo.getAllEvents();
  }
}
