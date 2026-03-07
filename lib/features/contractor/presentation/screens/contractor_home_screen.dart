import 'package:flutter/material.dart';
import 'package:sramik_app/core/constants/app_colors.dart';
import 'worker_list_screen.dart';

class ContractorHomeScreen extends StatefulWidget {
  const ContractorHomeScreen({super.key});

  @override
  State<ContractorHomeScreen> createState() => _ContractorHomeScreenState();
}

class _ContractorHomeScreenState extends State<ContractorHomeScreen> {

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
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          "Categories",
          style: TextStyle(color: AppColors.white),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: GridView.builder(

          itemCount: categories.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),

          itemBuilder: (context, index) {

            return CategoryCard(
              category: categories[index],
            );

          },
        ),
      ),
    );
  }
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

class CategoryCard extends StatelessWidget {

  final CategoryItem category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const WorkerListScreen(),
          ),
        );

      },

      child: Container(

        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 6,
            )
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              category.icon,
              size: 40,
              color: AppColors.primary,
            ),

            const SizedBox(height: 10),

            Text(
              category.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            )

          ],
        ),
      ),
    );
  }
}

class SubCategoryScreen extends StatefulWidget {

  final CategoryItem category;

  const SubCategoryScreen({super.key, required this.category});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {

  String? selectedSubCategory;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          widget.category.title,
          style: const TextStyle(color: AppColors.white),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),

        child: SizedBox(
          height: 45,
          width: double.infinity,

          child: ElevatedButton(

            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
            ),

            onPressed: selectedSubCategory == null
                ? null
                : () {

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Selected: $selectedSubCategory"),
                ),
              );

            },

            child: const Text(
              "Continue",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),

      body: ListView.builder(

        padding: const EdgeInsets.all(16),

        itemCount: widget.category.subCategories.length,

        itemBuilder: (context, index) {

          final subCategory = widget.category.subCategories[index];
          final isSelected = selectedSubCategory == subCategory;

          return GestureDetector(

            onTap: () {

              setState(() {
                selectedSubCategory = subCategory;
              });

            },

            child: Container(

              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 16,
              ),

              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),

                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : Colors.grey.shade300,
                  width: 1.5,
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 6,
                  )
                ],
              ),

              child: Text(
                subCategory,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? AppColors.primary
                      : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}