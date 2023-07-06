import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

          appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          
          padding: const EdgeInsets.only(left:58.0),
          child: const Text("Orders",
          style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}