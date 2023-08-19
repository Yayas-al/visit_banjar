import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_banjar/cubit/auth_cubit.dart';
import '../shared/theme.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({Key? key}) : super (key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    Timer(const Duration(seconds: 3), (){

      User ? user = FirebaseAuth.instance.currentUser;

      if(user == null ){
        Navigator.pushNamedAndRemoveUntil(context, '/get-started', (route) => false);
      }else{
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);}
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
          width : 400,
          height: 400,
          decoration:  const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/logo.png')
          ),
            ),
            )
          ],
        ),
      ),
    );
  }
}