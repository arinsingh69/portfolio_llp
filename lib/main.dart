import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_llp/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive UI
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Use your Figma design dimensions
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Portfolio Student Project',
          theme: ThemeData(
            primaryColor: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
            textTheme: TextTheme(
              bodyLarge: TextStyle(fontSize: 16.sp),  // Responsive text size
              bodyMedium: TextStyle(fontSize: 14.sp),
            ),
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
              iconTheme: IconThemeData(color: Colors.black),
            ),
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
