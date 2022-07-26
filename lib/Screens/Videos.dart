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
              VideoCard(videoTitle: 'Anjelina & Jhon become successful in a year',videoUrl: 'https://assets.mixkit.co/videos/preview/mixkit-two-coworkers-talking-and-laughing-4872-large.mp4'),
              VideoCard(videoTitle: 'How to spend quality time with friends',videoUrl: 'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4'),
              VideoCard(videoTitle: 'Beautiful Scenary of mountains & clouds',videoUrl: 'https://assets.mixkit.co/videos/preview/mixkit-going-down-a-curved-highway-down-a-mountain-41576-large.mp4'),
            ],
          ),
        ),
      ),
    );
  }
}

