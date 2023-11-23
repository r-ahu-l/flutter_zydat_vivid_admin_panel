import 'package:flutter/material.dart';
import 'package:zydat_color_panel/style/colors.dart';
import 'package:zydat_color_panel/style/style.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SizedBox(width: 400, child: LoginCard())),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Image.asset(
        'assets/black_img.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const PrimaryText(
                text: 'Welcome Back!',
                size: 22,
                color: AppColors.black,
                fontWeight: FontWeight.w700),
            const SizedBox(
              height: 20,
            ),
            const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              PrimaryText(
                  text: 'E-mail',
                  size: 14,
                  align: TextAlign.left,
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w700)
            ]),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const TextField(
                style: TextStyle(
                  color: AppColors.primary,
                  height: 1,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              PrimaryText(
                  text: 'Password',
                  size: 14,
                  align: TextAlign.left,
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w700)
            ]),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const TextField(
                style: TextStyle(
                  color: AppColors.primary,
                  height: 1,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: InputBorder.none,
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 20.0),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'main-page');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.buttonBg,
                  minimumSize: const Size(double.infinity, 0),
                  padding: const EdgeInsets.all(20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: const PrimaryText(
                    text: 'Login',
                    size: 14,
                    align: TextAlign.left,
                    color: AppColors.primaryBg,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
