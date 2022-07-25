import 'package:nzeora/models/product_data.dart';

import '../constants/colors.dart';
import 'custom_text.dart';
import 'package:flutter/material.dart';
class CartProductCard extends StatelessWidget {
  Product product;
  CartProductCard({
    Key? key, required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.chipsShade2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Hero(
              tag: '${product.image}',
              child: Container(
                height: MediaQuery.of(context).size.height/5.1,
                width: MediaQuery.of(context).size.width/3.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(image: NetworkImage('${product.image}'),fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.of(context).size.width/2.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: product.title,fontWeight: FontWeight.bold,fontSize: 20.0,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 15,),
                  Wrap(
                    children: [
                      CustomText(text: product.description,color: AppColors.grey,overflow: TextOverflow.ellipsis,maxLines:2),
                    ],
                  ),
                  SizedBox(height: 15,),
                  CustomText(text: '\$${product.price}',fontWeight: FontWeight.bold,fontSize: 18.0,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: 'Size: M',fontWeight: FontWeight.bold,fontSize: 15.0,overflow: TextOverflow.ellipsis,),
                      CustomText(text: 'Qty: 2',fontWeight: FontWeight.bold,fontSize: 15.0,overflow: TextOverflow.ellipsis,),
                      Container(child: null,),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
