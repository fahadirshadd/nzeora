import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/constants/colors.dart';
import 'package:nzeora/models/product_data.dart';
import '../Screens/eCommerce/ProductDetails.dart';
import '../Screens/eCommerce/ProductsView.dart';
import 'custom_text.dart';

class ProductCard extends StatelessWidget {
  Product product;
  ProductCard({
    Key? key, required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.to(()=>ProductDetails(product: product,callType: ''),transition: Transition.rightToLeft),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          color: AppColors.chipsShade,
          child: Row(
            children: [
              Hero(
                tag: '${product.image}',
                child: Container(
                  height: MediaQuery.of(context).size.height/5.5,
                  width: MediaQuery.of(context).size.width/3.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
                    image: DecorationImage(image: NetworkImage('${product.image}'),fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Container(
                width: MediaQuery.of(context).size.width/2.1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: product.title,maxLines: 1,fontSize: 19.0,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 5,),
                      Wrap(
                        children: [
                          CustomText(text: product.description,color: AppColors.grey,overflow: TextOverflow.ellipsis,maxLines:2),
                        ],
                      ),
                      SizedBox(height: 10,),
                      CustomText(text: 'Price: \$${product.price}',maxLines: 1,fontSize: 19.0,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 10,),
                      CustomText(text: 'Available in stock',color: AppColors.grey,overflow: TextOverflow.ellipsis,maxLines:2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
