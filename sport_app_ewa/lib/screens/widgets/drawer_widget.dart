// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app_ewa/cubit/update_bool_value_cubit.dart';
import 'package:sport_app_ewa/data/global_data/global_data.dart';
import 'package:sport_app_ewa/screens/login/login_screen.dart';
import 'package:sport_app_ewa/screens/splash/splash_screen.dart';
import 'package:sport_app_ewa/services/login_with_google.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //bloc
    return Drawer(
      child: BlocBuilder<UpdateBoolValueCubit, UpdateBoolValueState>(
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xff2a3c4e),
                ),
                child: Center(
                  child: Text(
                    '${state is UpdateBoolValueSuccess ? state.value ? phoneNum.text : LoginServices.user!.displayName : ''}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xff89232e))),
                    onPressed: () async {
                      await LoginServices.logout();
                      if (state is UpdateBoolValueSuccess
                          ? state.value
                          : false) {
                        phoneNum.clear();
                        otp.clear();
                      }
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen()),
                          (Route route) => false);
                    },
                    child: const Text(
                      'Log out',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}
