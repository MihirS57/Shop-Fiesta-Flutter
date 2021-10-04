import 'package:flutter/material.dart';
import 'package:shop_fiesta/CategoryTab/category_item.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = '\home-categories';
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text('Home Categories'),
      ), */
      body: Container(
        alignment: Alignment.center,
        child: GridView(
          padding: EdgeInsets.all(10),
          children: [
            CategoryItem(
                category_name: 'Mobiles',
                category_color: Theme.of(context).primaryColor),
            CategoryItem(
                category_name: 'Home',
                category_color: Theme.of(context).primaryColor),
            CategoryItem(
                category_name: 'Electronics',
                category_color: Theme.of(context).primaryColor),
            CategoryItem(
                category_name: 'Fashion',
                category_color: Theme.of(context).primaryColor),
            CategoryItem(
                category_name: 'Grocery',
                category_color: Theme.of(context).primaryColor),
            CategoryItem(
                category_name: 'Home Appliances',
                category_color: Theme.of(context).primaryColor),
          ],
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:
                  200, //width of each item, so if windows size=300, then one grid item and if 500 then 2
              childAspectRatio: 1.5, //length to breath ration
              mainAxisSpacing: 20, // both means spacing in rows and columns
              crossAxisSpacing: 20),
        ),
      ),
    );
  }
}
