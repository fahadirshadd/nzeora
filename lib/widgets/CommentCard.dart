import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/CommentsView.dart';
import '../constants/colors.dart';
import 'custom_text.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final blogCommentsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColors.chipsShade2,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Michelle Bright',fontSize: 16.0,fontWeight: FontWeight.w500,),
                  SizedBox(height: 10,),
                  CustomText(text: '3 hr ago',color: AppColors.grey,),
                  SizedBox(height: 10,),
                  CustomText(text: 'Good post',fontSize: 16.0,fontWeight: FontWeight.w500,),
                ],
              ),
            ),
          ),
          SizedBox(height: 5,),
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColors.chipsShade2,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      if(controller.liked.value==true){
                        controller.liked.value=false;
                      }
                      else{
                        controller.liked.value=true;
                      }
                    },
                    child: Row(
                      children: [
                        Icon(controller.liked.value?Icons.thumb_up:Icons.thumb_up_alt_outlined,color: controller.liked.value?AppColors.mainColor:AppColors.grey,),
                        CustomText(text: '  Like',),
                      ],
                    ),
                  ),
                  /////
                  SizedBox(width: 20,),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Row(
                      children: [
                        Icon(Icons.mode_comment_outlined,color: AppColors.grey,),
                        CustomText(text: '  Comment',),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}