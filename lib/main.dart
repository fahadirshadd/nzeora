import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nzeora/Screens/Dashboard.dart';
import 'package:nzeora/controller/auth_controller.dart';
import 'package:nzeora/controller/videos_controller.dart';

import 'Screens/CommentsView.dart';
import 'controller/UserBlogActivityController.dart';
import 'controller/blog_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  AuthController authController=Get.put(AuthController());
  BlogController blogController=Get.put(BlogController());
  blogCommentsController controller = Get.put(blogCommentsController());
  VideosController videosController = Get.put(VideosController());
  UserBlogActivityController checkControl=Get.put(UserBlogActivityController());


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nzeora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}

