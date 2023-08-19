import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_banjar/shared/theme.dart';
import 'package:visit_banjar/ui/widget/destination_tile.dart';
import '../cubit/destination_cubit.dart';
import '../model/destination_model.dart';

class AllDestination extends StatefulWidget {
  const AllDestination({super.key});

  @override
  State<AllDestination> createState() => _AllDestinationState();
}

class _AllDestinationState extends State<AllDestination> {

  @override
  void initState() {
    context.read<DestinationCubit>().fetcDestination();
    super.initState();
  }
  List<DestinationModel> allDestinations = [];
  List<DestinationModel> filteredDestinations = [];
  final TextEditingController searchController = TextEditingController();

  void searchDestinations(String query) {
    setState(() {
      filteredDestinations = allDestinations
          .where((destination) =>
          destination.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      filteredDestinations.sort((a, b) => a.name.compareTo(b.name));
    });
  }


  Widget header() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Cari Tempat Indah Nih ? ',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                  height: 30
              ),
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: searchController,
                onChanged: searchDestinations,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kBtColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'eg: Dieng',
                ),
              )
            ],
          ),
        ],

      ),
    );
  }

  Widget search(List<DestinationModel> destination) {
    return Container(
      margin: EdgeInsets.only(
          top: 20,
          left: defaultMargin,
          right: defaultMargin, bottom: 100
      ),
      child: Column(
        children: destination.map(( destination) {
          return DestinationTile(destination);
        }
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          allDestinations = state.destination;
          return ListView(
            children: [
              header(),
              search(filteredDestinations.isNotEmpty
                  ? filteredDestinations
                  : allDestinations),
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
