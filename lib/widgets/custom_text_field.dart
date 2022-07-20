// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:nzeora/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final labelText,
      hintText,
      textInputAction,
      maxLength,
      controller,
      keyboardType,
      validator,
      obscureText,
      prefixIcon,
      suffixIcon,
  maxLines,
  icon,
      iconColor,
      clearText,
      onChanged;
  const CustomTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.maxLength,
    this.obscureText,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.onChanged,
    this.icon,
    this.iconColor,
    this.clearText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,maxLines: maxLines,
      maxLength: maxLength,
      textInputAction: textInputAction,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black12,fontSize: 16),
        suffixIcon: IconButton(     // Icon to
          icon: Icon(Icons.clear), // clear text
          onPressed: clearText,

          color: Colors.black38,
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(30),
        //   borderSide: const BorderSide(
        //     width: 0,
        //     style: BorderStyle.none,
        //   ),
        // ),
        filled: true,
        icon: icon,
        iconColor: iconColor,
        labelText: labelText,labelStyle: TextStyle(color: Colors.black),
        contentPadding: const EdgeInsets.all(16),fillColor: Colors.white24,
      ),
    );
  }
}
