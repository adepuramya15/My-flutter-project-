import 'package:flutter/material.dart';
import 'package:sramik_app/core/constants/app_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> categories = [
      "Construction",
      "Household",
      "Industrial",
      "Electrical",
      "Plumbing",
      "Carpenter",
      "Painter"
    ];

    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          "All Categories",
          style: TextStyle(color: AppColors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: GridView.builder(

          itemCount: categories.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),

          itemBuilder: (context,index){

            return Container(

              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),

              child: Center(
                child: Text(
                  categories[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
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