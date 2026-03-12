import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/image&icon.dart';
import '../../../../core/resources/style_app.dart';
import '../../../../core/resources/colors_app.dart';

import '../../../core/firebase_functions.dart';
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

  var email = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                  TextFormField(
                    controller: email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'loginTitle1'.tr(),
                      hintStyle:
                      TextStyle(color: Colors.white70, fontSize: 16),
                      prefixIcon: Image.asset(ImageApp.icEmail),
                      filled: true,
                      fillColor: const Color(0xFF282A28),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  /// Password
                  TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: !isPasswordVisible,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'loginTitle2'.tr(),
                      hintStyle:
                      TextStyle(color: Colors.white70, fontSize: 16),
                      prefixIcon: Image.asset(ImageApp.icLock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF282A28),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.router.push(const ForgetPasswordRoute());
                      },
                      child: Text(
                        'loginTitle3'.tr(),
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
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        FirebaseFunctions.login(
                          email.text,
                          password.text,
                          onSuccess: (){
                            context.router.push(HomeRoute());
                          },
                          onError: (message){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message),
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.secondaryGold,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'loginTitle4'.tr(),
                        style: StyleApp.mdText.copyWith(
                          color: const Color(0xFF282A28),
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  /// Create Account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'loginTitle5'.tr(),
                        style: StyleApp.smText.copyWith(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.router.push(const RegisterRoute());
                        },
                        child: Text(
                          'loginTitle6'.tr(),
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
                        'loginTitle7'.tr(),
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
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
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

                          Image.asset(
                            ImageApp.icgoogle, // صورة أيقونة جوجل
                            width: 24,
                            height: 24,
                          ),

                          SizedBox(width: 10),

                          Text(
                            'loginTitle8'.tr(),
                            style: StyleApp.mdText.copyWith(
                              color: const Color(0xFF282A28),
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                  /// Language Toggle

        Padding(
          padding: const EdgeInsets.only(left: 175,right: 120),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
             color:  Colors.yellow,
                  width: 2),
            ),
            child:
            Row(
              spacing: 18,
              children: [
                InkWell(
                  onTap: (){
                    context.setLocale(Locale('en'));
                  },
                  child: Container(
                      padding: context.locale == Locale('en') ? null
                          : EdgeInsets.symmetric(horizontal: 4),
                      decoration: context.locale == Locale('en') ?
                      BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color:  Colors.yellow,
                          width: 4),
                      )
                      :null,


                      child: Image.asset("assets/images/LR.png",height: 30,width: 30,
                        fit:  BoxFit.cover,
                      )),
                ),
                InkWell(
                 onTap: (){
                   context.setLocale(Locale('ar'));
                 },
                  child: Container(
                    decoration: context.locale == Locale('ar') ?
                    BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color:  Colors.yellow,
                          width: 4),
                    )
                        :null,
                    padding: context.locale == Locale('ar') ? null
                        : EdgeInsets.symmetric(horizontal: 4),
                    child: Image.asset("assets/images/EG.png",width: 30,height: 30,
                      fit:  BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
        )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}