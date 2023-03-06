import 'dart:developer';

import '../models/network/category.dart';
import '../models/network/event.dart';
import 'requests.dart';

class Api {
  final Requests _requests;

  Api({required Requests requests}) : _requests = requests;

  Future<List<NetworkEvent>> getEvents() async {
    try {
      const url = '/api/events';
      final Map<String, String> queryParams = {'populate': 'mainPicture'};
      final data = await _requests.getRequest(url, queryParams: queryParams);
      return (data['data'] as List<dynamic>)
          .map((e) => NetworkEvent.fromJson(e as Map<String, dynamic>))
          .toList();
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<NetworkEvent?> getEventById(int id) async {
    try {
      final url = '/api/events/$id';
      final Map<String, String> queryParams = {'populate': 'mainPicture'};
      final data = await _requests.getRequest(url, queryParams: queryParams);
      return NetworkEvent.fromJson(data['data']);
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<List<NetworkCategory>> getCategories() async {
    try {
      const url = '/api/categories';
      final Map<String, String> queryParams = {
        'populate[events][populate]': 'mainPicture'
      };
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
