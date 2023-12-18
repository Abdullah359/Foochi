import 'package:flutter/material.dart';
import '../model/content_model.dart';
import '../model/food_model.dart';

class CustomCard extends StatelessWidget {
  final VoidCallback onTap;
  final FoodModel foodModel;
  const CustomCard({super.key, required this.onTap, required this.foodModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        color: AppColors.kSecondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 455,
          width: 290,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.kSecondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 190,
                      width: 190,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(foodModel.image),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(foodModel.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  Text(
                    foodModel.description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w200),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
