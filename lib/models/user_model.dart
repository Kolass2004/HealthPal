enum Status {
  waiting,
  declined,
  accepted,
}

class UserModel {
  String userName;
  String email;
  String password;
  Status status;

  // Constructor
  UserModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.status,
  });

  // Convert a UserModel object to JSON (to store in Firebase or an API)
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
      'status': status.toString().split('.').last,
    };
  }

  // Create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      status: Status.values.firstWhere(
        (e) => e.toString() == 'Status.${json['status']}',
      ), // Convert string back to enum
    );
  }
}
