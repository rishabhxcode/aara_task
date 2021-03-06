import 'package:aara_task/bloc/food_categories_get/food_categories_get_bloc.dart';
import 'package:aara_task/theme/theme.dart';
import 'package:aara_task/ui/food_category_list_screen.dart';
import 'package:aara_task/ui/category_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodCategoriesGetBloc>(
      create: (context) => FoodCategoriesGetBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: defaultTheme,
        home: FoodCategoryListScreen(),
      ),
    );
  }
}
