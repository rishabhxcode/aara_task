import 'dart:async';

import 'package:aara_task/model/food_category.dart';
import 'package:aara_task/repository/food_category_nw_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'food_categories_get_event.dart';
part 'food_categories_get_state.dart';

class FoodCategoriesGetBloc
    extends Bloc<FoodCategoriesGetEvent, FoodCategoriesGetState> {
  FoodCategoriesGetBloc() : super(FoodCategoreisGetInitial());

  FoodCategoryNwRepository repo = FoodCategoryNwRepository();
  @override
  Stream<FoodCategoriesGetState> mapEventToState(
    FoodCategoriesGetEvent event,
  ) async* {
    if (event is FoodCategoriesGetEvent) {
      try {
        yield FoodCategoriesGettingState();
        var list = await repo.getFoodCategories();
        yield FoodCategoriesGotState(foodCategories: list);
      } catch (e) {
        print(e);
        yield FoodCategoriesFailedState();
      }
    }
  }
}
