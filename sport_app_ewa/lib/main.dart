import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app_ewa/cubit/get_current_country_cubit.dart';
import 'package:sport_app_ewa/cubit/get_info_cubit.dart';
import 'package:sport_app_ewa/cubit/update_bool_value_cubit.dart';
import 'package:sport_app_ewa/firebase_options.dart';
import 'package:sport_app_ewa/screens/home/home_screen.dart';
import 'package:sport_app_ewa/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UpdateBoolValueCubit>(
          create: (BuildContext context) => UpdateBoolValueCubit(),
        ),
        BlocProvider<GetInfoCubit>(
          create: (BuildContext context) => GetInfoCubit(),
        ),
        BlocProvider<GetCurrentCountryCubit>(
          create: (BuildContext context) => GetCurrentCountryCubit(),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: SplashScreen()),
    );
  }
}
