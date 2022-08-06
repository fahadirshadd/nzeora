
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:nzeora/Screens/BlogReadView.dart';
import 'package:nzeora/widgets/custom_text.dart';
import 'package:nzeora/widgets/custom_text_field.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../constants/colors.dart';
import '../controller/blog_controller.dart';
import '../models/TabsModel.dart';
import '../models/blog_data.dart';
import '../widgets/BlogCard.dart';
import '../widgets/Chips.dart';
import '../widgets/DrawerSectionCategoryCard.dart';
import '../widgets/SearchedBlogCard.dart';
import 'LatestBlogReadView.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
TabController? globalTabController;
late TabController _tabController;
var indexControl =  Get.put(categoriesTabController());
  BlogController blogController = Get.find();
var indexIs;
bool animate=false;
var searchController = TextEditingController().obs;
var searchControllerTxt="".obs;




@override
void initState() {
  // TODO: implement initState
  super.initState();
  // Create TabController for getting the index of current tab
  _tabController = TabController(length: categoryTabs.length, vsync: this);

  _tabController.addListener(() {
    setState(() {
      indexIs=_tabController.index;
      indexControl.selectedIndex.value = _tabController.index;
    });
    print("Selected Index: " + indexControl.selectedIndex.toString());
  });

  blogController.getBlogsData();
  blogController.getLatestBlogsData();

}

  @override
  Widget build(BuildContext context) {
    indexControl.selectedIndex.value=_tabController.index;

    animate=true;
    return Scaffold(
      backgroundColor: Colors.transparent,
      key: _scaffoldKey,
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50)),
        ),
        child: buildCustomDrawer(),
      ),
      appBar: AppBar(
        foregroundColor: AppColors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: ()=>_scaffoldKey.currentState!.openDrawer(),
            child: const Icon(Icons.menu),
        ),
        title: Image.asset('assets/images/NzeoraLogoB.png',
            height: MediaQuery.of(context).size.height/4,
            width: MediaQuery.of(context).size.width/3.5
        ),
        centerTitle: true,
        actions:const [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.notifications_none),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
            ()=> Padding(
            padding: const EdgeInsets.only(right: 20.0,left: 20),
            child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                       CustomTextField(
                        hintText: 'Search',
                        icon: const Icon(Icons.search),
                        controller: searchController.value,
                         onChanged: (value){
                          setState((){
                            searchControllerTxt.value = searchController.value.text;
                            blogController.getSearchedBlogsData(searchControllerTxt.value);
                          });
                         },
                      ),
                      const SizedBox(height: 15,),
                      searchController.value.text !=''? Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: blogController.searchedBlogList.length,
                          itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SearchedBlogCard(blog: blogController.searchedBlogList[index]),
                          );
                        },
                        ),
                      ):Container(
                        child: TabBar(
                            onTap: (value){
                              setState((){
                                indexIs=_tabController.index;
                                indexControl.selectedIndex.value=_tabController.index;
                                print("Selected Index: " + indexControl.selectedIndex.toString()+' IndexIs: '+indexIs.toString());
                              }
                              );
                            },
                          physics: const BouncingScrollPhysics(),
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black),
                            indicatorColor: Colors.transparent,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black26,
                            isScrollable: true,
                            controller: _tabController,
                              indicatorSize: TabBarIndicatorSize.label,
                            splashBorderRadius: BorderRadius.circular(10),
                              tabs: categoryTabs,
                          ),

                      ),
                      const SizedBox(height: 10,),
                      searchController.value.text !=''? Container():Container(
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height/1.52,
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _tabController,
                            children: [
                          buildTabCustomScrollView(context),
                              buildTabCustomScrollView(context),
                              buildTabCustomScrollView(context),
                              buildTabCustomScrollView(context),
                              buildTabCustomScrollView(context),
                              buildTabCustomScrollView(context),
                        ]),
                      ),
                    ],
                ),


          ),
        ),
      ),
    );
  }

  SingleChildScrollView buildCustomDrawer() {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'Sections',fontSize: 23.0),
              const SizedBox(height: 40,),
              const CustomText(text: 'News',fontSize: 21.0),
              const SizedBox(height: 20,),
              DrawerSectionCategoryCard( title: 'Recent',),
              DrawerSectionCategoryCard( title: 'Trending',),
              const SizedBox(height: 40,),
              const CustomText(text: 'Category',fontSize: 21.0),
              const SizedBox(height: 20,),
              DrawerSectionCategoryCard( title: 'Politics',),
              DrawerSectionCategoryCard( title: 'Entertainment',),
              DrawerSectionCategoryCard( title: 'Technology',),
              DrawerSectionCategoryCard( title: 'Life style',),
              DrawerSectionCategoryCard( title: 'Food',),
              //DrawerSectionCategoryCard( title: 'Popular',),
            ],
          ),
        ),
      );
  }

  Widget buildTabCustomScrollView(BuildContext context) {
    return Obx(
      ()=> blogController.blogList.isEmpty?Center(child: Image.asset('assets/images/loadingdata.gif',height: 50,)):CustomScrollView(
                          physics: const BouncingScrollPhysics(),
                          slivers: [
                            SliverToBoxAdapter(
                              child: Obx(
                                ()=> Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: InkWell(
                                    onTap: (){
                                      Get.to(LatestBlogRead(blogController.latestBlogList[0]));
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(seconds: 2),
                                      curve: Curves.bounceIn,
                                      height: animate?MediaQuery.of(context).size.height/3.5:0,
                                      width: double.maxFinite,
                                      decoration:  BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10),),
                                        image: DecorationImage(image: NetworkImage('${blogController.latestBlogList[0].jetpackFeaturedMediaUrl}'),fit: BoxFit.cover),
                                      ),
                                      child: GlassmorphicContainer(
                                        height: MediaQuery.of(context).size.height/5,
                                        width: MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/9.2,),
                                        borderRadius: 10,
                                        blur: 3.5,
                                        padding: const EdgeInsets.only(top: 85),
                                        alignment: Alignment.bottomCenter,
                                        border: 2,
                                        linearGradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              const Color(0xFFffffff).withOpacity(0.1),
                                              const Color(0xFFFFFFFF).withOpacity(0.05),
                                            ],
                                            stops: [
                                              0.1,
                                              1,
                                            ]),
                                        borderGradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            const Color(0xFFffffff).withOpacity(0.5),
                                            const Color((0xFFFFFFFF)).withOpacity(0.5),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: AppColors.black
                                                    ),
                                                    width: 80,
                                                    height: 40,
                                                    child: Center(child: CustomText(text:'Breaking',color: AppColors.white,),),
                                                  ),
                                                  const SizedBox(width: 20,),
                                                  Icon(Icons.access_time_outlined,color: AppColors.white,),
                                                  const SizedBox(width: 5,),
                                                  CustomText(text:'${timeago.format(blogController.latestPostTimeAgo.value)}',color: AppColors.white,),
                                                ],
                                              ),
                                              const SizedBox(height: 10,),
                                              Wrap(
                                                children: [
                                                  CustomText(text: '${blogController.latestBlogList[0].title!.rendered}',maxLines: 2,fontSize: 19.0,fontWeight: FontWeight.bold,color: AppColors.white,overflow: TextOverflow.ellipsis,)
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                                ()=> SliverList(delegate: SliverChildBuilderDelegate(
                                (context,index){
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: BlogCard(blog: blogController.blogList[index]),
                                  );
                                },
                                childCount: blogController.blogList.length
                              ),
                              ),
                            ),
                          ],
                        ),
    );
  }

}







class categoriesTabController extends GetxController{
  var selectedIndex=0.obs;
}