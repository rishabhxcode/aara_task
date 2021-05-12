import 'package:equatable/equatable.dart';

class FoodCategory extends Equatable {
  final String? catId;
  final String? title;
  final String? description;
  final String? imagePath;

  FoodCategory(
      {required this.catId,
      required this.title,
      required this.description,
      required this.imagePath});

  static FoodCategory fromJson(Map<String, dynamic> json) { 
    return FoodCategory(
        catId: json['cat_id'],
        title: json['title'],
        description: json['description'],
        imagePath: json['image_path']);
  }

  // Map<dynamic, dynamic> toJson() {
  //   return {
  //     'cat_id': this.catId,
  //     'title': this.title,
  //     'description': this.description,
  //     'image_path': this.imagePath
  //   };
  // }

  @override
  List<Object?> get props => [catId, title, description, imagePath];
}
