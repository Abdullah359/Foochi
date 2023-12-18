import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/carousal_indicator.dart';
import '../../components/custom_carousal_card.dart';
import '../../model/content_model.dart';
import '../../model/food_model.dart';
import '../detail_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CarouselController? carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.kBackground,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text("Types of Foods",
                      style: GoogleFonts.poppins(
                          color: AppColors.kSecondary,
                          fontSize: 30,
                          fontWeight: FontWeight.w600))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Select your favoriteDish",
                  style: GoogleFonts.poppins(
                      color: AppColors.kSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: foodList.map((urlOfItem) {
                      int index = foodList.indexOf(urlOfItem);
                      return CustomIndicator(
                        currentIndex: _currentIndex,
                        index: index,
                      );
                    }).toList(),
                  )),
              const SizedBox(height: 50),
              CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                    viewportFraction: 0.73,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    height: 420,
                    onPageChanged: (index, reason) {
                      _currentIndex = index;
                      setState(() {});
                    }),
                items: foodList.map((index) {
                  return CustomCard(
                    onTap: () {
                      Get.to(() => DetailView(foodModel: index));
                    },
                    foodModel: index,
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
