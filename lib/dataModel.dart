class DataModel {
  String? id;
  String? name;
  int? quantity;
  double? price;
  DataModel({required this.id, required this.name, this.quantity, this.price});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'quantity': quantity,
      'price': price,
    };
  }

  DataModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        quantity = json['quantity'],
        price = json['price'];
}
