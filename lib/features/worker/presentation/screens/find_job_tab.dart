import 'package:flutter/material.dart';
import 'package:sramik_app/core/constants/app_colors.dart';


class FindJobTab extends StatefulWidget {
  const FindJobTab({super.key});

  @override
  State<FindJobTab> createState() => _FindJobTabState();
}

class _FindJobTabState extends State<FindJobTab> {

  final List<String> categories = [
    "Construction",
    "Household",
    "Industrial & Factory Workers",
    "Security & Protection",
    "Transportation & Delivery",
    "Hotel & Restaurant Staff",
    "Stone & Marble Work",
    "Electrician & Electrical Work",
  ];

  final Map<String, List<String>> subCategories = {
    "Construction": [
      "Mason / Bricklayer",
      "Carpenter / Woodworker",
      "Plumber",
      "Electrician",
      "Painter",
      "Welder",
      "Steel Fixer",
      "Tile",
    ],
    "Household": [
      "Maid",
      "Cook / Chef",
      "Baby / Child Care",
      "Driver",
      "Laundry",
    ],
    "Industrial & Factory Workers": [
      "Machine Operator",
      "Technician",
      "Quality Inspector",
      "Warehouse / Packing Staff",
      "Loader",
      "Forklift Operator",
    ],
    "Security & Protection": [
      "Security Guard",
      "Night Watchman",
      "Building Watchmen",
      "Bank Security",
      "Personal Security",
    ],
    "Transportation & Delivery": [
      "Delivery Boy",
      "Driver",
      "Helper",
    ],
    "Hotel & Restaurant Staff": [
      "Chef / Cook",
      "Waiter / Server",
      "Housekeeping",
      "Cleaner",
      "Security",
      "Driver",
    ],
    "Stone & Marble Work": [
      "Stone Mistry",
      "Stone Helper",
      "Marble Mistry",
      "Marble Helper",
      "Marble Half Mason",
    ],
    "Electrician & Electrical Work": [
      "Electrician",
      "Panel Builder",
      "Electronic Technician",
      "Cable Assembler",
      "Line Worker",
    ],
  };

  String? selectedCategory;
  String? selectedSubCategory;
  String? durationType;

  DateTime? startDate;

  final cityController = TextEditingController();
  final areaController = TextEditingController();
  final hoursController = TextEditingController();

  bool food = false;
  bool stay = false;
  bool na = false;

  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        startDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Category"),
              initialValue: selectedCategory,
              items: categories.map((cat) {
                return DropdownMenuItem(
                  value: cat,
                  child: Text(cat),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                  selectedSubCategory = null;
                });
              },
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Sub Category"),
              initialValue: selectedSubCategory,
              items: selectedCategory == null
                  ? []
                  : subCategories[selectedCategory]!
                  .map((sub) => DropdownMenuItem(
                value: sub,
                child: Text(sub),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedSubCategory = value;
                });
              },
            ),

            const SizedBox(height: 16),

            GestureDetector(
              onTap: pickDate,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                width: double.infinity,
                child: Text(
                  startDate == null
                      ? "Select Start Date"
                      : startDate.toString().split(" ")[0],
                ),
              ),
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Duration"),
              initialValue: durationType,
              items: ["Days", "Months", "Years"]
                  .map((d) => DropdownMenuItem(
                value: d,
                child: Text(d),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  durationType = value;
                });
              },
            ),

            const SizedBox(height: 16),
            TextField(
              controller: cityController,
              decoration: const InputDecoration(labelText: "City"),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: areaController,
              decoration: const InputDecoration(labelText: "Area"),
            ),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Amenities",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            Row(
              children: [
                Checkbox(
                  value: na,
                  onChanged: (val) {
                    setState(() {
                      na = val!;
                    });
                  },
                ),
                const Text("N/A"),

                Checkbox(
                  value: food,
                  onChanged: (val) {
                    setState(() {
                      food = val!;
                    });
                  },
                ),
                const Text("Food"),

                Checkbox(
                  value: stay,
                  onChanged: (val) {
                    setState(() {
                      stay = val!;
                    });
                  },
                ),
                const Text("Stay"),
              ],
            ),

            const SizedBox(height: 16),

            TextField(
              controller: hoursController,
              keyboardType: TextInputType.number,
              decoration:
              const InputDecoration(labelText: "Working Hours"),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Job Request Submitted"),
                    ),
                  );
                },
                child: const Text(
                  "Submit Request",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}