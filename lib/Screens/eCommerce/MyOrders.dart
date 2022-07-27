import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/constants/colors.dart';
import 'package:nzeora/models/blog_data.dart';
import 'package:nzeora/models/product_data.dart';
import 'package:nzeora/widgets/BookmarkedBlogCard.dart';
import 'package:nzeora/widgets/CartProductCard.dart';

import '../../widgets/custom_text.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0,left: 30,right: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: ()=>Get.back(),
                    child: Container(
                      height: 35,
                      width: 35,
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  CustomText(text: 'My orders',fontSize: 20.0,fontWeight: FontWeight.w600,),
                  SizedBox(width: 20,child: null,),
                ],
              ),
              SizedBox(height: 20,),

              /////////ListView here
              ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder:(context,index){
                  return CartProductCard(product: fashionProducts[index]);
                },
                itemCount: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

