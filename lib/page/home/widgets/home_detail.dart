import 'package:flutter/material.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail(
      {super.key, required this.speedWind, required this.humidity});
  final num speedWind;
  final num humidity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset('assets/images/icons/Vector.png'),
            Text(
              '$speedWind Km/h',
              style: const TextStyle(
                fontSize: 21,
                color: Colors.white,
              ),
            )
          ],
        ),
        Column(
          children: [
            Image.asset('assets/images/icons/humidity.png'),
            Text(
              '$humidity%',
              style: const TextStyle(
                fontSize: 21,
                color: Colors.white,
              ),
            )
          ],
        ),
      ],
    );
  }
}
