import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/widgets/ProductCard.dart';
import 'package:nzeora/widgets/custom_text.dart';

import '../../models/product_data.dart';

class Products extends StatefulWidget {
  String category;
  Products({Key? key, required this.category}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(right: 25,top: 25,left: 25),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
                    CustomText(text: widget.category,fontSize: 25.0,fontWeight: FontWeight.w600,),
                    SizedBox(width: 20,child: null,),
                  ],
                ),
                SizedBox(height: 20,),
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                    itemBuilder:(context,index){
                      return ProductCard(product: fashionProducts[index]);
                    },
                  itemCount: fashionProducts.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
