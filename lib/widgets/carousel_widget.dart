import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
      items: [
        Container(
          margin: const EdgeInsets.all(6.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2022/03/03/17/53/thuja-7045798__340.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(6.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2022/12/04/18/15/pesto-7635158__340.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(6.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2022/11/23/16/03/butterfly-7612383__340.jpg'),
                fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
