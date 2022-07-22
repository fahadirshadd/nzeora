import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/models/blog_data.dart';
import 'package:nzeora/widgets/custom_text.dart';

class BlogRead extends StatefulWidget {
  Blog blog;
   BlogRead(this.blog, {Key? key}) : super(key: key);

  @override
  State<BlogRead> createState() => _BlogReadState();
}

class _BlogReadState extends State<BlogRead> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(25),
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
                      Icon(Icons.share),
                      SizedBox(width: 15,),
                      Icon(Icons.more_vert),
                    ],
                  ),

              ],
              ),
              SizedBox(height: 25,),
              CustomText(text: widget.blog.title,maxLines: 3,fontSize: 20.0,fontWeight: FontWeight.bold,),
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
    );
  }
}
