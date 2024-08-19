class POI {
  final String id;
  final String title;
  final String description;
  final String category;
  final double latitude;
  final double longitude;

  POI({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory POI.fromMap(Map<String, dynamic> map) {
    return POI(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
