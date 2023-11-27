class Product {
  final int? id;
  final String image;
  final String category;
  final int price;
  final int ranking;
  final String title;
  final String description;
  final int calories;
  final String additives;
  final String vitamins;

  Product({
    this.id,
    required this.image,
    required this.category,
    required this.price,
    required this.ranking,
    required this.title,
    required this.description,
    required this.calories,
    required this.additives,
    required this.vitamins,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json['id'],
        image: json['image'] ?? "",
        category: json['category'],
        price: json['precio'],
        ranking: json['ranking'],
        title: json['title'],
        description: json['description'],
        calories: json['calories'],
        additives: json['additives'],
        vitamins: json['vitamins'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'category': category,
      'precio': price,
      'ranking': ranking,
      'title': title,
      'description': description,
      'calories': calories,
      'additives': additives,
      'vitamins': vitamins,
    };
  }
}
