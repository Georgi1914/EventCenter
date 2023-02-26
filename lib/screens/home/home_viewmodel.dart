import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/repositories/events/event.dart';
import '../../models/ui/event.dart';

class HomeVM extends ChangeNotifier {
  final EventRepo _repo;
  HomeVM({required EventRepo eventRepo}) : _repo = eventRepo;

  List<DomainEvent> events = [];
  bool isFavorite = false;

  Future<void> init() async {
    events = await _repo.getAllEvents();
    notifyListeners();
  }

  int get eventsLength => events.length;

  String getEventAddress(int index) => events[index].address;

  String getEventName(int index) => events[index].name;

  String formattedDate(int index) =>
      '${DateFormat('yMMMEd').format(events[index].date)} ${DateFormat('Hm').format(events[index].date)}';

  String generatePicture() {
    final List<String> urls = [
      'https://eu-bloger.eu/images/easyblog_images/399/1920x1080p.jpg',
      'https://images.pexels.com/photos/2263436/pexels-photo-2263436.jpeg?cs=srgb&dl=pexels-teddy-yang-2263436.jpg&fm=jpg',
      'https://www.shutterstock.com/image-photo/crowd-concert-summer-music-festival-260nw-611045375.jpg',
      'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg',
      'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg'
    ];
    final random = Random();
    return urls[random.nextInt(urls.length)];
  }
}
