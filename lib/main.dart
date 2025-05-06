import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pintrestapkclone/Presentation/Home%20Screen/Components/HomeScreen.dart';
import 'package:pintrestapkclone/Presentation/Home%20Screen/cubit/home_cubit.dart';
import 'package:pintrestapkclone/Presentation/Splash%20Screen/Components/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => HomeCubit(),
        child: Homescreen(),
      ),
    );
  }
}
