import 'event.dart';

class DomainCategory {
  final int id;
  final String name;
  final List<DomainEvent> events;

  DomainCategory(this.id, this.name, this.events);
}
