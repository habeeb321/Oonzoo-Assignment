import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oonzoo_assignment/core/constants.dart';
import 'package:oonzoo_assignment/main.dart';

class LoginController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void loginEmailPassword(context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      emailController.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbar(context, 'No user found for the email');
      } else if (e.code == 'wrong-password') {
        showSnackbar(context, 'Wrong password provided for the user');
      }
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  // google sign in
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
