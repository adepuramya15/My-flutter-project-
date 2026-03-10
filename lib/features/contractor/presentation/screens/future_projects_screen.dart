import 'package:flutter/material.dart';
import 'package:sramik_app/core/constants/app_colors.dart';

class FutureProjectsScreen extends StatelessWidget {
  const FutureProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Future Projects",
          style: TextStyle(color: AppColors.white),
        ),
      ),

      body: const Center(
        child: Text(
          "List of Future Projects",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

    );
  }
}