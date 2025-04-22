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
      body: GridView.count(
        crossAxisCount: 2,
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
                        Image.asset(dessert.imageAsset, height: 120,),
                        Row(
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
