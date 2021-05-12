import 'package:aara_task/model/food_category.dart';
import 'package:aara_task/ui/category_detail_screen.dart';
import 'package:flutter/material.dart';

class FoodCategoryListItem extends StatelessWidget {
  final FoodCategory foodCategory;
  final int index;

  static List<String> images = [
    'https://i.pinimg.com/originals/dd/e4/42/dde44279dd7a88ef2b800966a062ad59.png',
    'https://i.dlpng.com/static/png/7079473_preview.png'
  ];

  const FoodCategoryListItem(
      {Key? key, required this.foodCategory, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryDetailScreen(
                    index: index,
                    image: Image.network(
                      images[index % 2],
                      fit: BoxFit.contain,
                    ))));
      },
      child: Container(
        height: 250,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: 250,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.grey.shade100, Colors.grey.shade200],
                  )),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 36, right: 24, top: 16, bottom: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 8, bottom: 24),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(foodCategory.imagePath.toString()),
                          ),
                          Text(
                            foodCategory.title.toString(),
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'long detailed description will appear here',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ),
            Positioned(
              right: -80,
              child: Container(
                height: 220,
                width: 220,
                child: Hero(
                  tag: '$index',
                  child: Image.network(
                    images[index % 2],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
