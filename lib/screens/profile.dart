import 'dart:js';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie/global_key.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/screens/login.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _onChangeLanguage() {
    final context = GlobalKeys.navigatorKey.currentContext!;
    if (context.locale.languageCode == Locale("mn", "MN").languageCode) {
      context.setLocale(Locale("en", "US"));
    } else {
      context.setLocale(Locale("mn", "MN"));
    }
  }

  void _onImagePick(ImageSource source) async {
    XFile? file = await ImagePicker().pickImage(source: source);
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
                        onPressed: () => _onImagePick(ImageSource.gallery),
                        child: Text("Upload Photo")),
                    ElevatedButton(
                        onPressed: () => _onImagePick(ImageSource.camera),
                        child: Text("Camera")),
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
