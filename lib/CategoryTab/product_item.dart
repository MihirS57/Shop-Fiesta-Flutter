import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  //const ProductItem({Key? key}) : super(key: key);
  final String product_name, product_origin, product_imageUrl;
  final bool product_stock;
  final int product_cost;

  ProductItem(
      {required this.product_imageUrl,
      required this.product_cost,
      required this.product_name,
      required this.product_origin,
      required this.product_stock});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height * 0.27,
      child: Card(
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      product_imageUrl,
                      height: 150,
                      width: 125,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    left: 5,
                    bottom: 15,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            color: Colors.black38),
                        //color: Colors.black38,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              "https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/150px-Flag_of_India.svg.png",
                              height: 23,
                              width: 45,
                            ))),
                  ),
                  /* Positioned(
                    left: 5,
                    bottom: 15,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            color: Colors.black38),
                        //color: Colors.black38,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product_name,
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        )),
                  ), */
                ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                              color: Colors.black38),
                          //color: Colors.black38,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              product_name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '₹ $product_cost',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text('In Stock ', style: TextStyle(fontSize: 15)),
                        Text(
                          '$product_stock',
                          style: TextStyle(
                              color: product_stock ? Colors.blue : Colors.red,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        color: Theme.of(context).primaryColor,
                        child: Text('Space'),
                      ),
                    ],
                  ),
                ),
                /* Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          color: Theme.of(context).primaryColor,
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.work_outline_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Cart',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 7),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.red,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.white,
                              ),
                            ),
                            Text('Wishlist',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 7))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.attach_money_outlined,
                                color: Colors.white,
                              ),
                            ),
                            Text('Buy Now',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 7))
                          ],
                        ),
                      ),
                    )
                  ],
                ) */
              ],
            ),
          ],
        ),
      ),
    );
  }
}
