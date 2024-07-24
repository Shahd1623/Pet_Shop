import 'package:dog_shop/body.dart';
import 'package:dog_shop/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Pet Shop',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundColor: kPrimaryColor,
          )
        ],
      ),
      body: Body(),
      drawer: Drawer(),
    );
  }
}
