import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> logInUserMethode({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        emit(
          SignInFailure(
            descriptionErrMessage: "The email address is badly formatted.",
            titleErrorMessage: "Email Issue",
          ),
        );
      } else if (e.code == 'invalid-credential') {
        emit(
          SignInFailure(
            descriptionErrMessage: "No user found for that email.",
            titleErrorMessage: "Email Not Registered",
          ),
        );
      }
    } catch (e) {
      emit(
        SignInFailure(
          descriptionErrMessage: e.toString(),
          titleErrorMessage: "Error",
        ),
      );
    }
  }
}
