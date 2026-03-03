import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:sramik_app/core/constants/app_colors.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  final String role;
  const LoginScreen({super.key, required this.role});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  String selectedDialCode = "+91";
  bool showError = false;
  String errorText = "";

  void openCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      showSearch: true,
      countryListTheme: const CountryListThemeData(
        flagSize: 0,
      ),
      onSelect: (Country country) {
        setState(() {
          selectedDialCode = "+${country.phoneCode}";
        });
      },
    );
  }

  void validateAndSendOtp() {
    String phone = phoneController.text.trim();
    phone = phone.replaceAll(RegExp(r'\D'), '');

    if (phone.isEmpty) {
      setState(() {
        showError = true;
        errorText = "Phone number is required";
      });
      return;
    }

    if (phone.length != 10) {
      setState(() {
        showError = true;
        errorText = "Enter valid 10-digit number";
      });
      return;
    }

    setState(() {
      showError = false;
      errorText = "";
    });

    String fullNumber = "$selectedDialCode$phone";

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OtpScreen(
          role: widget.role,
          phone: fullNumber,
        ),
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Enter your WhatsApp number to continue",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: showError ? Colors.red : Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: openCountryPicker,
                    child: Row(
                      children: [
                        Text(
                          selectedDialCode,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),
                  const VerticalDivider(),
                  const SizedBox(width: 10),

                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter WhatsApp number",
                        counterText: "",
                      ),
                      onChanged: (value) {
                        if (value.length == 10) {
                          setState(() {
                            showError = false;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),

            if (showError)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  errorText,
                  style: const TextStyle(color: Colors.red, fontSize: 13),
                ),
              ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: validateAndSendOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: const Text("Send OTP"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
