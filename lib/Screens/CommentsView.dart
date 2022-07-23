import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/constants/colors.dart';
import 'package:nzeora/models/blog_data.dart';
import 'package:nzeora/widgets/custom_button.dart';
import 'package:nzeora/widgets/custom_text.dart';

import '../widgets/CommentCard.dart';
import '../widgets/custom_text_field.dart';

class Comments extends StatefulWidget {
  Blog blog;
   Comments({Key? key,required this.blog}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  blogCommentsController controller = Get.put(blogCommentsController());
  TextEditingController commentController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                        child: Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(width: 10,),
                    Image(image: AssetImage('${widget.blog.image}'),fit: BoxFit.cover,height: MediaQuery.of(context).size.height/8,width: MediaQuery.of(context).size.width/3.2,),
                    SizedBox(width: 10,),
                    Expanded(
                      //width: MediaQuery.of(context).size.width/1.8,
                        child: CustomText(text: '${widget.blog.title}',maxLines: 3, fontWeight: FontWeight.w700,),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                CustomText(text: 'Comments(30)',fontWeight: FontWeight.w700,fontSize: 25.0,),
                SizedBox(height: 30,),
                 CommentCard(controller: controller),
                SizedBox(height: 30,),
                CommentCard(controller: controller),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15),),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 200),
                        offset: Offset(1, 1),
                        blurRadius: 10,
                        spreadRadius: 3,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Obx(
                      ()=> Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: 'Nnenna Nweke (You)',fontSize: 17.0,fontWeight: FontWeight.w500,),
                          SizedBox(height: 10,),
                          CustomTextField(maxLines: 1,hintText: 'Add a comment',controller: commentController,onChanged: (context){
                            controller.txtController.value=commentController.text as String;
                            print(commentController.text);
                          },),
                          SizedBox(height: 10,),
                          CustomButton(title: 'Post',asset: '',onPressed: (){},titleColor: controller.txtController.value==''?Colors.black:Colors.white,primary:controller.txtController.value==''?Colors.white:Colors.black ,)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}



class blogCommentsController extends GetxController{
  RxBool commented=false.obs,liked=false.obs;
  RxString txtController=''.obs;
}
