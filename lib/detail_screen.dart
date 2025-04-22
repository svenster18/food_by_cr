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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (icon == Icons.favorite) {
                  icon = Icons.favorite_border;
                } else {
                  icon = Icons.favorite;
                }
              });
            },
            icon: Icon(icon),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Center(
                  child: Text(
                    widget.dessert.name,
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
                        widget.dessert.price,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(widget.dessert.imageAsset,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity--;
                          }
                        });
                      },
                      icon: Icon(Icons.remove_circle),
                    ),
                    Text(quantity.toString()),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
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
                        Text("${widget.dessert.calories} Calories"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.timer),
                        SizedBox(width: 4.0),
                        Text(
                          "${widget.dessert.minCreateTime} - ${widget.dessert.maxCreateTime} min",
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.star),
                        SizedBox(width: 4.0),
                        Text("${widget.dessert.rating}"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.dessert.description,
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(24.0),
            height: 50.0,
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              child: Text("Tambah ke Keranjang"),
            ),
          ),
        ],
      ),
    );
  }
}
