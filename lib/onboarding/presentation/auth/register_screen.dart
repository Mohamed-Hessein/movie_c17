import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/auto_route.dart';
import '../../../core/resources/colors_app.dart';
import '../../../core/resources/image&icon.dart';
import '../../../core/resources/style_app.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isArabic = false;

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
          'Register',
          style: StyleApp.mdText.copyWith(color: ColorsApp.secondaryGold
              ,fontSize: 18,
              fontWeight: FontWeight.w400
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5),
              // Avatar Selection Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildAvatar(ImageApp.Avatar, isSmall: true),
                  SizedBox(width: 10.w),
                  _buildAvatar(ImageApp.icAvatar, isLarge: true),
                  SizedBox(width: 10.w),
                  _buildAvatar(ImageApp.Avatarr, isSmall: true),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Avatar',
                style: StyleApp.smText.copyWith(color: Colors.white),
              ),
              SizedBox(height: 20),
              // Fields
              _buildTextField(hintText: 'Name', iconPath: ImageApp.icName),
              SizedBox(height: 20),
              _buildTextField(hintText: 'Email', iconPath: ImageApp.icEmail),
              SizedBox(height: 20),
              _buildTextField(hintText: 'Password', iconPath: ImageApp.icLock, isPassword: true),
              SizedBox(height: 20),
              _buildTextField(hintText: 'Confirm Password', iconPath: ImageApp.icLock, isPassword: true),
              SizedBox(height: 20),
              _buildTextField(hintText: 'Phone Number', iconPath: ImageApp.icPhone),
              SizedBox(height: 20),
              // Create Account Button
              _buildButton(text: 'Create Account', onPressed: () {
                context.router.push(const LoginRoute());
              }),
              SizedBox(height: 15),
              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have Account ? ",
                    style: StyleApp.smText.copyWith(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () => context.router.back(),
                    child: Text(
                      'Login',
                      style: StyleApp.smText.copyWith(
                        color: ColorsApp.secondaryGold,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              // Language Toggle
              _buildLanguageToggle(),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(String imagePath, {bool isLarge = false, bool isSmall = false}) {
    double size = isLarge ? 120.r : 70.r;
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage(imagePath),
    );
  }

  Widget _buildTextField({required String hintText, required String iconPath, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70, fontSize: 16.sp),
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.w),
          child: Image.asset(iconPath, width: 24.w, height: 24.h),
        ),
        suffixIcon: isPassword ? const Icon(Icons.visibility_off, color: Colors.white) : null,
        filled: true,
        fillColor: const Color(0xFF282A28),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildButton({required String text, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsApp.secondaryGold,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Text(
          text,
          style: StyleApp.mdText.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageToggle() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isArabic = !isArabic;
        });
      },
      child: Container(
        width: 80.w,
        height: 35.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: ColorsApp.secondaryGold, width: 2),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 40.w,
                height: 35.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(isArabic ? ImageApp.egFlag : ImageApp.lrFlag),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}