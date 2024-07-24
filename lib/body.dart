import 'package:dog_shop/Models/products.dart';
import 'package:dog_shop/banner.dart';
import 'package:dog_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          //postion of the container and all the elements in the column
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeBanner(size: size),
            //now the pets section
            SizedBox(
              height: 20,
            ),

            Row(
              children: [
                Text(
                  'New Pets',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4, //width / hight
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        height: 160,
                        width: 140,
                        color: kPrimaryColor,
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/dog3.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        products[0].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        '\$${products[0].price}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: kPrimaryColor),
                      ),

                      // Container(
                      //   height: 180,
                      //   width: 160,
                      //   decoration: BoxDecoration(
                      //       color: kPrimaryColor,
                      //       borderRadius: BorderRadius.circular(20)),
                      //   child: Image.asset(products[0].image),
                      // ),
                      // //create the price and the name of the pet
                      // Text(
                      //   products[0].title,
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold, fontSize: 16),
                      // ),
                      // Text(
                      //   '\$${products[0].price}',
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 16,
                      //       color: kPrimaryColor),
                      // ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
