import 'package:flutter/material.dart';

import '../../model/dessert.dart';

class DetailWebPage extends StatelessWidget {
  final Dessert dessert;
  final VoidCallback onAddFavorite;
  final VoidCallback onAddQuantity;
  final VoidCallback onRemoveQuantity;
  final IconData icon;
  final int quantity;

  const DetailWebPage({
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Hero(
                tag: dessert.name,
                child: Image.asset(dessert.imageAsset),
              ),
            ),
            Expanded(
              child: Center(
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        SizedBox(height: 16.0),
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
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                        SizedBox(height: 16.0),
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
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: SizedBox(
                                height: 50.0,
                                child: FilledButton(
                                  onPressed: () {
                                    _showToast(
                                      context,
                                      "Berhasil menambahkan ke Keranjang",
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: Text("Tambah ke Keranjang"),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            IconButton(
                              onPressed: () {
                                onAddFavorite();
                              },
                              icon: Icon(icon),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
