import 'package:firebase_auth/firebase_auth.dart';
import 'package:visit_banjar/services/user_Service.dart';

import '../model/user_model.dart';


class AuthService{
FirebaseAuth _auth = FirebaseAuth.instance;

Future<UserModel> signUp({
  required String email,
  required String password,
  required String name}) async{
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    UserModel user = UserModel(
      id : userCredential.user!.uid,
      email: email,
      name: name,
    );

    await UserService().setUser(user);
    return user;
  }catch(e){
    rethrow;
  }
}

Future<UserModel?> login({
  required String email,
  required String password,
}) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    String uid = userCredential.user!.uid;
    UserModel? user = await UserService().getUserById(uid);
    return user;
  } catch (e) {
    rethrow;
  }
}
Future<void> signOut() async{
  try{
    _auth.signOut();
  }catch(e){
    rethrow;
  }
}
}

