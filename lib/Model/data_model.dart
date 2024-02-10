class DataModel {
  String name;
  String img;
  String description;
  String location;
  int stars;
  int people;
  int price;

  DataModel(
      {required this.description,
      required this.img,
      required this.name,
      required this.location,
      required this.people,
      required this.price,
      required this.stars});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        description: json["description"],
        img: json["img"],
        name: json["name"],
        location: json["location"],
        people: json["people"],
        price: json["price"],
        stars: json["stars"]);
  }
}
