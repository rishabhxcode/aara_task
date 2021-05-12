import 'package:aara_task/bloc/food_categories_get/food_categories_get_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'food_category_list_item.dart';

class FoodCategoryListScreen extends StatefulWidget {
  @override
  _FoodCategoryListScreenState createState() => _FoodCategoryListScreenState();
}

class _FoodCategoryListScreenState extends State<FoodCategoryListScreen> {
  @override
  void initState() {
    BlocProvider.of<FoodCategoriesGetBloc>(context)
        .add(FoodCategoriesGetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.sort),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: Text(
                "Buddha Bowls",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800]),
              )),
          Expanded(
            child: BlocBuilder<FoodCategoriesGetBloc, FoodCategoriesGetState>(
              builder: (context, state) {
                if (state is FoodCategoriesGotState) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.foodCategories.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return FoodCategoryListItem(
                          foodCategory: state.foodCategories[index],
                          index: index,
                        );
                      });
                }
                if (state is FoodCategoriesGettingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Center(
                  child: Text("Something Went Wrong!"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
