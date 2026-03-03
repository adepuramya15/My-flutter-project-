import 'package:flutter/material.dart';
import 'package:sramik_app/core/constants/app_colors.dart';
import 'package:sramik_app/features/worker/presentation/widgets/worker_profile_dialog.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [

                  Row(
                    children: [

                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.primary,
                                width: 2,
                              ),
                            ),
                            child: const CircleAvatar(
                              radius: 35,
                              backgroundColor: Color(0xFFE3E8FF),
                              child: Icon(
                                Icons.person,
                                size: 35,
                                color: AppColors.primary,
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                _showImageOptions(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Name",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text("Unique ID"),
                            SizedBox(height: 4),
                            Text("Categories"),
                            SizedBox(height: 4),
                            Text("Phone Number"),
                            SizedBox(height: 4),
                            Text("Gender"),
                            SizedBox(height: 4),
                            Text("DOB"),
                            SizedBox(height: 4),
                            Text("Mail ID"),
                            SizedBox(height: 4),
                            Text("Address"),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        _openEditDialog();
                      },
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                _buildStatCard("My Request Jobs"),
                const SizedBox(width: 12),
                _buildStatCard("Total Jobs Applied"),
              ],
            ),

            const SizedBox(height: 20),

            _buildMenuTile("Saved Location"),
            _buildMenuTile("Job Applied"),
            _buildMenuTile("Change Language"),
            _buildMenuTile("Setting"),
            _buildMenuTile("Help & Support"),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Logout",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openEditDialog() {
    showDialog(
      context: context,
      builder: (context) => WorkerProfileDialog(
        onProfileCompleted: () {
          Navigator.pop(context);
        },
      ),
    );
  }
  void _showImageOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const Text(
                "Update Profile Picture",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 20),

              ListTile(
                leading: const Icon(Icons.camera_alt, color: AppColors.primary),
                title: const Text("Take Photo"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(Icons.photo, color: AppColors.primary),
                title: const Text("Choose from Gallery"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              const Divider(),

              ListTile(
                title: const Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }
  Widget _buildStatCard(String title) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const Text(
              "0",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTile(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: AppColors.textPrimary),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}