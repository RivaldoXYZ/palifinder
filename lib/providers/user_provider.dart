import 'package:flutter/foundation.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class UserProvider extends ChangeNotifier {
  String name = "";
  String selectedUser = "";

  List<User> users = [];
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;

  void setName(String value) {
    name = value;
    notifyListeners();
  }

  void setSelectedUser(String value) {
    selectedUser = value;
    notifyListeners();
  }

  Future<void> refreshUsers() async {
    users = [];
    page = 1;
    hasMore = true;
    await fetchUsers();
  }

  Future<void> fetchUsers() async {
    if (isLoading || !hasMore) return;

    isLoading = true;

    final newUsers = await ApiService.getUsers(page: page, perPage: 10);

    if (newUsers.isEmpty) {
      hasMore = false;
    } else {
      users.addAll(newUsers);
      page++;
    }

    isLoading = false;
    notifyListeners();
  }
}
