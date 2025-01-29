class Car {
  final String brand;
  final String price;
  final String model;
  final String image;
  final int speed;
  final int horsepower;
  final String description;

  Car(
      {required this.brand,
      required this.model,
      required this.price,
      required this.image,
      required this.speed,
      required this.horsepower,
      required this.description});

  factory Car.fromMap(Map<String, dynamic> data) {
    return Car(
      brand: data['brand'],
      model: data['model'],
      price: data['price'],
      image: data['image'],
      speed: data['top_speed'],
      horsepower: data['horsepower'],
      description: data['description'],
    );
  }
}
