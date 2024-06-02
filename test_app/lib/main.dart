import 'package:flutter/material.dart';
import 'package:test_app/pages/kuran_home_page.dart';
import 'package:test_app/sevices/kuran_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SurahApi.getSurahData();
    return ScreenUtilInit(
      designSize: const Size(412,732),
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kuran',
          theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
          ),
          home: const KuranHomePage()
      ),
    );

  }
}

