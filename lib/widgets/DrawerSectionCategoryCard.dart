import 'package:flutter/material.dart';

import 'custom_text.dart';

class DrawerSectionCategoryCard extends StatelessWidget {
  String title;
   DrawerSectionCategoryCard({
    Key? key, required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: '$title',fontSize: 21.0),
            Icon(Icons.star_border),
          ],
        ),
        new Divider(
          color: Colors.black,
          thickness: 1,
        ),
      ],
    );
  }
}