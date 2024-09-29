import 'package:flutter/material.dart';
import 'package:health_pal/models/user_model.dart';

class UserStatusView extends StatelessWidget {
  final Status status;

  const UserStatusView({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.accepted:
        return _buildAcceptedView();
      case Status.waiting:
        return _buildWaitingView();
      case Status.declined:
      default:
        return _buildDeclinedView();
    }
  }

  Widget _buildAcceptedView() {
    return Container(
      color: Colors.green[100], // Light green background
      padding: const EdgeInsets.all(20),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 60),
          SizedBox(height: 20),
          Text(
            "You Are Accepted, Welcome Aboard!!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildWaitingView() {
    return Container(
      color: Colors.yellow[100], // Light yellow background
      padding: const EdgeInsets.all(20),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.hourglass_empty, color: Colors.orange, size: 60),
          SizedBox(height: 20),
          Text(
            "Wait for the admin to accept your account.",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDeclinedView() {
    return Container(
      color: Colors.red[100], // Light red background
      padding: const EdgeInsets.all(20),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.cancel, color: Colors.red, size: 60),
          SizedBox(height: 20),
          Text(
            "You are declined.",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
