import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/Screens/eCommerce/CartView.dart';
import 'package:nzeora/models/product_data.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';

class ProductDetails extends StatefulWidget {
  Product product;
  String callType;
   ProductDetails({Key? key,required this.product,required this.callType}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  QuantityController controller = Get.put(QuantityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.callType=='MyOrders'?null:Container(
        color: Colors.white,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(left: 30,right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  setState((){
                    if(controller.addToCart.value){
                      controller.addToCart.value=false;
                    }
                    else{
                      controller.addToCart.value=true;
                    }
                  });
                },
                child: Container(
                  height: 60,
                  child: Row(
                    children: [
                      Icon(controller.addToCart.value?Icons.shopping_cart:Icons.shopping_cart_outlined),
                      SizedBox(width: 10,),
                      CustomText(text: controller.addToCart.value?'Added to cart':'Add to cart',),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: ()=>Get.to(()=>CartView(product: widget.product),transition: Transition.rightToLeft),
                child: Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.height/18,
                  decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                    child: Center(child: CustomText(text: 'Buy now',color: Colors.white,fontWeight: FontWeight.bold,)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40,right: 30,left: 30),
              child: Row(
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
                  CustomText(text: 'Details',fontSize: 25.0,fontWeight: FontWeight.w600,),
                  SizedBox(width: 20,child: null,),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Stack(
              children: [
                Hero(
                  tag: '${widget.product.image}',
                  child: Container(
                    height: MediaQuery.of(context).size.height/1.65,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                      image: DecorationImage(image: NetworkImage(widget.product.image.toString()),fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height/1.85,
                  child: Container(
                    //height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                      //image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/842811/pexels-photo-842811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(width: MediaQuery.of(context).size.width/1.4,child: CustomText(text: '${widget.product.title}',fontWeight: FontWeight.bold,fontSize: 20.0,overflow: TextOverflow.ellipsis,)),
                              CustomText(text: '\$${widget.product.price}',fontWeight: FontWeight.bold,fontSize: 20.0)
                            ],
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Description',fontWeight: FontWeight.bold,fontSize: 15.0),
                    SizedBox(height: 10,),
                    CustomText(text: '${widget.product.description}',color: AppColors.grey,),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        CustomText(text: 'Colors:',fontWeight: FontWeight.bold,fontSize: 15.0),
                        SizedBox(width: 10,),
                        ProductColor(Colors.black,1,controller.selectedColor==1?true:false),
                        SizedBox(width: 10,),
                        ProductColor(AppColors.chipsShade,2,controller.selectedColor==2?true:false),
                        SizedBox(width: 10,),
                        ProductColor(AppColors.grey,3,controller.selectedColor==3?true:false),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        const CustomText(text: 'Sizes:',fontWeight: FontWeight.bold,fontSize: 15.0),
                        SizedBox(width: 10,),
                        ProductSize('S',0,controller.selectedSize==0?true:false),
                        SizedBox(width: 10,),
                        ProductSize('XS',1,controller.selectedSize==1?true:false),
                        SizedBox(width: 10,),
                        ProductSize('M',2,controller.selectedSize==2?true:false),
                        SizedBox(width: 10,),
                        ProductSize('XL',3,controller.selectedSize==3?true:false),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        const CustomText(text: 'Sizes:',fontWeight: FontWeight.bold,fontSize: 15.0),
                        SizedBox(width: 10,),
                        QuantityButton(AppColors.chipsShade,'-',(){
                          if(controller.quantity.value>1) {
                            setState((){
                              controller.quantity.value--;
                            });

                            print(controller.quantity.value);
                          }
                        }),
                        SizedBox(width: 10,),
                        CustomText(text: '${controller.quantity}',fontWeight: FontWeight.bold,fontSize: 15.0),
                        SizedBox(width: 10,),
                        QuantityButton(AppColors.black,'+',(){
                          setState((){
                            controller.quantity.value++;
                          });
                        }),
                      ],
                    ),
                    SizedBox(height: 50,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell QuantityButton(color,txtIcon,onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 40,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.all(Radius.circular(8),)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(child: CustomText(text: txtIcon,color: txtIcon=='+'?Colors.white:Colors.black,)),
                      ),
                    ),
    );
  }

  InkWell ProductSize(size,index,selected) {
    return InkWell(
      onTap: (){
        setState((){
          controller.selectedSize.value=index;
        });
      },
      child: Container(
                          decoration: BoxDecoration(
                            color: selected?AppColors.black:AppColors.chipsShade,
                            borderRadius: BorderRadius.all(Radius.circular(8))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(child: CustomText(text: size,color: selected?Colors.white:Colors.black,)),
                          ),
                        ),
    );
  }

  InkWell ProductColor(color,index,selected) {
    return InkWell(
      onTap: (){
        setState((){
          controller.selectedColor.value=index;
        });
      },
      child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border:Border.all(color: selected?AppColors.mainColor:color,width: 3,),
                          ),
                        ),
    );
  }
}

class QuantityController extends GetxController{
  RxInt quantity=1.obs;
  RxBool addToCart=false.obs;
  RxInt selectedSize=0.obs;
  RxInt selectedColor=0.obs;
}