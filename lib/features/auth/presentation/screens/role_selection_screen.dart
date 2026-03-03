import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:sramik_app/core/constants/app_colors.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Choose Your Role",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Select how you want to continue",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 50),

              _roleCard(
                context,
                title: "Worker",
                subtitle: "Find jobs near you",
                role: "WORKER",
                icon: Icons.engineering,
              ),

              const SizedBox(height: 20),

              _roleCard(
                context,
                title: "Contractor",
                subtitle: "Hire skilled workers",
                role: "CONTRACTOR",
                icon: Icons.business_center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roleCard(
      BuildContext context, {
        required String title,
        required String subtitle,
        required String role,
        required IconData icon,
      }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LoginScreen(role: role),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon, size: 32, color: AppColors.primary),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
