import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:oonzoo_assignment/view/forgot_password/controller/forgot_pass_controller.dart';
import 'package:oonzoo_assignment/view/home_screen/controller/home_controller.dart';
import 'package:oonzoo_assignment/view/login_screen/controller/login_controller.dart';
import 'package:oonzoo_assignment/view/main_screen/main_screen.dart';
import 'package:oonzoo_assignment/view/signup_screen/controller/signup_controller.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginController>(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider<SignupController>(
          create: (context) => SignupController(),
        ),
        ChangeNotifierProvider<ForgotPassController>(
          create: (context) => ForgotPassController(),
        ),
        ChangeNotifierProvider<HomeController>(
          create: (context) => HomeController(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
