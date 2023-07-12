import 'package:flutter/material.dart';
import 'package:mercadinho/src/Config/custom_color.dart';
import 'package:mercadinho/src/models/pages/product/item_model.dart';

import 'package:mercadinho/src/models/pages/product/product_screen.dart';
import 'package:mercadinho/src/services/utils_services.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;
  ItemTile({super.key, required this.item});
//modelo das grid na pagina home
  final UtilsServices utilsServices = UtilsServices();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //conteudo
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return  ProductScreen(item: item,);
            }));
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //imagem
                  Expanded(child: Image.asset(item.imgUrl)),
                  //Nome
                  Text(
                    item.itemName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  //Preço- unidade
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: CustomColors.customSwatchColor),
                      ),
                      Text(
                        '/${item.unit}',
                        style: TextStyle(
                            color: Colors.green.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        //botao de adicionar no carrinho
        Positioned(
            right: 4,
            top: 4,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: CustomColors.customSwatchColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(20))),
                height: 40,
                width: 35,
                child: const Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ))
      ],
    );
  }
}
