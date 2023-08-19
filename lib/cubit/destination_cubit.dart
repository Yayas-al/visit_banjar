import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:visit_banjar/services/destination_service.dart';
import '../model/destination_model.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fetcDestination() async {
    try{

       emit(DestinationLoading());

       List<DestinationModel> destination =
       await DestinationService().fetchDestinations();

       emit(DestinationSucces(destination));

    }catch(e){
      emit(DestinationFailed(e.toString()));
    }
  }
}
