import 'package:flutter/material.dart';
import 'package:sramik_app/core/constants/app_colors.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class CategoryItem {
  final String title;
  final IconData icon;
  final List<String> subCategories;

  CategoryItem({
    required this.title,
    required this.icon,
    required this.subCategories,
  });
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {

  final _formKey = GlobalKey<FormState>();

  String? selectedCategory;
  String? selectedSubCategory;
  String? selectedDurationType;
  String? selectedFacility;
  String? selectedVisibility;

  DateTime? startDate;

  final budgetController = TextEditingController();
  final durationController = TextEditingController();
  final minWageController = TextEditingController();
  final maxWageController = TextEditingController();
  final experienceController = TextEditingController();
  final cityController = TextEditingController();
  final areaController = TextEditingController();
  final workersController = TextEditingController();
  final descriptionController = TextEditingController();

  List<String> subCategoryList = [];

  final List<CategoryItem> categories = [

    CategoryItem(
      title: "Construction",
      icon: Icons.construction,
      subCategories: [
        "Mason / Bricklayer",
        "Carpenter / Woodworker",
        "Plumber",
        "Electrician",
        "Painter",
        "Welder",
        "Steel Fixer",
        "Tile Worker",
      ],
    ),

    CategoryItem(
      title: "Household",
      icon: Icons.home_repair_service,
      subCategories: [
        "Maid",
        "Cook / Chef",
        "Baby Care",
        "Driver",
        "Laundry Worker",
      ],
    ),

    CategoryItem(
      title: "Industrial & Factory",
      icon: Icons.factory,
      subCategories: [
        "Machine Operator",
        "Technician",
        "Quality Inspector",
        "Warehouse Staff",
        "Loader",
      ],
    ),

    CategoryItem(
      title: "Security",
      icon: Icons.security,
      subCategories: [
        "Security Guard",
        "Night Watchman",
        "Building Watchman",
      ],
    ),

    CategoryItem(
      title: "Transportation",
      icon: Icons.local_shipping,
      subCategories: [
        "Delivery Boy",
        "Driver",
        "Helper",
      ],
    ),

    CategoryItem(
      title: "Hotel & Restaurant",
      icon: Icons.restaurant,
      subCategories: [
        "Chef",
        "Waiter",
        "Cleaner",
        "Kitchen Helper",
      ],
    ),

    CategoryItem(
      title: "Electrician & Electrical Work",
      icon: Icons.electrical_services,
      subCategories: [
        "Electrician",
        "Panel Builder",
        "Electronic Technician",
        "Cable Assembler",
        "Line Worker",
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Create Project",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  "Project Details",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  key: const ValueKey("category"),
                  initialValue: selectedCategory,
                  decoration: const InputDecoration(
                    labelText: "Category",
                    border: OutlineInputBorder(),
                  ),
                  items: categories.map((category) {
                    return DropdownMenuItem(
                      value: category.title,
                      child: Text(category.title),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                      selectedSubCategory = null;

                      subCategoryList = categories
                          .firstWhere((cat) => cat.title == value)
                          .subCategories;
                    });
                  },
                  validator: (value) => value == null ? "Select category" : null,
                ),

                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  key: ValueKey(selectedCategory),
                  initialValue: selectedSubCategory,
                  decoration: const InputDecoration(
                    labelText: "Sub Category",
                    border: OutlineInputBorder(),
                  ),
                  items: subCategoryList.map((sub) {
                    return DropdownMenuItem(
                      value: sub,
                      child: Text(sub),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSubCategory = value;
                    });
                  },
                  validator: (value) => value == null ? "Select sub category" : null,
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: budgetController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Total Budget",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                  value!.isEmpty ? "Enter total budget" : null,
                ),

                const SizedBox(height: 15),

                GestureDetector(
                  onTap: () async {

                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    );

                    if (picked != null) {
                      setState(() {
                        startDate = picked;
                      });
                    }

                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: double.infinity,
                    child: Text(
                      startDate == null
                          ? "Select Start Date"
                          : "${startDate!.day}/${startDate!.month}/${startDate!.year}",
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  initialValue: selectedDurationType,
                  decoration: const InputDecoration(
                    labelText: "Duration Type",
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: "Days", child: Text("Days")),
                    DropdownMenuItem(value: "Months", child: Text("Months")),
                    DropdownMenuItem(value: "Years", child: Text("Years")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedDurationType = value;
                    });
                  },
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: durationController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Duration Value",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Wage & Experience",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: minWageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Minimum Daily Wage (Optional)",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: maxWageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Maximum Daily Wage",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                  value!.isEmpty ? "Enter max wage" : null,
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: experienceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Minimum Experience (Years)",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Work Location",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: cityController,
                  decoration: const InputDecoration(
                    labelText: "City",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: areaController,
                  decoration: const InputDecoration(
                    labelText: "Area",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Worker Requirements",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  initialValue: selectedFacility,
                  decoration: const InputDecoration(
                    labelText: "Amenities Provided",
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: "None", child: Text("None")),
                    DropdownMenuItem(value: "Food", child: Text("Food")),
                    DropdownMenuItem(value: "Stay", child: Text("Stay")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedFacility = value;
                    });
                  },
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: workersController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Workers Required",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Additional Information",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  initialValue: selectedVisibility,
                  decoration: const InputDecoration(
                    labelText: "Job Visibility Duration (Optional)",
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: "5 Days", child: Text("5 Days")),
                    DropdownMenuItem(value: "10 Days", child: Text("10 Days")),
                    DropdownMenuItem(value: "15 Days", child: Text("15 Days")),
                    DropdownMenuItem(value: "30 Days", child: Text("30 Days")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedVisibility = value;
                    });
                  },
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: descriptionController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: "Job Description (Optional)",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),

                    onPressed: () {

                      if (_formKey.currentState!.validate()) {

                        Map<String, dynamic> projectData = {

                          "category": selectedCategory,
                          "subCategory": selectedSubCategory,
                          "budget": budgetController.text,
                          "durationType": selectedDurationType,
                          "duration": durationController.text,
                          "minWage": minWageController.text,
                          "maxWage": maxWageController.text,
                          "experience": experienceController.text,
                          "city": cityController.text,
                          "area": areaController.text,
                          "workers": workersController.text,
                          "facility": selectedFacility,
                          "visibility": selectedVisibility,
                          "description": descriptionController.text,
                          "startDate": startDate == null
                              ? ""
                              : "${startDate!.day}/${startDate!.month}/${startDate!.year}",

                        };

                        Navigator.pop(context, projectData);

                      }

                    },

                    child: const Text(
                      "Create Project",
                      style: TextStyle(color: Colors.white, fontSize: 16),
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