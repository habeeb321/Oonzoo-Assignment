import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oonzoo_assignment/injection/locator.dart';
import 'package:oonzoo_assignment/view/home_screen/model/home_model.dart';
import 'package:oonzoo_assignment/view/home_screen/service/home_service.dart';

class HomeController extends ChangeNotifier {
  List<HomeModel> itemList = [];
  bool isLoading = false;

  List<String> images = [
    "assets/c1.jpeg",
    "assets/c2.jpeg",
    "assets/c3.jpeg",
    "assets/c4.jpeg",
    "assets/c5.jpeg",
    "assets/c6.jpeg",
  ];

  List<String> imagesc = [
    "assets/cn1.jpeg",
    "assets/cn2.jpeg",
  ];

  void getApi() async {
    isLoading = true;
    await locator.get<HomeService>().fetchApi().then((value) {
      if (value != null) {
        itemList = value;
        notifyListeners();
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void signingOut(context) {
    isLoading = true;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to logout'),
          actions: [
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              child: const Text('Continue'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
    isLoading = false;
    notifyListeners();
  }
}
