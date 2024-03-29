import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 80,left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/NzeoraLogoB.png',height: MediaQuery.of(context).size.height/12,),
              const SizedBox(height: 40,),
              Row(
                children: const [
                  CustomText(text: 'Sign Up',fontSize: 25.0,fontWeight: FontWeight.bold,),
                ],
              ),
              const SizedBox(height: 40,),
              /////////////////
              const CustomText(text: 'Full name',fontWeight: FontWeight.bold,),
              const SizedBox(height: 10,),
              CustomTextField(hintText: 'Type your name...',borderRadius: 10.0,outlineWidth: 5.0,fillColor: Colors.transparent,),
              //////////////
              const SizedBox(height: 20,),
              const CustomText(text: 'Email',fontWeight: FontWeight.bold,),
              const SizedBox(height: 10,),
              CustomTextField(hintText: 'Type your email...',borderRadius: 10.0,outlineWidth: 5.0,fillColor: Colors.transparent,),
              //////////////
              const SizedBox(height: 20,),
              const CustomText(text: 'Password',fontWeight: FontWeight.bold,),
              const SizedBox(height: 10,),
              CustomTextField(obscureText: true,hintText: 'Type your password...',maxLines: 1,borderRadius: 10.0,outlineWidth: 5.0,fillColor: Colors.transparent,),
              //////////////
              const SizedBox(height: 20,),
              const CustomText(text: 'Confirm Password',fontWeight: FontWeight.bold,),
              const SizedBox(height: 10,),
               CustomTextField(obscureText: true,hintText: 'Type your password again...',maxLines: 1,borderRadius: 10.0,outlineWidth: 5.0,fillColor: Colors.transparent,),
              //////////////
              const SizedBox(height: 10,),
              /////////
              Padding(
                padding: const EdgeInsets.only(top: 60.0,left: 20,right: 20),
                child: CustomButton(title: 'Sign Up', onPressed: (){
                  //Get.back();
                },asset: '',primary: Colors.black,titleColor: Colors.white,),
              ),
              /////////////////
              const SizedBox(height: 80,),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                behavior: HitTestBehavior.opaque,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CustomText(text: 'Already have an account? ',),
                    CustomText(text: 'Sign In',fontWeight: FontWeight.bold,),
                  ],
                ),
              ),
              const SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
