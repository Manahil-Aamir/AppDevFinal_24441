import 'package:appdevfinal/pages/display.dart';
import 'package:appdevfinal/pages/home.dart';
import 'package:appdevfinal/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Connect {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Login
  // Login function
  void login(
      TextEditingController emailController,
      TextEditingController passwordController,
      BuildContext context,
      GlobalKey<FormState> formKey) async {
    int retryCount = 0;
    const maxRetries = 3;

    while (retryCount < maxRetries) {
      try {
        if (formKey.currentState!.validate()) {
          // Form is valid, proceed with login
          await _auth.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
          // Login successful
          print('Login successful');
          _saveLoginStatus();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Display()),
          );
          return; // Exit the function if login is successful
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          _showErrorDialog('Invalid credentials.', context);
          return; // Exit the function if invalid credentials
        } else {
          // Retry logic: increment retry count and wait before retrying
          retryCount++;
          print('Retrying login (attempt $retryCount)');
          await Future.delayed(
              const Duration(seconds: 3)); // Wait for 3 seconds before retrying
        }
      } catch (error) {
        // Handle other errors
        _showErrorDialog('Sign-in failed: $error', context);
        return; // Exit the function if other errors occur
      }
    }

    // Handle case when max retries exceeded
    _showErrorDialog(
        'Login failed after $maxRetries attempts. Please check your internet connection.',
        context);
  }

  Future<void> _saveLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }

  void register(
      TextEditingController emailController,
      TextEditingController passwordController,
      String name,
      BuildContext context,
      GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      // Form is valid, proceed with registration
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        // Registration successful
        print('Registration successful');
        if (userCredential.user != null) {
          await userCredential.user!.updateProfile(displayName: name);
          await userCredential.user!.reload();
          // Refetch the user to get updated details
          User? updatedUser = _auth.currentUser;
          print(updatedUser);
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Display()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          _showErrorDialog('The password provided is too weak.', context);
        } else if (e.code == 'email-already-in-use') {
          _showErrorDialog(
              'The account already exists for that email.', context);
        }
      } catch (error) {
        // Registration failed
        _showErrorDialog('Registration failed: $error', context);
      }
    }
  }

  void _showErrorDialog(String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
