class CatImage {
  final String imageUrl;
  final String name;
  final String description;
  CatImage({
    required this.imageUrl,
    required this.name,
    required this.description,
  });

  factory CatImage.fromJson(Map<String, dynamic> json) {
    return CatImage(
      imageUrl: json['url'],
      name: json['breeds'][0]['name'],
      description: json['breeds'][0]['description'],
    );
  }
}
