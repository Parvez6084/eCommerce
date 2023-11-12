import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/Bindings/initBinding.dart';
import 'package:todo/route/app_page.dart';
import 'package:todo/route/app_routes.dart';



void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
        fontFamily: "Poppins",
      ),
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.pages,
      initialBinding: InitialBinding(),

    );
  }
}

