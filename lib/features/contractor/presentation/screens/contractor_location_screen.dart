import 'package:flutter/material.dart';
import 'package:sramik_app/core/constants/app_colors.dart';
import '../widgets/profile_textfield.dart';
import 'contractor_home_screen.dart';

class ContractorLocationScreen extends StatefulWidget {
  const ContractorLocationScreen({super.key});

  @override
  State<ContractorLocationScreen> createState() =>
      _ContractorLocationScreenState();
}

class _ContractorLocationScreenState extends State<ContractorLocationScreen> {

  final _formKey = GlobalKey<FormState>();

  final houseBuildingController = TextEditingController();
  final streetAreaController = TextEditingController();
  final landmarkController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final pincodeController = TextEditingController();
  final countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.primary,

        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),

        title: const Text(
          "Location Details",
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


                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: const Center(
                    child: Text(
                      "Google Map Location",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                ProfileTextField(
                  label: "House / Building Name",
                  controller: houseBuildingController,
                ),

                ProfileTextField(
                  label: "Street / Area",
                  controller: streetAreaController,
                ),

                ProfileTextField(
                  label: "Landmark",
                  controller: landmarkController,
                ),

                ProfileTextField(
                  label: "City",
                  controller: cityController,
                ),

                ProfileTextField(
                  label: "State",
                  controller: stateController,
                ),

                ProfileTextField(
                  label: "Pincode",
                  controller: pincodeController,
                  keyboardType: TextInputType.number,
                ),

                ProfileTextField(
                  label: "Country",
                  controller: countryController,
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

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Address Saved"),
                          ),
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ContractorHomeScreen(),
                          ),
                        );

                      }

                    },

                    child: const Text(
                      "Save Address",
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


  @override
  void dispose() {
    houseBuildingController.dispose();
    streetAreaController.dispose();
    landmarkController.dispose();
    cityController.dispose();
    stateController.dispose();
    pincodeController.dispose();
    countryController.dispose();
    super.dispose();
  }
}