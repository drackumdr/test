// lib/widgets/user_search_delegate.dart
import 'package:flutter/material.dart';
import '../models/app_user.dart';

class UserSearchDelegate extends SearchDelegate<AppUser?> {
  final List<AppUser> users;

  UserSearchDelegate({required this.users});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredUsers = users.where(
      (user) => user.email.toLowerCase().contains(query.toLowerCase()),
    );

    return ListView(
      children: filteredUsers
          .map(
            (user) => ListTile(
              title: Text(user.email),
              subtitle: Text(user.role),
              onTap: () => close(context, user),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredUsers = users.where(
      (user) => user.email.toLowerCase().contains(query.toLowerCase()),
    );

    return ListView(
      children: filteredUsers
          .map(
            (user) => ListTile(
              title: Text(user.email),
              subtitle: Text(user.role),
              onTap: () => close(context, user),
            ),
          )
          .toList(),
    );
  }
}
