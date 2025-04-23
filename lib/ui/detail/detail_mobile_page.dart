import 'package:flutter/material.dart';

import '../../model/dessert.dart';

class DetailMobilePage extends StatelessWidget {
  final Dessert dessert;
  final VoidCallback onAddFavorite;
  final VoidCallback onAddQuantity;
  final VoidCallback onRemoveQuantity;
  final IconData icon;
  final int quantity;

  const DetailMobilePage({
    super.key,
    required this.dessert,
    required this.onAddFavorite,
    required this.onAddQuantity,
    required this.onRemoveQuantity,
    required this.icon,
    required this.quantity,
  });

  void _showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3), // Adjust duration as needed
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              onAddFavorite();
            },
            icon: Icon(icon),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      dessert.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Rp ", style: TextStyle(color: Colors.grey)),
                        Text(
                          dessert.price,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Hero(
                      tag: dessert.name,
                      child: Image.asset(dessert.imageAsset),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          onRemoveQuantity();
                        },
                        icon: Icon(Icons.remove_circle),
                      ),
                      Text(quantity.toString()),
                      IconButton(
                        onPressed: () {
                          onAddQuantity();
                        },
                        icon: Icon(Icons.add_circle),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.local_fire_department),
                          SizedBox(width: 4.0),
                          Text("${dessert.calories} Calories"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.timer),
                          SizedBox(width: 4.0),
                          Text(
                            "${dessert.minCreateTime} - ${dessert.maxCreateTime} min",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star),
                          SizedBox(width: 4.0),
                          Text("${dessert.rating}"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    dessert.description,
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            height: 50.0,
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                _showToast(context, "Berhasil menambahkan ke Keranjang");
                Navigator.pop(context);
              },
              child: Text("Tambah ke Keranjang"),
            ),
          ),
        ],
      ),
    );
  }
}
