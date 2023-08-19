import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visit_banjar/model/destination_model.dart';

class DestinationService{


  CollectionReference _destinationRef = FirebaseFirestore.instance.collection('destination');


  Future<List<DestinationModel>> fetchDestinations() async{
    try{
      QuerySnapshot result = await  _destinationRef.get();

      List<DestinationModel> destination = result.docs.map((e){
        return DestinationModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return destination;
    }catch(e){
      rethrow;
    }
  }

}