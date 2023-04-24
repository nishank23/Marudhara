class CategoriesData {
  final int? id;
  final String? image;
  final String? name;
  const CategoriesData({
    required this.id,
    required this.image,
    required this.name,
  });

  factory CategoriesData.fromJson(Map<String, dynamic> json) {
    return CategoriesData(
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }
}
