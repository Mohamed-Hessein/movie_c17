
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_app.dart';
import '../../../../../core/resources/image&icon.dart';
import '../../../../../core/resources/style_app.dart';

@RoutePage()
class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      appBar: AppBar(
        backgroundColor: ColorsApp.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.router.back(),
          icon: Icon(Icons.arrow_back_ios_new, color: ColorsApp.secondaryGold, size: 20.sp),
        ),
        title: Text(
          'Forget Password',
          style: StyleApp.mdText.copyWith(color: ColorsApp.secondaryGold,
              fontSize: 18,
              fontWeight: FontWeight.w400
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal:10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5),
              // Illustration Image
              Image.asset(
                ImageApp.forgetPass,
                height: 300.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              // Email Field
              _buildTextField(
                hintText: 'Email',
                iconPath: ImageApp.icEmail,
              ),
              SizedBox(height: 25),
              // Verify Email Button
              _buildButton(
                text: 'Verify Email',
                onPressed: () {},
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hintText, required String iconPath}) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70, fontSize: 16.sp),
        prefixIcon: Padding(
          padding: EdgeInsets.all(12),
          child: Image.asset(iconPath, width: 24.w, height: 24.h),
        ),
        filled: true,
        fillColor: const Color(0xFF282A28),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildButton({required String text, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsApp.secondaryGold,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: StyleApp.mdText.copyWith(
                color: Color(0xFF282A28),
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            SizedBox(width: 8.w),

          ],
        ),
      ),
    );
  }
}
