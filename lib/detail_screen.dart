import 'package:flutter/material.dart';
import 'model/dessert.dart';

class DetailScreen extends StatefulWidget {
  final Dessert dessert;

  const DetailScreen({super.key, required this.dessert});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var icon = Icons.favorite_border;
  var quantity = 1;

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

  void setFavorite() {
    setState(() {
      if (icon == Icons.favorite) {
        icon = Icons.favorite_border;
        _showToast(context, "Berhasil menghapus favorit");
      } else {
        icon = Icons.favorite;
        _showToast(context, "Berhasil menambahkan favorit");
      }
    });
  }

  void addQuantity() {
    setState(() {
      quantity++;
    });
  }

  void removeQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(
            dessert: widget.dessert,
            onAddFavorite: setFavorite,
            onAddQuantity: addQuantity,
            onRemoveQuantity: removeQuantity,
            icon: icon,
            quantity: quantity,
          );
        } else {
          return DetailMobilePage(
            dessert: widget.dessert,
            onAddFavorite: setFavorite,
            onAddQuantity: addQuantity,
            onRemoveQuantity: removeQuantity,
            icon: icon,
            quantity: quantity,
          );
        }
      },
    );
  }
}

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
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                  Expanded(child: Hero(tag: dessert.name, child: Image.asset(dessert.imageAsset))),
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
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0,),
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
            Expanded(child: Hero(tag: dessert.name, child: Image.asset(dessert.imageAsset)),),
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
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 16.0,),
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
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0,),
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
                                    _showToast(context, "Berhasil menambahkan ke Keranjang");
                                    Navigator.pop(context);
                                  },
                                  child: Text("Tambah ke Keranjang"),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.0,),
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