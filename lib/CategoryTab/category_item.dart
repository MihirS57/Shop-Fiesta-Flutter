import 'package:flutter/material.dart';
import 'package:shop_fiesta/CategoryTab/product_list.dart';

class CategoryItem extends StatelessWidget {
  //const CategoryItem({Key? key}) : super(key: key);
  final String category_name;
  final Color category_color;
  CategoryItem({required this.category_name, required this.category_color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductList.routeName,
            arguments: {"title": category_name});
      },
      child: Card(
        color: category_color,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              category_name,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
