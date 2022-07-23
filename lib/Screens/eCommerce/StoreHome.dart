import 'package:flutter/material.dart';
import 'package:nzeora/widgets/StoreBottomSheet.dart';
import 'package:nzeora/widgets/custom_text.dart';
import 'package:nzeora/widgets/custom_text_field.dart';

import '../../constants/colors.dart';
import '../../widgets/CategoryCard.dart';

class StoreHome extends StatefulWidget {
  const StoreHome({Key? key}) : super(key: key);

  @override
  State<StoreHome> createState() => _StoreHomeState();
}

class _StoreHomeState extends State<StoreHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                          backgroundColor: AppColors.transparent,
                          isScrollControlled: true,
                          enableDrag: true,
                          context: context,
                          builder: (context)=>bottomSheetStoreCategory(context));
                    },
                      child: Icon(Icons.category_outlined),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width/1.35,
                      child: CustomTextField(hintText: 'Search',),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Container(
                height: MediaQuery.of(context).size.height/4.5,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10),),
                  image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/2229490/pexels-photo-2229490.jpeg?auto=compress&cs=tinysrgb&w=400'),fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 100,right: 130,bottom: 20,left: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset('assets/images/NzeoraLogoB.png',width: 30,height: 30,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              CustomText(text: 'Categories',fontSize: 20.0,),
              SizedBox(height: 30,),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(

                  children: [
                    CategoryCard( height: 6,width:3.5,title: 'Women',imgUrl: 'https://images.pexels.com/photos/1759622/pexels-photo-1759622.jpeg?auto=compress&cs=tinysrgb&w=400',),
                    SizedBox(width: 20,),
                    CategoryCard(height: 6,width:3.5,title: 'Men',imgUrl: 'https://images.pexels.com/photos/1192609/pexels-photo-1192609.jpeg?auto=compress&cs=tinysrgb&w=400',),
                    SizedBox(width: 20,),
                    CategoryCard(height: 6,width:3.5,title: 'Children',imgUrl: 'https://images.pexels.com/photos/3771679/pexels-photo-3771679.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',),
                    SizedBox(width: 20,),
                    CategoryCard(height: 6,width:3.5,title: 'New',imgUrl: 'https://images.pexels.com/photos/5325684/pexels-photo-5325684.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',),

                  ],
                ),
              ),
              SizedBox(height: 30,),
              CustomText(text: 'New Arrivals',fontSize: 20.0,),
              SizedBox(height: 30,),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(

                  children: [
                    CategoryCard( height: 3,width:2.2,title: 'Mens clothing',imgUrl: 'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',),
                    SizedBox(width: 20,),
                    CategoryCard(height: 3,width:2.2,title: 'Womens clothing',imgUrl: 'https://images.pexels.com/photos/12823107/pexels-photo-12823107.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',),
                    SizedBox(width: 20,),
                    CategoryCard(height: 3,width:2.2,title: 'Childrens clothing',imgUrl: 'https://images.pexels.com/photos/2869315/pexels-photo-2869315.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

