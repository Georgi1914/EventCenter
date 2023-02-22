import '../models/network/event.dart';
import 'requests.dart';

class Api {
  final Requests _requests;

  Api({required Requests requests}) : _requests = requests;

  Future<List<NetworkEvent>> getEvents() async {
    const url = '/events';
    final List<dynamic> data = await _requests.getRequest(url);
    final List<NetworkEvent> events = List<NetworkEvent>.from(
      data.map((e) => NetworkEvent.fromJson(e as Map<String, dynamic>)),
    );
    return events;
  }
}
