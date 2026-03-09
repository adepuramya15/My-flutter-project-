import 'package:flutter/material.dart';
import 'package:sramik_app/core/constants/app_colors.dart';
import 'worker_list_screen.dart';

class FindWorkersTab extends StatefulWidget {
  const FindWorkersTab({super.key});

  @override
  State<FindWorkersTab> createState() => _FindWorkersScreenState();
}

class _FindWorkersScreenState extends State<FindWorkersTab> {

  final _formKey = GlobalKey<FormState>();

  String? selectedCategory;
  String? selectedSubCategory;
  String? selectedDuration;
  String? selectedAmenity;

  final cityController = TextEditingController();
  final areaController = TextEditingController();
  final workingHoursController = TextEditingController();

  DateTime? selectedDate;

  final Map<String, List<String>> categoryMap = {

    "Construction": [
      "Mason",
      "Carpenter",
      "Plumber",
      "Electrician",
      "Painter",
      "Welder",
      "Steel Fixer",
      "Tile Worker",
    ],

    "Household": [
      "Maid",
      "Cook / Chef",
      "Baby Care",
      "Driver",
      "Laundry Worker"
    ],

    "Industrial": [
      "Machine Operator",
      "Technician",
      "Quality Inspector",
      "Warehouse Staff",
      "Loader",
    ],
    "Security": [
      "Security Guard",
      "Night Watchman",
      "Building Watchman",
    ],
    "Transportation" : [
      "Delivery Boy",
      "Driver",
      "Helper",
    ],
    "Hotel & Restaurant": [
      "Chef",
      "Waiter",
      "Cleaner",
      "Kitchen Helper",
    ],
    "Electrician & Electrical Work" : [
      "Electrician",
      "Panel Builder",
      "Electronic Technician",
      "Cable Assembler",
      "Line Worker",
    ]
  };

  final List<String> durations = [
    "Days",
    "Months",
    "Years"
  ];

  final List<String> amenities = [
    "N/A",
    "Food",
    "Stay"
  ];

  Future<void> _selectDate() async {

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.background,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        title: const Text(
          "Find Workers",
          style: TextStyle(color: AppColors.white),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: SingleChildScrollView(

          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,

            child: Column(
              children: [

                DropdownButtonFormField<String>(

                  initialValue: selectedCategory,

                  decoration: InputDecoration(
                    labelText: "Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  items: categoryMap.keys.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),

                  onChanged: (value) {

                    setState(() {
                      selectedCategory = value;
                      selectedSubCategory = null;
                    });

                  },

                  validator: (value) {
                    if (value == null) {
                      return "Required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                DropdownButtonFormField<String>(

                  initialValue: selectedSubCategory,

                  decoration: InputDecoration(
                    labelText: "Sub Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  items: selectedCategory == null
                      ? []
                      : categoryMap[selectedCategory]!
                      .map((sub) {
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

                  validator: (value) {
                    if (value == null) {
                      return "Required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                TextFormField(

                  readOnly: true,

                  decoration: InputDecoration(
                    labelText: "Start Date",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),

                  controller: TextEditingController(
                    text: selectedDate == null
                        ? ""
                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                  ),

                  onTap: _selectDate,

                  validator: (value) {
                    if (selectedDate == null) {
                      return "Required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),
                DropdownButtonFormField<String>(

                  initialValue: selectedDuration,

                  decoration: InputDecoration(
                    labelText: "Duration",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  items: durations.map((d) {
                    return DropdownMenuItem(
                      value: d,
                      child: Text(d),
                    );
                  }).toList(),

                  onChanged: (value) {
                    setState(() {
                      selectedDuration = value;
                    });
                  },

                  validator: (value) {
                    if (value == null) {
                      return "Required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                TextFormField(

                  controller: cityController,

                  decoration: InputDecoration(
                    labelText: "City",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                TextFormField(

                  controller: areaController,

                  decoration: InputDecoration(
                    labelText: "Area",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                DropdownButtonFormField<String>(

                  initialValue: selectedAmenity,

                  decoration: InputDecoration(
                    labelText: "Amenities",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  items: amenities.map((a) {
                    return DropdownMenuItem(
                      value: a,
                      child: Text(a),
                    );
                  }).toList(),

                  onChanged: (value) {
                    setState(() {
                      selectedAmenity = value;
                    });
                  },
                ),

                const SizedBox(height: 15),

                TextFormField(

                  controller: workingHoursController,

                  decoration: InputDecoration(
                    labelText: "Working Hours (Optional)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
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
                            builder: (_) => const WorkerListScreen(),
                          ),
                        );

                      }

                    },

                    child: const Text(
                      "Search Workers",
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