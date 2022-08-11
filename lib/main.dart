import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lounchtime/helper/AppColors.dart';

import 'firebase_options.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: appColors.bgColor,
          primarySwatch: Colors.green,
          backgroundColor: appColors.bgColor,
          textTheme: const TextTheme(
              headline1:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black), 
              elevation: 0,
              backgroundColor: Color(0xFFFAF8F8))),
      title: "Launch Time (লঞ্চের সময়)",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
