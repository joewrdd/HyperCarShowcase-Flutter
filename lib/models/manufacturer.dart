class Manufacturer {
  final String name;
  final String country;
  final String foundedYear;
  final String services;
  final String image;
  final String carMaImage;

  Manufacturer(
      {required this.name,
      required this.country,
      required this.foundedYear,
      required this.services,
      required this.image,
      required this.carMaImage});

  factory Manufacturer.fromMap(Map<String, dynamic> data) {
    return Manufacturer(
      name: data['name'],
      country: data['country'],
      foundedYear: data['founded_year'],
      services: data['services'],
      image: data['image'],
      carMaImage: data['carMaImage'],
    );
  }
}
