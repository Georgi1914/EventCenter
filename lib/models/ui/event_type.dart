class EventType {
  final String name;
  final DateTime date;
  final String description;
  final String address;
  final int categoryId;
  final int userId;
  final Map<String, dynamic> mainPicture;

  EventType(
    this.name,
    this.date,
    this.description,
    this.address,
    this.categoryId,
    this.userId,
    this.mainPicture,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'date': date.toString(),
        'description': description,
        'address': address,
        'categories': categoryId,
        'creator': userId,
        'mainPicture': mainPicture
      };
}
