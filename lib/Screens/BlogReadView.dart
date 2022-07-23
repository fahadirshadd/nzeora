import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/constants/colors.dart';
import 'package:nzeora/models/blog_data.dart';
import 'package:nzeora/widgets/custom_text.dart';

import '../widgets/MoreBlogOptionsDialog.dart';
import '../widgets/ShareDialog.dart';
import 'CommentsView.dart';

class BlogRead extends StatefulWidget {
  Blog blog;
   BlogRead(this.blog, {Key? key}) : super(key: key);

  @override
  State<BlogRead> createState() => _BlogReadState();
}

class _BlogReadState extends State<BlogRead> {

  userBlogActivityController checkControl=Get.put(userBlogActivityController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Obx(
          ()=> Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if(checkControl.liked.value==true){
                        checkControl.liked.value=false;
                      }
                      else{
                        checkControl.liked.value=true;
                      }
                    },
                    child: Row(
                      children: [
                        Icon(checkControl.liked.value?Icons.thumb_up:Icons.thumb_up_alt_outlined,color: checkControl.liked.value?AppColors.black:AppColors.grey,),
                        SizedBox(width: 3,),
                        CustomText(text: '15',color: AppColors.grey,)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(checkControl.comment.value==true){
                        checkControl.comment.value=false;
                        Get.to(()=>Comments(blog: widget.blog),transition: Transition.rightToLeft);
                      }
                      else{
                        checkControl.comment.value=true;
                        Get.to(()=>Comments(blog: widget.blog),transition: Transition.rightToLeft);
                      }
                    },
                    child: Row(
                      children: [
                        Icon(checkControl.comment.value?Icons.comment:Icons.comment_outlined,color: checkControl.comment.value?AppColors.black:AppColors.grey,),
                        SizedBox(width: 3,),
                        CustomText(text: '12',color: AppColors.grey,),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(checkControl.saved.value==true){
                        checkControl.saved.value=false;
                      }
                      else{
                        checkControl.saved.value=true;
                      }
                    },
                    child: Row(
                      children: [
                        Icon(checkControl.saved.value?Icons.bookmark:Icons.bookmark_border_rounded,color: checkControl.saved.value?AppColors.black:AppColors.grey,),
                        SizedBox(width: 3,),
                        CustomText(text: '8',color: AppColors.grey,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:(){
                        Get.back();
                      },
                        child: Icon(Icons.arrow_back_ios),),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            CustomDialogAnimated(context);
                          },
                          child: Container(
                            color: Colors.transparent,
                              height: 40,
                              width: 40,
                              child: Icon(Icons.share),
                          ),
                        ),
                        SizedBox(width: 15,),
                        InkWell(
                          onTap: (){
                            CustomOptionsDialogAnimated(context);
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: 40,
                            width: 40,
                              child: Icon(Icons.more_vert),
                          ),
                        ),
                      ],
                    ),

                ],
                ),
                SizedBox(height: 25,),
                CustomText(text: widget.blog.title,maxLines: 3,fontSize: 20.0,fontWeight: FontWeight.bold,),
                SizedBox(height: 25,),
            Row(
              children: [
                CustomText(text: 'By ${widget.blog.author}',fontWeight: FontWeight.w600,),
                SizedBox(width: 25,),
                CustomText(text: '${widget.blog.category}',color: AppColors.grey,),
              ],
            ),
                CustomText(text: '______',fontWeight: FontWeight.bold,color: AppColors.mainColor,fontSize: 18.0),

                SizedBox(height: 30,),
            Hero(
              tag: '${widget.blog.image}',
              child: Container(
                height: MediaQuery.of(context).size.height/3.5,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10),),
                  image: DecorationImage(image: AssetImage(widget.blog.image.toString()),fit: BoxFit.cover),
                ),
              ),
            ),
                SizedBox(height: 20,),
                CustomText(text: '${widget.blog.description}',color: Colors.grey,fontSize: 17.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class userBlogActivityController extends GetxController{
  RxBool liked=false.obs,comment=false.obs,saved=false.obs;

}
