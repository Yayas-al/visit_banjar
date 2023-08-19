import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_banjar/cubit/auth_cubit.dart';
import 'package:visit_banjar/cubit/destination_cubit.dart';
import 'package:visit_banjar/cubit/page_cubit.dart';
import 'package:visit_banjar/ui/all.dart';
import 'package:visit_banjar/ui/dasboard_page.dart';
import 'package:visit_banjar/ui/get_started.dart';
import 'package:visit_banjar/ui/local_page.dart';
import 'package:visit_banjar/ui/main_page.dart';
import 'package:visit_banjar/ui/setting.dart';
import 'package:visit_banjar/ui/sign_in_page.dart';
import 'package:visit_banjar/ui/sign_up_page.dart';
import 'package:visit_banjar/ui/splash_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create : (context) => PageCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => DestinationCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/get-started': (context) => const GetStartedPage(),
          '/sign_up': (context) =>  SignUpPage(),
          '/sign-in': (context) =>  SignInPage(),
          '/dashboard-page': (context) => const DashboardPage(),
          '/main': (context) => const MainPage(),
          '/all-destination' : (context) => AllDestination(),
          '/setting' : (context) => const Setting(),
          '/local' : (context) =>const LocalPage(),
        },
      ),
    );
  }
}
