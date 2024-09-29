import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_pal/models/user_model.dart';
import 'package:meta/meta.dart';

part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsersCubit() : super(GetUsersInitial());

  var users = FirebaseFirestore.instance.collection('users');
  List<UserModel> usersList = [];

  void getUsersMethode() async {
    emit(GetUsersLoading());
    try {
      users.snapshots().listen((event) {
        // Clear the users list before adding new data
        usersList.clear();

        // Check if we received any documents
        if (event.docs.isNotEmpty) {
          for (var item in event.docs) {
            // Log or print data for debugging

            // Add each user to the list
            usersList.add(UserModel.fromJson(item.data()));
          }

          // Emit the success state with the updated users list
          emit(GetUsersSuccess(usersList: usersList));
        } else {
          // Emit empty state if no users are found
          emit(GetUsersSuccess(usersList: const []));
        }
      });
    } catch (e) {
      // Emit failure state in case of an error
      emit(GetUsersFailure(errMessage: e.toString()));
    }
  }

  Future<void> acceptUser(UserModel user) {
    return users.doc(user.email).update({'status': 'accepted'});
  }

  Future<void> declineUser(UserModel user) {
    return users.doc(user.email).update({'status': 'declined'});
  }
}
