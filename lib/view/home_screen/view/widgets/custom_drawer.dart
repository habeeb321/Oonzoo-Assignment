import 'package:flutter/material.dart';
import 'package:oonzoo_assignment/core/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/drawer_background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/profile.jpeg"),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: kWhitecolor,
                          ),
                        ),
                        SizedBox(height: 2),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: kWhitecolor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildDrawerButton(
                    context,
                    text: 'Account',
                    icon: Icons.account_circle_outlined,
                    onPressed: () {
                      // Handle account button press
                    },
                  ),
                  _buildDrawerButton(
                    context,
                    text: 'Order History',
                    icon: Icons.history,
                    onPressed: () {
                      // Handle order history button press
                    },
                  ),
                  _buildDrawerButton(
                    context,
                    text: 'Track Order',
                    icon: Icons.local_shipping_outlined,
                    onPressed: () {
                      // Handle track order button press
                    },
                  ),
                  _buildDrawerButton(
                    context,
                    text: 'Cash Refund',
                    icon: Icons.money,
                    onPressed: () {
                      // Handle cash refund button press
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerButton(BuildContext context,
      {required String text,
      required IconData icon,
      required VoidCallback onPressed}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onPressed,
    );
  }
}
