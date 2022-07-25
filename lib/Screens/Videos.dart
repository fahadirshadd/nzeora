import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/VideoCard.dart';
import '../widgets/custom_text.dart';

class Videos extends StatefulWidget {
  const Videos({Key? key}) : super(key: key);

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0,left: 30,right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: ()=>Get.back(),
                    child: Container(
                      height: 35,
                      width: 35,
                      child: null,
                    ),
                  ),
                  CustomText(text: 'Watch Videos',fontSize: 25.0,fontWeight: FontWeight.w600,),
                  SizedBox(width: 20,child: null,),
                ],
              ),
              SizedBox(height: 20,),
              VideoCard(videoTitle: 'Anjelina & Jhon become successful in a year',thumbnail: 'https://images.pexels.com/photos/937482/pexels-photo-937482.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
              VideoCard(videoTitle: 'How to spend quality time with friends',thumbnail: 'https://images.pexels.com/photos/708392/pexels-photo-708392.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              VideoCard(videoTitle: 'Hack for happy family time',thumbnail: 'https://images.pexels.com/photos/8158044/pexels-photo-8158044.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            ],
          ),
        ),
      ),
    );
  }
}

