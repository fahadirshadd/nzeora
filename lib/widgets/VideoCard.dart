import 'package:flutter/material.dart';

import 'custom_text.dart';

class VideoCard extends StatelessWidget {
  String videoTitle, thumbnail;
  VideoCard({
    Key? key, required this.videoTitle, required this.thumbnail
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/3.5,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20),),
            image: DecorationImage(image: NetworkImage('$thumbnail'),fit: BoxFit.cover),
          ),
          child: Icon(Icons.play_arrow_rounded,size: 100,color: Colors.white,),
        ),
        SizedBox(height: 20,),
        CustomText(text: 'Watch Video:  $videoTitle',fontSize: 20.0,fontWeight: FontWeight.bold,maxLines: 2,overflow: TextOverflow.ellipsis,),
        SizedBox(height: 30,),
      ],
    );
  }
}
