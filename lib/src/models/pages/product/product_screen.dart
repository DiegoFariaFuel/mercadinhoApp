import 'package:flutter/material.dart';
import 'package:mercadinho/src/models/pages/product/item_model.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key,required  this.item});
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Column(children: [Expanded(child: Image.asset(item.imgUrl))],),
    );
  }
}
