import 'package:flutter/material.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/screens/login.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLogged = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(
      builder: (context, provider, child) {
        return provider.isLoggedIn
            ? Center(
                child: ElevatedButton(
                  onPressed: provider.onLogOut,
                  child: Text("Log Out"),
                ),
              )
            : LoginPage();
      },
    );
  }
}
