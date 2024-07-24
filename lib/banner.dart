import 'package:dog_shop/constants.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.20,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 80.0, top: 10.0),
              child: Image.asset('assets/images/body.png'),
            ),
            // Column(
            //   children: [
            //     Text('Choose your pet',
            //         style: TextStyle(fontWeight: FontWeight.bold))
            //   ],
            // ),
          ],
        ));
  }
}
