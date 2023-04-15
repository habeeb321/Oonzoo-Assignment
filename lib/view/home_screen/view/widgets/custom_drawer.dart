import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oonzoo_assignment/core/constants.dart';
import 'package:oonzoo_assignment/view/login_screen/view/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              InkWell(
                onTap: () => nextScreen(context, const LoginScreen()),
                child: Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/background.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.orange.shade800,
                            child: const Icon(
                              Icons.person_outline,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Row(
                            children: const [
                              Text(
                                'Login / Register',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              kWidth20,
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.person_outline),
                        onPressed: () {
                          // Navigate to account page
                        },
                      ),
                      const Text('Account'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.work_history_outlined),
                        onPressed: () {
                          // Navigate to order history page
                        },
                      ),
                      const Text('Orders'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.local_shipping_outlined),
                        onPressed: () {
                          // Navigate to track order page
                        },
                      ),
                      const Text('Track'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.monetization_on_outlined),
                        onPressed: () {
                          // Navigate to cash refund page
                        },
                      ),
                      const Text('Refund'),
                    ],
                  ),
                ],
              ),
              kHeight10,
              divider,
              kHeight10,
              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: const Text('Home'),
                    onTap: () {
                      // Handle Home Tap
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications_outlined),
                    title: const Text('Notifications'),
                    onTap: () {
                      // Handle Home Tap
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.local_offer_outlined),
                    title: const Text('Offer Zone'),
                    onTap: () {
                      // Handle Home Tap
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite_outline),
                    title: const Text('Parenting'),
                    onTap: () {
                      // Handle Home Tap
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.explore_outlined),
                    title: const Text('Explore'),
                    onTap: () {
                      // Handle Home Tap
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
