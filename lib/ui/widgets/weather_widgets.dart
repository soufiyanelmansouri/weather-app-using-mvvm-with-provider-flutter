import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/themes/theme_provider.dart';

class WeatherWidget extends StatelessWidget {
  final String image;
  final String text;
  final String secondText;
  // ignore: prefer_typing_uninitialized_variables
  final theme;

  const WeatherWidget(
      {super.key,
      required this.image,
      required this.theme,
      required this.text,
      required this.secondText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage(image),
            height: 50,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: theme ? Colors.white : Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            secondText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: theme ? Colors.white : Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class ThemeWidget extends StatelessWidget {
  final ThemeProvider theme;
  final String imageUrl;
  final Color color1;
  final Color color2;
  final Function onTap;
  final Color activeContainerColor;
  final Color nonActiveContainerColor;

  const ThemeWidget({
    Key? key,
    required this.theme,
    required this.imageUrl,
    required this.color1,
    required this.color2,
    required this.onTap,
    required this.activeContainerColor,
    required this.nonActiveContainerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCirc,
        padding: const EdgeInsets.all(7),
        margin: const EdgeInsets.only(right: 2),
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            color: theme.box.get('theme')
                ? activeContainerColor
                : nonActiveContainerColor,
            borderRadius: BorderRadius.circular(20)),
        child: SvgPicture.asset(
          imageUrl,
          color: theme.box.get('theme') ? color1 : color2,
        ),
      ),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String temp;
  // ignore: prefer_typing_uninitialized_variables
  final theme;

  const WeatherInfo(
      {super.key,
      required this.imageUrl,
      required this.description,
      required this.theme,
      required this.temp});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Align(
          alignment: Alignment.center,
          child: Image(
            image: NetworkImage(
              imageUrl,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            description,
            style: TextStyle(
              color: theme ? Colors.white : Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            temp,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: theme ? Colors.white : Colors.black,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
