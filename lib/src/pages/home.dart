import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
          return const Profile();
        } else {
          return const LoginWidget();
        }
      },
    );
  }
}
