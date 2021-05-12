part of 'food_categories_get_bloc.dart';

abstract class FoodCategoriesGetState extends Equatable {
  const FoodCategoriesGetState();

  @override
  List<Object> get props => [];
}

class FoodCategoreisGetInitial extends FoodCategoriesGetState {}

class FoodCategoriesGettingState extends FoodCategoriesGetState {}

class FoodCategoriesGotState extends FoodCategoriesGetState {
  final List<FoodCategory> foodCategories;

  FoodCategoriesGotState({required this.foodCategories});

  @override
  List<Object> get props => [foodCategories];
}

class FoodCategoriesFailedState extends FoodCategoriesGetState{}
