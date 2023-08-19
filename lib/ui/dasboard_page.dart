import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_banjar/cubit/auth_cubit.dart';
import 'package:visit_banjar/cubit/destination_cubit.dart';
import 'package:visit_banjar/ui/widget/destination_card.dart';
import 'package:visit_banjar/ui/widget/destination_tile.dart';

import '../model/destination_model.dart';
import '../shared/theme.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  void initState(){
    context.read<DestinationCubit>().fetcDestination();
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('hello, \n${state.user.name}'
                            '',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                            height: 12
                        ),
                        Text('Mau kemana hari ini ?',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    Widget popularDestination(List<DestinationModel> destination) {
      return Container(
          margin: const EdgeInsets.only(
            top: 30,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: defaultMargin
                  ),
                  child: Text('Popular Destination',
                    style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: reguler
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                 SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: destination.map((DestinationModel destination){
                      return DestinationCardWidget(destination);
                    }
                    ).toList(),
                  ),
                ),
              ]
          )
      );
    }

    Widget newDestination(List<DestinationModel> destination) {
      return Container(
        margin: EdgeInsets.only(
            top: 20,
            left: defaultMargin,
            right: defaultMargin, bottom: 100
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('New Destination',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: reguler,
              ),
            ),
            Column(
              children : destination.map((DestinationModel destination){
                return DestinationTile(destination);
              }
              ).toList(),
            ),
          ],
        ),
      );
    }
    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.error),
              )
          );
        }
      },
      builder: (context, state) {
        if(state is DestinationSucces){
          final List<DestinationModel> newDestinations = state.destination
              .where((destination) => destination.category == 'new')
              .toList();

          final List<DestinationModel> popularDestinations = state.destination
              .where((destination) => destination.category == 'popular')
              .toList();
          return ListView(
            children: [
              header(),
              popularDestination(popularDestinations),
              newDestination(newDestinations)
            ],
          );
        }
        return const Center (
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
