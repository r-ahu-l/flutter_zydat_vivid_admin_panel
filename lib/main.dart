import 'package:zydat_color_panel/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:zydat_color_panel/pages/login.dart';
import 'package:zydat_color_panel/style/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'zydat_panel_vivid_admins',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.primaryBg),
      home: const LoginPage(),
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginPage(),
        'main-page': (context) => MainPage(
              initialWidget: 'user-maintanence',
              name: '',
            ),
      },
    );
  }
}
