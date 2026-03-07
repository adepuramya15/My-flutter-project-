import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sramik_app/core/constants/app_colors.dart';

class ProfileTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool requiredField;

  const ProfileTextField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.requiredField = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),

      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: keyboardType == TextInputType.number
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,

        autovalidateMode: AutovalidateMode.onUserInteraction,

        validator: (value) {
          if (requiredField && (value == null || value.trim().isEmpty)) {
            return "Required";
          }
          return null;
        },

        decoration: InputDecoration(
          labelText: label,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}