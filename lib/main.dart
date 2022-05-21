import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Setting/DarkMode.dart';
import 'package:doanchuyennganh/Screens/welcome_screen.dart';
import 'package:doanchuyennganh/bloc/auth_bloc/auth_bloc.dart';
import 'package:doanchuyennganh/repository/auth_repository/auth_repository.dart';
import 'package:doanchuyennganh/widgets/AppBlocObserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(() => runApp(
    MaterialApp(
      home: MyApp(),
    ),),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(create: (context) =>AuthRepository()),
    ], child:
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc(authRepository: RepositoryProvider.of<AuthRepository>(context)))
      ], child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Đồ Án Chuyên Ngành',
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: WelcomeScreen(),
      ),)
    );
  }
}
