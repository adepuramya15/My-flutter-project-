import 'package:flutter/material.dart';
import 'package:sramik_app/core/constants/app_colors.dart';

class CompletedProjectsScreen extends StatelessWidget {
  const CompletedProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Completed Projects",
          style: TextStyle(color: AppColors.white),
        ),
      ),

      body: const Center(
        child: Text(
          "List of Completed Projects",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

    );
  }
}