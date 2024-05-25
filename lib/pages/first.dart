import 'package:appdevfinal/methods/google.dart';
import 'package:flutter/material.dart';


class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final googleSignInProvider = GoogleSignInProvider();
    googleSignInProvider.checkLoginStatus(context);
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}