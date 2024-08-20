import 'package:equatable/equatable.dart';

class Item extends Equatable{
  int id;
  double price;
  String name;
  String unit;
  String imageUrl;
  Item(this.id,this.price, this.name, this.unit, this.imageUrl);

  Item.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
       price = json['price'],
        unit = json['unit'],
        imageUrl = json['imageUrl'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'unit': unit,
    'imageUrl': imageUrl,
    'id': id,
  };

  @override
  List<Object?> get props => [id,name,price,unit,imageUrl];
}