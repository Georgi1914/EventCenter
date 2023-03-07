class EventType {
  final String name;
  final String date;
  final String description;
  final String address;
  final int categoryId;
  final int userId;
  final List<int> binaryPicture;

  EventType(
    this.name,
    this.date,
    this.description,
    this.address,
    this.categoryId,
    this.userId,
    this.binaryPicture,
  );
}
