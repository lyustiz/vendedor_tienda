import 'package:flutter/material.dart';

class VendedorScreen extends StatelessWidget {
  const VendedorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.lightBlue,
      child: SizedBox(
        height: 300,
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50, //we give the image a radius of 50
                  backgroundImage: NetworkImage(
                      'https://webstockreview.net/images/male-clipart-professional-man-3.jpg'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
