import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void signUpUser({required String email, required String password}) async {
    emit(SignUpLoading());
    try {
      // ignore: unused_local_variable
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'weak-password') {
        emit(
          SignUpFailure(
            titleMessage: "Password Too Weak",
            descriptionMessage:
                "Use at least 6 characters with letters, numbers, and symbols.",
          ),
        );
      } else if (e.code == 'invalid-email') {
        emit(
          SignUpFailure(
            titleMessage: "Email Issue",
            descriptionMessage: "Try logging in or use a different email.",
          ),
        );
      } else if (e.code == "email-already-in-use") {
        emit(
          SignUpFailure(
              titleMessage: "Email Already Registered",
              descriptionMessage:
                  "The email is already in use; please choose another."),
        );
      }
    } catch (e) {
      emit(
        SignUpFailure(
          descriptionMessage: e.toString(),
          titleMessage: "Error",
        ),
      );
    }
  }
}
