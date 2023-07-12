import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';

import 'package:flutter/material.dart';
import 'package:mercadinho/src/Config/custom_color.dart';
import 'package:mercadinho/src/models/pages/Home/components/item_tile.dart';
import '../../../Config/app_data.dart' as appdata;
import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 23),
            children: [
              TextSpan(
                text: 'Store',
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                ),
              ),
              TextSpan(
                text: 'Me',
                style: TextStyle(
                  color: CustomColors.customContrastColor,
                ),
              ),
            ],
          ),
        ),
        actions: [ 
          Padding(
            padding: const EdgeInsets.only(top: 23, right: 40),
            child: GestureDetector(
              onTap: () {},
              child: badges.Badge(
                  badgeStyle:
                      BadgeStyle(badgeColor: CustomColors.customContrastColor),
                  badgeContent: const Text(
                    '2',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
                  )),
            ),
          )
        ],
      ),

      //Campos de pesquisa
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customContrastColor,
                    size: 21,
                  ),
                  hintText: 'Pesquise aqui!',
                  hintStyle:
                      TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none))),
            ),
          ),
          //Categorias
          Container(
            height: 40,
            padding: const EdgeInsets.only(left: 25),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryTile(
                    onPressed: () {
                      setState(() {
                        selectCategory = appdata.categorias[index];
                      });
                    },
                    category: appdata.categorias[index],
                    isSelect: appdata.categorias[index] == selectCategory,
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: appdata.categorias.length),
          ),
          //Grid
          Expanded(
            child: GridView.builder(physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10,childAspectRatio: 9/11.5),
                itemCount: appdata.items.length,
                itemBuilder: (_, index) {
                  return ItemTile(item: appdata.items[index],);
                }),
          )
        ],
      ),
    );
  }
}
