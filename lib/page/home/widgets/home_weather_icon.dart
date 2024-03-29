import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/apps/utils/const.dart';

class HomeWeatherIcon extends StatelessWidget {
  const HomeWeatherIcon({super.key, required this.nameIcon});
  final String nameIcon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width / 1.5,
      padding: const EdgeInsets.all(20.0),
      child: Image.asset(
        AssetCustom.getLinkImage(nameIcon),
        fit: BoxFit.cover,
      ),
    );
  }
}
