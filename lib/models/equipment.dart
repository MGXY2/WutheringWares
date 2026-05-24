class Equipment {

  final int id;

  final String name;

  final String type;

  final int price;

  Equipment({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
  });

  factory Equipment.fromJson(
      Map<String, dynamic> json
      ){

    return Equipment(

      id: json['id'],

      name: json['name'],

      type: json['type'],

      price: json['price'],
    );
  }
}