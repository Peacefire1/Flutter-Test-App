import 'dart:js';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/global_key.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/screens/login.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  void _onChangeLanguage() {
    final context = GlobalKeys.navigatorKey.currentContext!;
    if (context.locale.languageCode == Locale("mn", "MN").languageCode) {
      context.setLocale(Locale("en", "US"));
    } else {
      context.setLocale(Locale("mn", "MN"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(
      builder: (context, provider, child) {
        return provider.isLoggedIn
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: _onChangeLanguage,
                        child: Text(context.locale.languageCode)),
                    ElevatedButton(
                      onPressed: provider.onLogOut,
                      child: Text("Log Out"),
                    ),
                  ],
                ),
              )
            : LoginPage();
      },
    );
  }
}
