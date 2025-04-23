import 'package:flutter/material.dart';

import 'dessert_grid.dart';

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
        },
      ),
    );
  }
}
