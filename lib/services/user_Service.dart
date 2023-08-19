import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visit_banjar/model/user_model.dart';

class UserService{
  CollectionReference _userReference =
  FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async{
    try{
      _userReference.doc(user.id).set({
        'email' : user.email,
        'name' : user.name,
      });
    }catch(e){
      rethrow;
    }
  }
  Future<UserModel?> getUserById(String id) async {
    try {
      DocumentSnapshot userSnapshot = await _userReference.doc(id).get();
      if (userSnapshot.exists) {
        return UserModel(
          id: id,
          email: userSnapshot['email'] as String,
          name: userSnapshot['name'] as String,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}