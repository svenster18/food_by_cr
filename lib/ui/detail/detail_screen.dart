import 'package:flutter/material.dart';

import '../../model/dessert.dart';
import 'detail_mobile_page.dart';
import 'detail_web_page.dart';

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
