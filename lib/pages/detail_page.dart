import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/content_model.dart';
import '../model/food_model.dart';

class DetailView extends StatelessWidget {
  final FoodModel foodModel;
  const DetailView({
    Key? key,
    required this.foodModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.kSecondary,
        ),
        child: SafeArea(
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Positioned(
              top: 20,
              right: -40,
              left: -10,
              child: Image.asset(
                foodModel.image,
                height: 400,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, bottom: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade100.withOpacity(0.1)),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Spicy",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w100)),
                          const SizedBox(height: 5),
                          Text(foodModel.title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          Text(foodModel.description,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300)),
                          const SizedBox(height: 10),
                          const Text('\$180',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(height: 50),
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                              Get.defaultDialog(
                                  title: 'Cart', middleText: 'Added to Cart');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.kSecondary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                fixedSize: const Size(double.maxFinite, 44)),
                            child: const Text(
                              "ADD TO CART",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
