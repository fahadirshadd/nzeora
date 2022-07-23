import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/Screens/BlogReadView.dart';

import '../constants/colors.dart';
import '../models/blog_data.dart';
import 'custom_text.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;
  const BlogCard({
    Key? key,
    required this.blog
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>BlogRead(blog),transition: Transition.rightToLeft);
      },
      child: Container(
        color: AppColors.chipsShade,
        child: Row(
          children: [
            Hero(
              tag: '${blog.image}',
              child: Container(
                height: MediaQuery.of(context).size.height/6,
                width: MediaQuery.of(context).size.width/3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),),
                  image: DecorationImage(image: AssetImage(blog.image!),fit: BoxFit.cover),
                ),
              ),
            ),
            //SizedBox(width: 10,),
            Container(
              width: MediaQuery.of(context).size.width/1.8,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: blog.title,maxLines: 2,fontSize: 19.0,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 25,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        children: [
                          CustomText(text: blog.date,color: AppColors.grey,),
                          CustomText(text: ' | ',color: AppColors.grey,),
                          CustomText(text: blog.category,color: AppColors.grey,overflow: TextOverflow.ellipsis,maxLines:1),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}