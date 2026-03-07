import 'package:flutter/material.dart';
import 'package:sramik_app/core/constants/app_colors.dart';
import '../widgets/profile_textfield.dart';
import 'contractor_location_screen.dart';

class ContractorProfileScreen extends StatefulWidget {
  const ContractorProfileScreen({super.key});

  @override
  State<ContractorProfileScreen> createState() =>
      _ContractorProfileScreenState();
}

class _ContractorProfileScreenState extends State<ContractorProfileScreen> {

  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final whatsappController = TextEditingController();
  final experienceController = TextEditingController();

  String? selectedLanguage;

  final List<String> languages = [
    "English",
    "Hindi",
    "Telugu",
    "Tamil",
    "Kannada"
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          "Contractor Profile",
          style: TextStyle(color: AppColors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: SingleChildScrollView(

          child: Form(
            key: _formKey,

            child: Column(
              children: [

                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.grey,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: AppColors.white,
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.primary,
                        child: const Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 25),

                ProfileTextField(
                  label: "First Name",
                  controller: firstNameController,
                ),

                ProfileTextField(
                  label: "Last Name",
                  controller: lastNameController,
                ),

                ProfileTextField(
                  label: "Email (Optional)",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  requiredField: false,
                ),

                ProfileTextField(
                  label: "WhatsApp Number",
                  controller: whatsappController,
                  keyboardType: TextInputType.phone,
                ),

                DropdownButtonFormField<String>(

                  decoration: InputDecoration(
                    labelText: "Language Known",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  items: languages.map((lang) {
                    return DropdownMenuItem(
                      value: lang,
                      child: Text(lang),
                    );
                  }).toList(),

                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value;
                    });
                  },

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                ProfileTextField(
                  label: "Experience (Years)",
                  controller: experienceController,
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 25),


                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),

                    onPressed: () {


                      if (_formKey.currentState!.validate()) {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ContractorLocationScreen(),
                          ),
                        );

                      }

                    },

                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}