import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/image&icon.dart';
import '../../../../core/resources/style_app.dart';
import '../../../../core/resources/colors_app.dart';

import '../../../core/resources/auto_route.dart';
import 'forget_password_screen.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isArabic = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Scaffold(
        backgroundColor: ColorsApp.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: 30),

                /// Logo
                Image.asset(
                  ImageApp.logostart,
                  height: 120,
                ),

                SizedBox(height: 60),

                /// Email
                _buildTextField(
                  hintText: 'Email',
                  iconPath: ImageApp.icEmail,
                ),

                SizedBox(height: 25),

                /// Password
                _buildTextField(
                  hintText: 'Password',
                  iconPath: ImageApp.icLock,
                  isPassword: true,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.router.push(const ForgetPasswordRoute());
                    },
                    child: Text(
                      'Forget Password ?',
                      style: StyleApp.smText.copyWith(
                        color: ColorsApp.secondaryGold,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                /// Login Button
                _buildButton(
                  text: 'Login',
                  onPressed: () {
                    context.router.push( HomeRoute());
                  },
                ),

                SizedBox(height: 20),

                /// Create Account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have Account ? ",
                      style: StyleApp.smText.copyWith(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.router.push(const RegisterRoute());
                      },
                      child: Text(
                        'Create One',
                        style: StyleApp.smText.copyWith(
                          color: ColorsApp.secondaryGold,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                /// OR
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: ColorsApp.secondaryGold,
                        thickness: 1,
                        indent: 80,
                        endIndent: 4,

                      ),
                    ),
                    Text(
                      'OR',
                      style: StyleApp.smText.copyWith(
                        fontSize: 17,
                        color: ColorsApp.secondaryGold,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: ColorsApp.secondaryGold,
                        thickness: 1,
                        endIndent: 80,
                        indent: 4,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                /// Google Button
                _buildButton(
                  text: 'Login With Google',
                  onPressed: () {},
                  isGoogle: true,
                ),
                SizedBox(height: 40),




                /// Language Toggle
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isArabic = !isArabic;
                    });
                  },
                  child: Container(
                    width: 90.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: ColorsApp.secondaryGold,
                        width: 2,
                      ),
                    ),
                    child: Stack(
                      children: [
                        AnimatedAlign(
                          duration: const Duration(milliseconds: 200),
                          alignment: isArabic
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            width: 42.w,
                            height: 38.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  isArabic
                                      ? ImageApp.egFlag
                                      : ImageApp.lrFlag,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildTextField({
    required String hintText,
    required String iconPath,
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? const Icon(Icons.visibility_off, color: Colors.white)
            : null,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70, fontSize: 16),
        prefixIcon: Image.asset(iconPath),
        filled: true,
        fillColor: Color(0xFF282A28),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
    bool isGoogle = false,
  }) {
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
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            SizedBox(width: 8.w),

          ],
        ),
      ),
    );
  }
}