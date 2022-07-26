import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/PaymentMethodCard.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';
import 'OrderSummary.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height/2.4,
        child: Padding(
          padding: const EdgeInsets.only(right: 30.0,top: 20,left: 30,bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PaymentMethodCard(methodTitle: 'Credit/Debit Card',asset: 'assets/images/creditcardicon.png',selected: true,),
              PaymentMethodCard(methodTitle: 'Crypto',asset: 'assets/images/btc_logo.png',selected: false,),
              PaymentMethodCard(methodTitle: 'Ideal',asset: 'assets/images/ideal.png',selected: false,),
              PaymentMethodCard(methodTitle: 'PayPal',asset: 'assets/images/paypal.png',selected: false,),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomButton(title: 'Continue', onPressed: (){
                  Get.to(()=>OrderSummary(),transition: Transition.rightToLeft);
                },asset: '',primary: Colors.black,titleColor: Colors.white,),
              )
            ],
          ),
        ),
      ),
      body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0,left: 30,right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                  CustomText(text: 'Check out',fontSize: 25.0,fontWeight: FontWeight.w600,),
                  SizedBox(width: 20,child: null,),
                ],
              ),
              SizedBox(height: 20,),
              CustomText(text: 'Name',),
              SizedBox(height: 10,),
              CustomTextField(hintText: 'Type your name...',),
              SizedBox(height: 10,),
              CustomText(text: 'Phoen Number',),
              SizedBox(height: 10,),
              CustomTextField(hintText: 'Type your phone number...',),
              SizedBox(height: 10,),
              CustomText(text: 'City',),
              SizedBox(height: 10,),
              CustomTextField(hintText: 'Type your City name...',),
              SizedBox(height: 10,),
              CustomText(text: 'Add a shipping address',),
              SizedBox(height: 10,),
              CustomTextField(hintText: 'Add an address...',maxLines: 3,),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}


