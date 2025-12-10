import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../models/user.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.fetchUsers();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100 &&
          !provider.isLoading) {
        provider.fetchUsers();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select User")),
      body: Consumer<UserProvider>(
        builder: (_, provider, __) {
          if (provider.users.isEmpty && provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.users.isEmpty) {
            return const Center(child: Text("No Users"));
          }
          return RefreshIndicator(
            onRefresh: () => provider.refreshUsers(),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: provider.users.length + 1,
              itemBuilder: (_, index) {
                if (index == provider.users.length) {
                  return provider.hasMore
                      ? const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  )
                      : const SizedBox.shrink();
                }
                final User user = provider.users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  title: Text("${user.firstName} ${user.lastName}"),
                  subtitle: Text(user.email),
                  onTap: () {
                    provider.setSelectedUser("${user.firstName} ${user.lastName}");
                    Navigator.pop(context);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
