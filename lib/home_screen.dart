import 'package:flutter/material.dart';
import 'package:food_by_cr/detail_screen.dart';
import 'model/dessert.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        title: Text(
          'Food by CR',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 750) {
            return DessertGrid(gridCount: 2);
          } else if (constraints.maxWidth <= 1200) {
            return DessertGrid(gridCount: 4);
          } else {
            return DessertGrid(gridCount: 6);
          }
        }
      ),
    );
  }
}

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
                MaterialPageRoute(builder: (context) => DetailScreen(dessert: dessert,)),
              );
            },
            child: Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(flex: 2, child: Image.asset(dessert.imageAsset)),
                    SizedBox(height: 8.0,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dessert.name,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),),
                              Row(
                                children: [
                                  Text("Rp ",
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),),
                                  Text(dessert.price,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )

                            ],
                          ),
                          IconButton(
                            onPressed: () {},
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