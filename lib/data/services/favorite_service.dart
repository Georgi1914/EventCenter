import 'dart:convert';

import 'package:dio/dio.dart';

import '../requests.dart';
import 'auth_service.dart';

class FavoriteService {
  final Requests _requests;
  final AuthService _authService;

  FavoriteService({
    required Requests requests,
    required AuthService authService,
  })  : _requests = requests,
        _authService = authService;

  Future<List<int>> getFavoriteIds() async {
    final me = await _authService.getMe();
    final List<int> ids = [];
    final favorites = me?.favoriteEvents;
    if (favorites != null) {
      for (final element in favorites) {
        ids.add(element.id);
      }
    }
    return ids;
  }

  Future<int> getMeId() async {
    final me = await _authService.getMe();
    return me?.id ?? 0;
  }

  Future<Response> addFavorite(int favoriteId) async {
    final myId = await getMeId();
    final List<int> newList = await getFavoriteIds();
    newList.add(favoriteId);
    final url = 'http://localhost:1337/api/users/$myId';
    final response = await _requests.putRequest(
      url,
      jsonEncode({'favoriteEvents': newList.map((e) => e.toString()).toList()}),
    );
    return response;
  }

  Future<Response> removeFavorite(int favoriteId) async {
    final myId = await getMeId();
    final List<int> newList = await getFavoriteIds();
    newList.remove(favoriteId);
    final url = 'http://localhost:1337/api/users/$myId';
    final response = await _requests.putRequest(
      url,
      jsonEncode({'favoriteEvents': newList.map((e) => e.toString()).toList()}),
    );
    return response;
  }
}
