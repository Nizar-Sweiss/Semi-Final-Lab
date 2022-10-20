import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<String> images = [
  "images/LTUC_Slider_1.png",
  "images/LTUC_Slider_2.png",
  "images/LTUC_Slider_3.png",
  "images/LTUC_Slider_4.png",
  "images/LTUC_Slider_5.png",
  "images/LTUC_Slider_6.png",
];

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          CarouselSlider(
            items: [
              ...images.map(
                (image) => Image.asset(
                  image,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              )
            ],
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              autoPlay: true,
              autoPlayCurve: Curves.easeInToLinear,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 2000),
              viewportFraction: 1,
            ),
          ),
          Positioned(
            bottom: 30,
            left: 60,
            child: Image.asset(
              'images/LTUC_logo.png',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
