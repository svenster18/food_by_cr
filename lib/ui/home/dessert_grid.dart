import 'package:flutter/material.dart';

import '../../model/dessert.dart';
import '../detail/detail_screen.dart';

class DessertGrid extends StatelessWidget {
  final int gridCount;

  const DessertGrid({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        children:
            dessertList.map((dessert) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(dessert: dessert),
                    ),
                  );
                },
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Hero(
                            tag: dessert.name,
                            child: Image.asset(dessert.imageAsset),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dessert.name,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Rp ",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        dessert.price,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              DetailScreen(dessert: dessert),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.add_circle),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
