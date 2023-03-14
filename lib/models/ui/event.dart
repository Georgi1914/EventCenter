import 'picture.dart';

class DomainEvent {
  final int id;
  final String name;
  final DateTime date;
  final String description;
  final String address;
  final DomainImage image;

  DomainEvent(this.id, this.name, this.date, this.description, this.address,
      this.image);
}
