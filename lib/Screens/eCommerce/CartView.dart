import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/constants/colors.dart';
import 'package:nzeora/models/product_data.dart';

import '../../widgets/CartProductCard.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class CartView extends StatefulWidget {
  Product product;
   CartView({Key? key,required this.product}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height/3,
        child: Padding(
          padding: const EdgeInsets.only(right: 80.0,top: 20,left: 80,bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Subtotal(\$)',fontWeight: FontWeight.w600,fontSize: 15.0,overflow: TextOverflow.ellipsis,),
                  CustomText(text: widget.product.price,fontWeight: FontWeight.w600,fontSize: 15.0,overflow: TextOverflow.ellipsis,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Delivery fee',fontWeight: FontWeight.w600,fontSize: 15.0,overflow: TextOverflow.ellipsis,),
                  CustomText(text: '00.0',fontWeight: FontWeight.w600,fontSize: 15.0,overflow: TextOverflow.ellipsis,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Total(incl. Tax)',fontWeight: FontWeight.bold,fontSize: 15.0,overflow: TextOverflow.ellipsis,),
                  CustomText(text: '${double.tryParse(widget.product.price!)}',fontWeight: FontWeight.w600,fontSize: 15.0,overflow: TextOverflow.ellipsis,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomButton(title: 'Checkout', onPressed: (){},asset: '',primary: Colors.black,titleColor: Colors.white,),
              )
            ],
          ),
        ),
      ),
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
                  CustomText(text: 'Cart',fontSize: 25.0,fontWeight: FontWeight.w600,),
                  SizedBox(width: 20,child: null,),
                ],
              ),
              SizedBox(height: 20,),

              CartProductCard(product: widget.product,),

              SizedBox(height: MediaQuery.of(context).size.height/3),
            ],
          ),
        ),
      ),
    );
  }
}

