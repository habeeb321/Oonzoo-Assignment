import 'package:flutter/material.dart';
import 'package:oonzoo_assignment/core/constants.dart';
import 'package:oonzoo_assignment/view/login_screen/controller/login_controller.dart';
import 'package:oonzoo_assignment/view/signup_screen/view/signup_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginController>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: provider.formKey,
          child: Consumer<LoginController>(
            builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50.0),
                  const Text(
                    'Login / Register',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    'Email ID',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: value.emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your Email ID',
                      border: const UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange.shade900,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: value.passwordController,
                    decoration: InputDecoration(
                      hintText: 'Enter your Password',
                      border: const UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange.shade900,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        value.loginEmailPassword(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade900,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                      ),
                      child: const Text('CONTINUE'),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          thickness: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'OR',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage('assets/google.png'),
                        height: 30.0,
                        width: 30.0,
                      ),
                      label: const Text(
                        'Continue with Google',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        nextScreen(context, const SignupScreen());
                      },
                      child: const Text(
                        'New to FirstCry? Register Here',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const Divider(
                    thickness: 1.0,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 10.0),
                  RichText(
                    text: const TextSpan(
                      text: "By continuing, you agree to Firstcry's ",
                      style: TextStyle(color: kBlackcolor),
                      children: [
                        TextSpan(
                          text: "Conditions of Use ",
                          style: TextStyle(color: kBlueColor),
                          children: [
                            TextSpan(
                              text: "and ",
                              style: TextStyle(color: kBlackcolor),
                              children: [
                                TextSpan(
                                  text: "Privacy Notice.",
                                  style: TextStyle(color: kBlueColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
