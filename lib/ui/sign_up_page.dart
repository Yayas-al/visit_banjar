import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_banjar/cubit/auth_cubit.dart';
import 'package:visit_banjar/ui/widget/custom_button.dart';
import 'package:visit_banjar/ui/widget/custom_text_form_field.dart';
import '../shared/theme.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Text(
          'Join us and get\nYour next adventure',
          style: whiteTextStyle.copyWith(
              fontSize: 30,
              fontWeight: semiBold
          ),
        ),
      );
    }
    Widget inputSection() {
      Widget nameInput() {
        return CustomTextFromField(
          title: 'Full Name',
          hintText: 'Your Name here',
          controller: nameController,);
      }
      Widget emailInput() {
        return CustomTextFromField(title: 'Email Adress',
          hintText: 'Your Email here',
          controller: emailController,);
      }
      Widget passwordInput() {
        return CustomTextFromField(
          title: 'Password',
          hintText: 'Your Password Here',
          obscureText: true,
          controller: passwController,);
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if(state is AuthSuccess){
              Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
            }
            else if (state is AuthFailed){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.error),
                )
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomButton(
              title: 'Sign Up',
              onPressed: () {
                context.read<AuthCubit>().signUp(
                    email: emailController.text,
                    password: passwController.text,
                    name: nameController.text);
              }, heigt: 55,

            );
          },
        );
      }
      Widget signText() {
        return Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
              top: 25,
              bottom: 35
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Have an account?',
                style: blackTextStyle,
              ),
              TextButton(onPressed: () {
                Navigator.pushNamed(context, '/sign-in');
              },
                  child: const Text(
                    'Sign In',
                  ))
            ],
          ),
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 50),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(17)
        ),
        child: Column(
          children: [
            nameInput(),
            emailInput(),
            passwordInput(),
            submitButton(),
            signText()
          ],
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/blckWalpaper.png'
          ),
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              children: [
                title(),
                inputSection(),
              ],
            ),
          )
      ),
    );
  }
}
