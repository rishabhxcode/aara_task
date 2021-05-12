import 'dart:collection';

import 'package:aara_task/repository/food_category_nw_repository.dart';
import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatefulWidget {
  static const routeName = '/item-detail-screen';
  final int index;
  final Image image;

  const CategoryDetailScreen(
      {Key? key, required this.index, required this.image})
      : super(key: key);

  @override
  _CategoryDetailScreenState createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  FoodCategoryNwRepository repo = FoodCategoryNwRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned(
                    top: -200,
                    left: 0,
                    right: 0,
                    child: Hero(tag: '${widget.index}', child: widget.image),
                  )
                ],
              )),
          Expanded(
            flex: 5,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: FutureBuilder(
                    future: repo.getSubCategory(),
                    builder: (context, snap) {
                      if (snap.hasData) {
                        print(snap.data);
                        var detail;
                        if (snap.data != null) {
                          detail = snap.data;
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Text(
                                'some text',
                                style: TextStyle(fontSize: 11),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      width: 0.25, color: Colors.grey)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                detail.brandName,
                                style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(detail.shopOwner),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                'WHAT\'S IN IT?',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              'Esse adipisicing ex magna exercitation eiusmod tempor laboris veniam et. Duis deserunt nisi est ex dolor proident laboris magna. Elit excepteur consequat irure nostrud tempor id commodo ea esse mollit velit incididunt non Lorem. Minim dolor velit non eu sit eu consequat esse. Fugiat consequat Lorem amet eu eu aliquip qui. Dolore irure reprehenderit velit excepteur quis dolore labore occaecat duis minim nisi.',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                'Allergy Info'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              'some text',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 4),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.grey,
                                    size: 28,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      '1',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Icon(
                                    Icons.add_circle_outline,
                                    size: 28,
                                  ),
                                  const Spacer(),
                                  Text(
                                    '₹ 230',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 28),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 16),
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(vertical: 16)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ))),
                                    onPressed: () {},
                                    child: Text("ADD TO CART")))
                          ],
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    })),
          )
        ],
      ),
    );
  }
}
