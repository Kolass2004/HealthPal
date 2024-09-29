import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_pal/models/user_model.dart';
import 'package:meta/meta.dart';

part 'display_user_state.dart';

class DisplayUserCubit extends Cubit<DisplayUserState> {
  DisplayUserCubit() : super(DisplayUserInitial());

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> displayUserData(String userId) async {
    emit(DisplayUserLoading());
    var userDataSnapshot = await users.doc(userId).get();

    print(userId);

    if (userDataSnapshot.exists) {
      UserModel user =
          UserModel.fromJson(userDataSnapshot.data() as Map<String, dynamic>);
      emit(DisplayUserSuccess(userModel: user));
    } else {
      emit(DisplayUserFailure(errMessage: "No user found"));
    }
  }
}
