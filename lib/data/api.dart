import 'dart:developer';

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
}
