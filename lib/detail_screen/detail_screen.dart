import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:oonzoo_assignment/core/constants.dart';
import 'package:oonzoo_assignment/view/home_screen/controller/home_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.index});

  int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<HomeController>(
            builder: (context, value, child) {
              final data = value.itemList[index];
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height * .45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(data.image.toString()),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    kHeight10,
                    const Center(
                      child: Text(
                        'About',
                        style: TextStyle(color: kBlackcolor, fontSize: 25),
                      ),
                    ),
                    kHeight10,
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Text(
                              data.title!,
                              style: const TextStyle(
                                color: kBlackcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            kHeight10,
                            Text(data.description!),
                            kHeight10,
                            Align(
                              alignment: Alignment.topLeft,
                              child: RichText(
                                text: TextSpan(
                                  text: data.rating!.rate.toString(),
                                  style: const TextStyle(color: kBlackcolor),
                                  children: [
                                    WidgetSpan(
                                      child: RatingBar.builder(
                                        initialRating: double.parse(
                                            data.rating!.rate.toString()),
                                        itemSize: 15,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        ignoreGestures: true,
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        onRatingUpdate: (startRating) {
                                          log(startRating.toString());
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            kHeight10,
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '₹${data.price!.round()}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: kRedColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
