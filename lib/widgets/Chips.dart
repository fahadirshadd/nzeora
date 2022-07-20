import 'package:flutter/material.dart';

import '../constants/colors.dart';

Widget BuildChip(String label,IconData icon) {
  return Chip(
    labelPadding: EdgeInsets.all(2.0),
    avatar: CircleAvatar(
      foregroundColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      child: Icon(icon,color: Colors.black,size: 20),
    ),
    deleteButtonTooltipMessage: label,
    label: Text(
      '  $label',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    backgroundColor: AppColors.chipsShade,
    elevation: 6.0,
    shadowColor: Colors.transparent,
    padding: EdgeInsets.all(8.0),
  );
}

