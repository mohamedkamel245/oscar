import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:oscar/model/sliderModel.dart';

Widget carouselSlider(List<SliderModel> magecarousel) {
    return Container(
  
        child: CarouselSlider(
          options: CarouselOptions(
            height: 320,
            autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: Duration(milliseconds: 5000),
          ),
          items:magecarousel.map(
                    (imageUrl) => Container(
                      
                      child: Image.network(
                        
                  imageUrl.slide_image,
                        width: 400,
                        
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                  .toList(),
        
      ),
);
}
