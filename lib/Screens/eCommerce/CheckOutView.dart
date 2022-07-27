import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/widgets/PaymentMethodDialogs.dart';

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
  RxInt selectedMethod=0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height/2.4,
        child: Padding(
          padding: const EdgeInsets.only(right: 30.0,top: 20,left: 30,bottom: 30),
          child: Obx(
            ()=> Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PaymentMethodCard(methodTitle: 'Credit/Debit Card',asset: 'assets/images/creditcardicon.png',selected: selectedMethod.value==0?true:false,onTap: (){selectedMethod.value=0;DebitCreditCardDialog(context);},),
                PaymentMethodCard(methodTitle: 'Crypto',asset: 'assets/images/btc_logo.png',selected: selectedMethod.value==1?true:false,onTap: (){selectedMethod.value=1;CryptoPaymentDialog(context);}),
                PaymentMethodCard(methodTitle: 'Ideal',asset: 'assets/images/ideal.png',selected: selectedMethod.value==2?true:false,onTap: (){selectedMethod.value=2;IdealPaymentDialog(context);}),
                PaymentMethodCard(methodTitle: 'PayPal',asset: 'assets/images/paypal.png',selected: selectedMethod.value==3?true:false,onTap: (){selectedMethod.value=3;}),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomButton(title: 'Continue', onPressed: (){
                    Get.to(()=>const OrderSummary(),transition: Transition.rightToLeft);
                  },asset: '',primary: Colors.black,titleColor: Colors.white,),
                )
              ],
            ),
          ),
        ),
      ),
      body:SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  const CustomText(text: 'Check out',fontSize: 25.0,fontWeight: FontWeight.w600,),
                  const SizedBox(width: 20,child: null,),
                ],
              ),
              const SizedBox(height: 20,),
              const CustomText(text: 'Name',),
              const SizedBox(height: 10,),
              const CustomTextField(hintText: 'Type your name...',),
              const SizedBox(height: 10,),
              const CustomText(text: 'Phone Number',),
              const SizedBox(height: 10,),
              const CustomTextField(hintText: 'Type your phone number...',),
              const SizedBox(height: 10,),
              const CustomText(text: 'City',),
              const SizedBox(height: 10,),
              const CustomTextField(hintText: 'Type your City name...',),
              const SizedBox(height: 10,),
              const CustomText(text: 'Add a shipping address',),
              const SizedBox(height: 10,),
              const CustomTextField(hintText: 'Add an address...',maxLines: 3,),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}


