
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_banjar/cubit/page_cubit.dart';
import 'package:visit_banjar/cubit/page_state.dart';
import 'package:visit_banjar/shared/theme.dart';
import 'package:visit_banjar/ui/all.dart';
import 'package:visit_banjar/ui/dasboard_page.dart';
import 'package:visit_banjar/ui/setting.dart';

import 'hotel.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildPage(context
              .watch<PageCubit>()
              .state
              .selectedIndex),
          _buildBottomNavigationBar(context),
        ],
      ),
    );

  }
  Widget _buildPage(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const DashboardPage();
      case 1:
        return const AllDestination();
      case 2:
        return const Setting();
      default:
        return const DashboardPage();
    }
  }

  Widget _buildBottomNavigationBar(BuildContext context){
    return Align(
      alignment: Alignment.bottomCenter,
      child:Container(
        width: double.infinity,
        height: 60,
        margin: EdgeInsets.only(
          bottom: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: kBlackColor,
          borderRadius: BorderRadius.circular(18)
        ),
        child: BlocBuilder<PageCubit, PageState>(
            builder: (context, state){
              return BottomNavigationBar(
                  currentIndex: state.selectedIndex,
                  onTap: (index){
                    context.read<PageCubit>().selectPageIndex(index);
                  },
                  unselectedItemColor: Colors.blueGrey.shade700,
                  selectedItemColor: Colors.blue,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.place),
                      label: 'Destination',
                    ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
              ]
              );
            }
        ),
      ),
    );
  }
}