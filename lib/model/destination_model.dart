import 'package:equatable/equatable.dart';


class DestinationModel extends Equatable{

  final String id;
  final String name;
  final String city;
  final String imageUrl;
  final String about;
  final String location;
  final String category;
  final int price;

  DestinationModel({
  required this.id,
  this.name ='',
  this.city='',
  this.imageUrl='',
  this.about='',
  this.location='',
    this.category='',
  this.price= 0,

});


  factory DestinationModel.fromJson(String id,Map<String, dynamic>json)=>
      DestinationModel(
          id: id,
        name: json['name'],
        city: json['city'],
        imageUrl: json['imageUrl'],
        about: json['about'],
        location: json['location'],
        category: json['category'],
        price: json['price']

      );



  @override
  List<Object?> get props => throw UnimplementedError();

}