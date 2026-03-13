import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_c17_me/core/resources/app_string.dart';
import 'package:movie_c17_me/core/resources/colors_app.dart';
import 'package:movie_c17_me/core/resources/image&icon.dart';
import 'package:movie_c17_me/core/resources/style_app.dart';
import 'package:movie_c17_me/di.dart';
import 'package:movie_c17_me/features/edit_profile/presetation/bloc/update_user_bloc.dart';
import 'package:movie_c17_me/features/edit_profile/presetation/bloc/update_user_event.dart';
import 'package:movie_c17_me/features/profile/data/data_sourc/model/user_model.dart';
import 'package:movie_c17_me/features/profile/presentation/bloc/user_bloc.dart';
import 'package:movie_c17_me/features/profile/presentation/bloc/user_event.dart';

import '../bloc/update_user_state.dart';



@RoutePage()


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key,required this.user});
final UserModel user;
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneC = TextEditingController();
    TextEditingController nameC = TextEditingController();nameC.text = user.name;
    phoneC.text = user.phone ?? '';

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>getIt<UpdateUserBloc>())
      ],

        child: Builder(
          builder: (context) {
            return Scaffold(
              backgroundColor: ColorsApp.background,
              body:  BlocListener<UpdateUserBloc, UpdateUserState>(
                listener: (BuildContext context,  state) {
                  if (state.getUserStatus == RequestStatus.success) {
                    context.read<UserBloc>().add(getUser());
                    context.pop();
                  }
                },
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(height: 10),

                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.yellow,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Center(
                          child: Text(
                            "Pick Avatar",
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        AvatarPicker(
                          image: user.avatar??'',
                        ),

                        const SizedBox(height: 30),

                        ProfileTextField(
                          controller: nameC,
                          icon: Icons.person,
                          hint: user.name,
                        ),

                        const SizedBox(height: 15),

                        ProfileTextField(
                          controller: phoneC,
                          icon: Icons.phone,
                          hint: user?.phone??'',
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Reset Password",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),

                        const Spacer(),

                        PrimaryButton(
                          text: "Delete Account",
                          color: Colors.red,
                          onTap: () {},
                        ),

                        const SizedBox(height: 10),

                        PrimaryButton(
                          text: "Update Data",
                          color: ColorsApp.primaryGold,
                          onTap: () {

                            var users = UserModel(
                              id: user.id ?? FirebaseAuth.instance.currentUser!.uid,
                              email: user.email,
                              name: nameC.text.trim(),
                              avatar: context.read<UpdateUserBloc>().state.avtar?[context.read<UpdateUserBloc>().state.selectedAvatar],
                              phone: phoneC.text.trim(),
                            );

                            context.read<UpdateUserBloc>().add(UpdateUser(users));
                          },
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        ),
      );

  }
}


class ProfileTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
final controller;
  const ProfileTextField({
    super.key,
    required this.icon,
    required this.controller,
    required this.hint,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: ColorsApp.sceondry,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.white),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
class AvatarPicker extends StatelessWidget {
  final String image;

  const AvatarPicker({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final bloc = context.read<UpdateUserBloc>();

        showModalBottomSheet(
          context: context,
          backgroundColor: ColorsApp.background,
          builder: (_) {
            return BlocProvider.value(
              value: bloc,
              child: const AvatarBottomSheet(),
            );
          },
        );
      },
      child: Center(
        child: CircleAvatar(
          radius: 45,
          backgroundImage: AssetImage(image),
        ),
      ),
    );
  }
}

class AvatarBottomSheet extends StatelessWidget {
  const AvatarBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateUserBloc, UpdateUserState>(
      builder: (BuildContext context, state) {


        return GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount:   state.avtar?.length??0,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.read<UpdateUserBloc>().add(ChangeAvatr(index));
              },
              child: Container(
                decoration: BoxDecoration(
                  color:   state.selectedAvatar ==index ?ColorsApp.primaryGold : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: ColorsApp.primaryGold),
                ),
                child: Image.asset("${state.avtar?[index]??[]}"),
              ),
            );
          },
        );
      },

    );
  }
}


class PrimaryButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}