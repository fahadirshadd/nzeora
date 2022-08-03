
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nzeora/models/blog_data.dart';
import 'package:nzeora/models/lates_blog_post.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/custom_web_services.dart';

class BlogController extends GetxController{
  var blogList=<BlogsData>[].obs;
  var latestBlogList=<LatestBlogPost>[].obs;
  final latestPostTimeAgo = DateTime.now().subtract(Duration(minutes: 0)).obs;

  Future<void> getBlogsData() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.get(Uri.parse(CustomWebServices.getPostsUrl),
        headers: {"Content-Type": "application/json","Authorization":"Bearer ${prefs.getString('token')}"});
    print(prefs.getString('token'));
    if (response.statusCode == 200) {
      Get.snackbar("posts got", "got posts Successfully!",
          backgroundColor: Color(0xff24b04b),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          borderRadius: 10,
          borderWidth: 2,
          maxWidth: 200);

      var responseData = response.body;
      blogList.value =blogsDataFromJson(responseData);

      print(blogList[0].title!.rendered);
      print(blogList.length);
    }
    else{
      print(response.statusCode);
    }

  }

  Future<void> getLatestBlogsData() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.get(Uri.parse(CustomWebServices.getLatestPostUrl),
        headers: {"Content-Type": "application/json","Authorization":"Bearer ${prefs.getString('token')}"});
    print(prefs.getString('token'));
    if (response.statusCode == 200) {

      var responseData = response.body;
      latestBlogList.value =latestBlogPostFromJson(responseData);
      latestPostTimeAgo.value=DateTime.now().subtract(Duration(minutes: latestBlogList[0].date!.minute));
    }
    else{
      print(response.statusCode);
    }

  }


}