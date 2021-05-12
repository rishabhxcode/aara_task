import 'package:aara_task/model/food_category.dart';
import 'package:aara_task/model/subcategory.dart';
import 'package:dio/dio.dart';

const urlFoodListGet =
    'https://project252.aaratechnologies.in/web/common/category';

const urlSubcategoryGet =
    'https://project252.aaratechnologies.in/web/common/subcategory/1';

class FoodCategoryNwRepository {
  Dio dioHttp = Dio();
  Future<List<FoodCategory>> getFoodCategories() async {
    List<FoodCategory> list = [];
    try {
      var response = await dioHttp.get(urlFoodListGet);
      print(response.data['response_data']['data']);
      if (response.statusCode == 200) {
        response.data['response_data']['data'].forEach((element) {
          list.add(FoodCategory.fromJson(element));
        });
        return list;
      }
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
    throw Exception('Something went wrong');
  }

  Future<SubCategory?>? getSubCategory() async {
    try {
      var response = await dioHttp.get(urlSubcategoryGet);
      print(response.statusCode);
      if (response.statusCode == 203) {
        return SubCategory.fromJson(response.data['response_data']['data'][1]);
      }
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
    throw Exception('Something went wrong');
  }
}
