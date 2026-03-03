import 'package:flutter/material.dart';
import 'package:sramik_app/features/worker/data/models/worker_profile.dart';
import 'package:sramik_app/features/worker/data/services/user_session.dart';
import 'package:sramik_app/core/constants/app_colors.dart';

class WorkerProfileDialog extends StatefulWidget {
  final VoidCallback onProfileCompleted;

  const WorkerProfileDialog({
    super.key,
    required this.onProfileCompleted,
  });

  @override
  State<WorkerProfileDialog> createState() => _WorkerProfileDialogState();
}

class _WorkerProfileDialogState extends State<WorkerProfileDialog> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final languageController = TextEditingController();
  final categoryController = TextEditingController();
  final experienceController = TextEditingController();

  bool showErrors = false;

  InputDecoration _inputDecoration(String label, bool hasError) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: AppColors.textPrimary),
      filled: true,
      fillColor: AppColors.background,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: hasError ? Colors.red : AppColors.textPrimary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: hasError ? Colors.red : AppColors.primary,
          width: 2,
        ),
      ),
    );
  }

  void saveProfile(BuildContext dialogContext) {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        languageController.text.isEmpty ||
        categoryController.text.isEmpty ||
        experienceController.text.isEmpty) {

      setState(() {
        showErrors = true;
      });

      ScaffoldMessenger.of(dialogContext).showSnackBar(
        const SnackBar(
          content: Text("Please fill all required fields properly"),
          backgroundColor: Colors.red,
        ),
      );

      return;
    }

    UserSession.currentWorker = WorkerProfile(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      phone: phoneController.text.trim(),
      email: emailController.text.trim().isEmpty
          ? null
          : emailController.text.trim(),
      language: languageController.text.trim(),
      category: categoryController.text.trim(),
      experience: experienceController.text.trim(),
    );

    widget.onProfileCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.75,
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Complete Your Profile",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      color: AppColors.primary,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: firstNameController,
                                decoration: _inputDecoration(
                                  "First Name",
                                  showErrors &&
                                      firstNameController.text.isEmpty,
                                ),
                                onChanged: (_) => setState(() {}),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: lastNameController,
                                decoration: _inputDecoration(
                                  "Last Name",
                                  showErrors &&
                                      lastNameController.text.isEmpty,
                                ),
                                onChanged: (_) => setState(() {}),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        TextField(
                          controller: emailController,
                          decoration:
                          _inputDecoration("Email (Optional)", false),
                        ),

                        const SizedBox(height: 12),

                        TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: _inputDecoration(
                            "Whatsapp Number",
                            showErrors &&
                                phoneController.text.isEmpty,
                          ),
                          onChanged: (_) => setState(() {}),
                        ),

                        const SizedBox(height: 12),

                        TextField(
                          controller: languageController,
                          decoration: _inputDecoration(
                            "Language Known",
                            showErrors &&
                                languageController.text.isEmpty,
                          ),
                          onChanged: (_) => setState(() {}),
                        ),

                        const SizedBox(height: 12),

                        TextField(
                          controller: categoryController,
                          decoration: _inputDecoration(
                            "Category",
                            showErrors &&
                                categoryController.text.isEmpty,
                          ),
                          onChanged: (_) => setState(() {}),
                        ),

                        const SizedBox(height: 12),

                        TextField(
                          controller: experienceController,
                          decoration: _inputDecoration(
                            "Experience",
                            showErrors &&
                                experienceController.text.isEmpty,
                          ),
                          onChanged: (_) => setState(() {}),
                        ),

                        const SizedBox(height: 20),

                        Builder(
                          builder: (dialogContext) {
                            return SizedBox(
                              width: double.infinity,
                              height: 45,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: AppColors.white,
                                ),
                                onPressed: () =>
                                    saveProfile(dialogContext),
                                child: const Text(
                                  "Save Profile",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}