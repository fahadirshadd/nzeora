import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/Screens/Dashboard.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import 'OrderCreated.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  TabIndexController tabIndexController = Get.put(TabIndexController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height/7,
        child: Padding(
          padding: const EdgeInsets.only(right: 30.0,top: 0,left: 30,bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomButton(title: 'Submit order', onPressed: (){
                  tabIndexController.selectedTabIndex.value=1;
                  Get.to(()=>OrderCreated());
                },asset: '',primary: Colors.black,titleColor: Colors.white,),
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  CustomText(text: 'Order summary',fontSize: 25.0,fontWeight: FontWeight.w600,),
                  SizedBox(width: 20,child: null,),
                ],
              ),
              SizedBox(height: 40,),
              CustomText(text: 'Shipping Address',fontSize: 20.0,fontWeight: FontWeight.bold,),
              SizedBox(height: 20,),
              summaryDetailCard('Name: ','Alison Parkson'),
              SizedBox(height: 20,),
              summaryDetailCard('Address: ','5 Drive way, lagos state'),
              SizedBox(height: 40,),
              CustomText(text: 'Order summary',fontSize: 20.0,fontWeight: FontWeight.bold,),
              SizedBox(height: 20,),
              summaryDetailCard('Order id: ','123548s856sd'),
              SizedBox(height: 20,),
              summaryDetailCard('Subtotal: ','160.0'),
              SizedBox(height: 20,),
              summaryDetailCard('Delivery Fee: ','20.0'),
              SizedBox(height: 20,),
              summaryDetailCard('Total(Incl. tax): ','180.0'),
            ],
          ),
        ),
      ),
    );
  }

  Wrap summaryDetailCard(heading,detail) {
    return Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                CustomText(text: heading,color: AppColors.black,fontSize: 17.0,),
                CustomText(text: detail,color: AppColors.grey,overflow: TextOverflow.ellipsis,maxLines:2),
              ],
            );
  }
}
