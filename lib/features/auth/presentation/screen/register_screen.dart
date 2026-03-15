import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_c17_me/di.dart';
import 'package:movie_c17_me/features/auth/presentation/bloc/firebase_auth_cubit.dart';
import 'package:movie_c17_me/features/auth/presentation/bloc/firebase_auth_state.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/user_model.dart';
import 'package:movie_c17_me/features/profile/presentation/bloc/user_bloc.dart';
import '../../../../../core/firebase_functions.dart';
import '../../../../../core/resources/auto_route.dart';
import '../../../../../core/resources/colors_app.dart';
import '../../../../../core/resources/image&icon.dart';
import '../../../../../core/resources/style_app.dart';
import '../../../profile/presentation/bloc/user_event.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  var phone = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> getIt<FirebaseAuthCubit>(),
      child: BlocConsumer<FirebaseAuthCubit, FirebaseAuthState>(
        builder: (BuildContext context, state) {
          if(state is SignUpLoading){
            return Center(child: CircularProgressIndicator(),);
          }if(state is SignUpError){return Center(child: Text(state.errorMessage.toString(),style: TextStyle(color: Colors.red),),);
          }
          else if(state is SignUpSucess){
            context.pushRoute(LoginRoute());
          }
            return      Directionality(
              textDirection: ui.TextDirection.ltr,
              child: Scaffold(
                backgroundColor: ColorsApp.background,
                appBar: AppBar(
                  backgroundColor: ColorsApp.background,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => context.router.back(),
                    icon: Icon(Icons.arrow_back_ios_new,
                        color: ColorsApp.secondaryGold, size: 20.sp),
                  ),
                  title: Text(
                    "screenRegister1".tr(),
                    style: StyleApp.mdText.copyWith(
                      color: ColorsApp.secondaryGold,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  centerTitle: true,
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 5),

                            /// Avatar Row
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

                            const SizedBox(height: 10),

                            Text(
                              "screenRegister2".tr(),
                              style: StyleApp.smText.copyWith(color: Colors.white),
                            ),

                            const SizedBox(height: 20),

                            /// Name
                            TextFormField(
                              controller: name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "screenRegister3".tr(),
                                hintStyle:
                                TextStyle(color: Colors.white70, fontSize: 16.sp),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(12.w),
                                  child: Image.asset(ImageApp.icName,
                                      width: 24.w, height: 24.h),
                                ),
                                filled: true,
                                fillColor: const Color(0xFF282A28),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            /// Email
                            TextFormField(
                              controller: email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                final bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value);
                                if (!emailValid) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "loginTitle1".tr(),
                                hintStyle:
                                TextStyle(color: Colors.white70, fontSize: 16.sp),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(12.w),
                                  child: Image.asset(ImageApp.icEmail,
                                      width: 24.w, height: 24.h),
                                ),
                                filled: true,
                                fillColor: const Color(0xFF282A28),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            /// Password
                            TextFormField(
                              controller: password,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value != confirmPassword.text) {
                                  return 'Password not match';
                                }
                                return null;
                              },

                              obscureText: !isPasswordVisible,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "loginTitle2".tr(),
                                hintStyle:
                                TextStyle(color: Colors.white70, fontSize: 16.sp),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(12.w),
                                  child: Image.asset(ImageApp.icLock,
                                      width: 24.w, height: 24.h),
                                ),
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
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            /// Confirm Password
                            TextFormField(
                              controller: confirmPassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your confirm password';
                                }
                                return null;
                              },
                              obscureText: !isConfirmPasswordVisible,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "screenRegister4".tr(),
                                hintStyle:
                                TextStyle(color: Colors.white70, fontSize: 16.sp),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(12.w),
                                  child: Image.asset(ImageApp.icLock,
                                      width: 24.w, height: 24.h),
                                ),
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
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            /// Phone
                            TextFormField(
                              controller: phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "screenRegister5".tr(),
                                hintStyle:
                                TextStyle(color: Colors.white70, fontSize: 16.sp),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(12.w),
                                  child: Image.asset(ImageApp.icPhone,
                                      width: 24.w, height: 24.h),
                                ),
                                filled: true,
                                fillColor: const Color(0xFF282A28),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            /// Button
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {

                                        context.read<FirebaseAuthCubit>().signUP(email.text.trim(), password.text.trim(),phone.text.trim(), name.text.trim(), ImageApp.byProfile);

                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsApp.secondaryGold,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                ),
                                child: Text(
                                  "screenRegister6".tr(),
                                  style: StyleApp.mdText.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 15),

                            /// Login Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "screenRegister7".tr(),
                                  style: StyleApp.smText.copyWith(fontSize: 16),
                                ),
                                GestureDetector(
                                  onTap: () => context.router.back(),
                                  child: Text(
                                    "screenRegister8".tr(),
                                    style: StyleApp.smText.copyWith(
                                      color: ColorsApp.secondaryGold,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 40),

                            /// Language Toggle - زي Login بالظبط
                            Padding(
                              padding: const EdgeInsets.only(left: 175, right: 120),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.yellow, width: 2),
                                ),
                                child: Row(
                                  spacing: 18,
                                  children: [
                                    // English Flag
                                    InkWell(
                                      onTap: () {
                                        context.setLocale(Locale('en'));
                                      },
                                      child: Container(
                                        padding: context.locale == Locale('en')
                                            ? null
                                            : EdgeInsets.symmetric(horizontal: 4),
                                        decoration: context.locale == Locale('en')
                                            ? BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          border: Border.all(
                                            color: Colors.yellow,
                                            width: 4,
                                          ),
                                        )
                                            : null,
                                        child: Image.asset(
                                          "assets/images/LR.png",
                                          height: 30,
                                          width: 30,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    // Arabic Flag
                                    InkWell(
                                      onTap: () {
                                        context.setLocale(Locale('ar'));
                                      },
                                      child: Container(
                                        decoration: context.locale == Locale('ar')
                                            ? BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          border: Border.all(
                                            color: Colors.yellow,
                                            width: 4,
                                          ),
                                        )
                                            : null,
                                        padding: context.locale == Locale('ar')
                                            ? null
                                            : EdgeInsets.symmetric(horizontal: 4),
                                        child: Image.asset(
                                          "assets/images/EG.png",
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );


        },  listener: (context, state) {
        if (state is SignUpSucess) {

          final user = UserModel(
            id: FirebaseAuth.instance.currentUser!.uid,
            email: email.text.trim(),
            name: name.text.trim(),
            phone: phone.text.trim(),
            avatar: ImageApp.byProfile,
          );

          context.read<UserBloc>().add(setUser(user));


          context.pushRoute(LoginRoute());
        } else if (state is SignUpError) {

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },

      ),
    );
  }

  Widget _buildAvatar(String imagePath,
      {bool isLarge = false, bool isSmall = false}) {
    double size = isLarge ? 120.r : 70.r;
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage(imagePath),
    );
  }
}