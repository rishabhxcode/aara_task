import 'package:equatable/equatable.dart';

class SubCategory extends Equatable {
  final String shopOwner;
  final String brandName;

  SubCategory({
    required this.shopOwner,
    required this.brandName,
  });

  static SubCategory fromJson(Map<String, dynamic> json) {
    return SubCategory(
      shopOwner: json['shop_owner'],
      brandName: json['brand_name'],
    );
  }

  @override
  List<Object?> get props => [shopOwner, brandName];
}
