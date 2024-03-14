import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fresho/dataModel/bannerData.dart';

class Banners extends StatefulWidget {
  const Banners({super.key});

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),

      child: CarouselSlider.builder(itemCount: bannerImage.length,
          itemBuilder: (context,index,realIndex){
      final banner = bannerImage[index];
      return buildBanner(banner,index);

          }, options: CarouselOptions(
          autoPlay: true,
enlargeCenterPage: true,
          height: 130))
    );
  }

  Widget buildBanner(String banner, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
     decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.circular(10),
       boxShadow: const [
         BoxShadow(offset: Offset(0, 2),
         blurRadius: 1),
       ],
       image: DecorationImage(image: NetworkImage(banner),
       fit: BoxFit.cover)
     ),
    );
  }
}
