// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sport_app_ewa/cubit/update_bool_value_cubit.dart';
import 'package:sport_app_ewa/data/global_data/global_data.dart';
import 'package:sport_app_ewa/screens/widgets/dialog_text_otp.dart';
import 'package:sport_app_ewa/screens/home/home_screen.dart';
import 'package:sport_app_ewa/screens/login/components/text_field_widget.dart';
import 'package:sport_app_ewa/screens/widgets/dialog_loading.dart';
import 'package:sport_app_ewa/services/login_with_google.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 170, left: 50),
                    child: Image.asset(
                      'assets/images/logo_player.png',
                      opacity: const AlwaysStoppedAnimation(.2),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 107,
                    child: Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff171c38),
                            ),
                          ),
                          Text(
                            'Login to your account',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff171c38)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    left: 10,
                    top: 260,
                    child: TextFieldWidget(
                      text: 'Enter Phone Number',
                      controller: phoneNum,
                      keyboard: TextInputType.phone,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    left: 10,
                    top: 323,
                    child: TextFieldWidget(
                      text: 'Enter OTP',
                      controller: otp,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    left: 20,
                    top: 388,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color(0xffc8ac89))),
                            onPressed: () {
                              if (phoneNum.text.isEmpty || otp.text.isEmpty) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    'Please fill all fields',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ));
                              } else if (phoneNum.text.length >= 11 ||
                                  phoneNum.text.length < 10) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    'Mobile number must be 10 digits',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ));
                              } else if (otp.text != number) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    'Please enter the correct OTP',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ));
                              } else {
                                showLoading(context);

                                context
                                    .read<UpdateBoolValueCubit>()
                                    .updateValue(isLoginOTP);

                                Future.delayed(Duration(seconds: 2), () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const HomeScreen()),
                                      (Route route) => false);
                                });
                              }
                            },
                            child: const Text('Verify',
                                style: TextStyle(color: Color(0xff171c38)))),
                        SizedBox(
                          width: 9,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color(0xffc8ac89))),
                            onPressed: () {
                              number = generateOTP();
                              dialog(context, number);
                            },
                            child: const Text(
                              'Generate OTP',
                              style: TextStyle(color: Color(0xff171c38)),
                            )),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 3,
                    top: 480,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Color(0xff171c38),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text('OR'),
                        SizedBox(
                          width: 6,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.4,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Color(0xff171c38),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 40,
                    left: 40,
                    top: 540,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xffc8ac89))),
                        onPressed: () async {
                          //login with google

                          try {
                            final user = await LoginServices.loginWithGoogle();

                            if (user != null) {
                              showLoading(context);
                              context
                                  .read<UpdateBoolValueCubit>()
                                  .updateValue(!isLoginOTP);

                              Future.delayed(Duration(seconds: 2), () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const HomeScreen()),
                                    (Route route) => false);
                              });
                            }
                          } on FirebaseAuthException catch (er) {
                            print(er.message);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Something went wrong in server'),
                            ));
                          } catch (er) {
                            print(er);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Something went wrong'),
                            ));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              'Login with Google',
                              style: TextStyle(color: Color(0xff171c38)),
                            ),
                          ],
                        )),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

late String number;
String generateOTP() {
  final rand = Random();
  final otp = List.generate(4, (_) => rand.nextInt(10)).join();
  return otp;
}
