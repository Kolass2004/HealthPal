import 'package:flutter/material.dart';
import 'package:health_pal/models/user_model.dart';
import 'package:health_pal/widgets/users_list_item.dart';

class UsersListView extends StatelessWidget {
  const UsersListView({super.key, required this.items});

  final List<UserModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 12,
      ),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: UsersListItem(
          userModel: items[index],
        ),
      ),
    );
  }
}
