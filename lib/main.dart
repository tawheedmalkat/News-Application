import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp1/views/article.dart';
import 'package:newsapp1/views/home.dart';
import 'package:newsapp1/views/language.dart';
import 'package:newsapp1/views/settings.dart';
import 'package:newsapp1/views/start.dart';

import 'helper/settingss.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',



      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.red,
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(
                      AppBar().preferredSize.height*0.5
                  ),
                )
            )
        ),
        primaryColor: Colors.red,


      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(
                      AppBar().preferredSize.height*0.5
                  ),
                )
            )
        ),
      ),

      themeMode: SettingsController.theme ?
      ThemeMode.dark :
      ThemeMode.light,

      debugShowCheckedModeBanner: false,





      getPages: [
        GetPage(name: '/', page: () => Start()),
        GetPage(name: '/x', page: () => Home()),
        GetPage(name: '/settings', page: ()=> SettingsScreen())
      ],
      locale:SettingsController.isEn ?
      Locale('en','us'):
      Locale('ar','sy'),
      translations: Languages(),
    );
  }
}

