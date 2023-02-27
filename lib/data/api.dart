import 'dart:developer';

import '../models/network/category.dart';
import '../models/network/event.dart';
import 'requests.dart';

class Api {
  final Requests _requests;

  Api({required Requests requests}) : _requests = requests;

  Future<List<NetworkEvent>> getEvents() async {
    try {
      const url = '/events';
      final data = await _requests.getRequest(url);
      return (data['data'] as List<dynamic>)
          .map((e) => NetworkEvent.fromJson(e as Map<String, dynamic>))
          .toList();
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<NetworkCategory>> getCategories() async {
    try {
      const url = '/categories';
      final Map<String, String> queryParams = {'populate': 'events'};
      final data = await _requests.getRequest(url, queryParams: queryParams);
      return (data['data'] as List<dynamic>)
          .map((e) => NetworkCategory.fromJson(e as Map<String, dynamic>))
          .toList();
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }
}
