class DomainEvent {
  final int id;
  final String name;
  final DateTime date;
  final String description;
  final String address;

  DomainEvent(this.id, this.name, this.date, this.description, this.address);
}
