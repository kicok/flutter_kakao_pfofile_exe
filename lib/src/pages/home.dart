import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kakao_profile_exe/src/controller/profile_controller.dart';

import 'login_widget.dart';
import 'profile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ProfileController.to.authstateChanges(snapshot.data);
          return const Profile();
        } else {
          return const LoginWidget();
        }
      },
    );
  }
}
