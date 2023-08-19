import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:visit_banjar/model/user_model.dart';
import 'package:visit_banjar/services/auth_services.dart';
import 'package:visit_banjar/services/user_Service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp({ required String email, required String password, required String name,})async{
    try{
      emit(AuthLoading());
      UserModel user = await AuthService().signUp(email: email, password: password, name: name);

      emit(AuthSuccess(user));
    } catch(e){
      emit(AuthFailed(e.toString()));
    }
    }

  void login({required String email, required String password}) async {
    try {
      emit(AuthLoading());

      // Perform the login using AuthService
      UserModel? user = await AuthService().login(email: email, password: password);

      emit(AuthSuccess(user!));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
  void signOut() async{
    try{
      await AuthService().signOut();
      emit(AuthInitial());
    }catch(e){
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async{
    try{
      UserModel? user = await UserService().getUserById(id);
      emit(AuthSuccess(user!));
    }catch(e){
      emit(AuthFailed(e.toString()));
    }
  }

}
