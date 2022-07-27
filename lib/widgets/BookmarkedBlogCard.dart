import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/Screens/BlogReadView.dart';

import '../constants/colors.dart';
import '../models/blog_data.dart';
import 'custom_text.dart';

class BookmarkedBlogCard extends StatelessWidget {
  Blog blog;
  BookmarkedBlogCard({
    Key? key, required this.blog
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(BlogRead(blog),transition: Transition.rightToLeft);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CustomText(text: '${blog.title}',maxLines: 3,fontSize: 20.0,fontWeight: FontWeight.bold,),
            SizedBox(height: 20,),
            Row(
              children: [
                CustomText(text: 'By ${blog.author}',fontWeight: FontWeight.w600,),
                SizedBox(width: 25,),
                CustomText(text: '${blog.category}',color: AppColors.grey,),
              ],
            ),
            CustomText(text: '______',fontWeight: FontWeight.bold,color: AppColors.mainColor,fontSize: 18.0),

            SizedBox(height: 20,),
            Hero(
              tag: '${blog.image}',
              child: Container(
                height: MediaQuery.of(context).size.height/3.5,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10),),
                  image: DecorationImage(image: AssetImage('${blog.image}'),fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}
