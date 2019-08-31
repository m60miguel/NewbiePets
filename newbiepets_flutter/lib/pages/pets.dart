import 'package:flutter/material.dart';

class PetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mascotas"),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          crossAxisSpacing: 2.0,
          children: List.generate(8, (index) {
            return Image.asset(
              'images/pet$index.png',
              width: 200.0,
              height: 200.0,
            );
          }),
        );
      }),
    );
  }
}
