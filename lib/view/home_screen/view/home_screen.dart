import 'package:flutter/material.dart';
import 'package:oonzoo_assignment/core/constants.dart';
import 'package:oonzoo_assignment/detail_screen/detail_screen.dart';
import 'package:oonzoo_assignment/view/home_screen/controller/home_controller.dart';
import 'package:oonzoo_assignment/view/home_screen/view/widgets/custom_drawer.dart';
import 'package:oonzoo_assignment/view/home_screen/view/widgets/top_bar.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    provider.getApi();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey.shade300,
      extendBodyBehindAppBar: true,
      drawer: const Drawer(child: CustomDrawer()),
      body: Center(
        child: Consumer<HomeController>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SafeArea(
                  child: Column(
                    children: [
                      const TopBar(),
                      kHeight10,
                      value.isLoading == true
                          ? SizedBox(
                              height: size.height * 0.9,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : SizedBox(
                              height: 50,
                              child: Image.asset(
                                'assets/topimage.jpeg',
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                            ),
                      kHeight10,
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 1,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            height: 200,
                            aspectRatio: 16 / 9,
                          ),
                          items: [
                            Image.asset(value.images[0], fit: BoxFit.cover),
                            Image.asset(value.images[1], fit: BoxFit.cover),
                            Image.asset(value.images[2], fit: BoxFit.cover),
                            Image.asset(value.images[3], fit: BoxFit.cover),
                            Image.asset(value.images[4], fit: BoxFit.cover),
                            Image.asset(value.images[5], fit: BoxFit.cover),
                          ],
                        ),
                      ),
                      kHeight10,
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 1,
                            aspectRatio: 16 / 9,
                            autoPlayInterval: const Duration(seconds: 3),
                            height: 50,
                          ),
                          items: [
                            Image.asset(
                              value.imagesc[0],
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                            ),
                            Image.asset(
                              value.imagesc[1],
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                      kHeight10,
                      const Text(
                        'Shop By Category',
                        style: TextStyle(fontSize: 18),
                      ),
                      kHeight10,
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: value.itemList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) {
                          final data = value.itemList[index];
                          return InkWell(
                            onTap: () =>
                                nextScreen(context, DetailScreen(index: index)),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      data.image.toString(),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    data.title!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  kHeight10,
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
