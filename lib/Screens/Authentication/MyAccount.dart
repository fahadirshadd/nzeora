import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nzeora/Screens/Authentication/SignIn.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  TextEditingController textEditingController =TextEditingController();
  TextEditingController textEditingControllerEmail =TextEditingController();
  TextEditingController textEditingControllerTheme =TextEditingController();

  @override
  Widget build(BuildContext context) {
    textEditingController.text='Guest User';
    textEditingControllerEmail.text='test@email.com';
    textEditingControllerTheme.text='Light';
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 70,left: 15,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: null,
                  ),
                   CustomText(text: 'My Account',fontSize: 25.0,fontWeight: FontWeight.w600,),
                   SizedBox(width: 20,child: null,),
                ],
              ),
              const SizedBox(height: 20,),
              const CustomText(text: 'Name',fontWeight: FontWeight.bold,),
              const SizedBox(height: 10,),
              CustomTextField(readOnly: true,hintText: 'your name...',controller: textEditingController,borderRadius: 10.0,outlineWidth: 5.0,fillColor: Colors.transparent,),
              /////////////////
              const SizedBox(height: 20,),
              const CustomText(text: 'Email address',fontWeight: FontWeight.bold,),
              const SizedBox(height: 10,),
              CustomTextField(readOnly: true,hintText: 'your email...',controller: textEditingControllerEmail,borderRadius: 10.0,outlineWidth: 5.0,fillColor: Colors.transparent,),
              //////////////
              const SizedBox(height: 20,),
              const CustomText(text: 'Themes',fontWeight: FontWeight.bold,),
              const SizedBox(height: 10,),
              CustomTextField(readOnly: true,hintText: 'theme...',controller: textEditingControllerTheme,borderRadius: 10.0,outlineWidth: 5.0,fillColor: Colors.transparent,),
              //////////////

              Padding(
                padding: const EdgeInsets.only(top: 60.0,left: 20,right: 20),
                child: CustomButton(title: 'Sign In', onPressed: (){
                  Get.to(()=>const SignIn(),transition: Transition.rightToLeft);
                },asset: '',primary: Colors.black,titleColor: Colors.white,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
