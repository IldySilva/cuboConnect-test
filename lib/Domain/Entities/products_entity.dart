class Product {
  int? id;
  String? name;
  double? price;
  bool? isSelected;

  Product({this.name, this.price, this.id,this.isSelected=true});

  toJson() {
    return ({"name": name, "price": price});
  }

  factory Product.fromMap(map) {
    return Product(id: map["id"], name: map["name"], price: map["price"]);
  }
}
