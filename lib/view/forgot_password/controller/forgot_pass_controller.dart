import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oonzoo_assignment/core/constants.dart';

class ForgotPassController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void resetPassword(context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      showSnackbar(context, 'Password Reset Email Sent');
      emailController.clear();
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message.toString());
      Navigator.pop(context);
    }
  }
}
