import 'package:flutter/material.dart';
import 'package:visit_banjar/cubit/auth_cubit.dart';
import 'package:visit_banjar/ui/widget/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is AuthFailed){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
            )
          );
        }else if(state is AuthInitial){
          Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
        }
      },
      builder: (context, state) {
        return Center(
          child: CustomButton(
            heigt: 55,
            title: 'Sign Out',
            onPressed: () {
              context.read<AuthCubit>().signOut();
            },
            width: 220,
          ),
        );
      },
    );
  }
}
