import 'package:flutter/material.dart';
import 'package:sramik_app/core/constants/app_colors.dart';
import 'package:sramik_app/features/worker/presentation/widgets/worker_profile_dialog.dart';
import 'worker_account_screen.dart';
import 'package:sramik_app/features/worker/presentation/screens/find_job_tab.dart';

class WorkerHomeScreen extends StatefulWidget {
  const WorkerHomeScreen({super.key});

  @override
  State<WorkerHomeScreen> createState() => _WorkerHomeScreenState();
}

class _WorkerHomeScreenState extends State<WorkerHomeScreen> {
  int _currentIndex = 0;
  bool _isProfileCompleted = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isProfileCompleted) {
        _showProfileDialog();
      }
    });
  }

  void _showProfileDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WorkerProfileDialog(
        onProfileCompleted: () {
          setState(() {
            _isProfileCompleted = true;
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  String _getTitle() {
    switch (_currentIndex) {
      case 0:
        return "Home";
      case 1:
        return "Find a Job";
      case 2:
        return "Applied Jobs";
      case 3:
        return "My Request Jobs";
      case 4:
        return "Account";
      default:
        return "";
    }
  }

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
        "Tile",
      ],
    ),
    CategoryItem(
      title: "Household",
      icon: Icons.home_repair_service,
      subCategories: [
        "Maid",
        "Cook / Chef",
        "Baby / Child Care",
        "Driver",
        "Laundry",
      ],
    ),
    CategoryItem(
      title: "Industrial & Factory Workers",
      icon: Icons.factory,
      subCategories: [
        "Machine Operator",
        "Technician",
        "Quality Inspector",
        "Warehouse / Packing Staff",
        "Loader",
        "Forklift Operator",
      ],
    ),
    CategoryItem(
      title: "Security & Protection",
      icon: Icons.security,
      subCategories: [
        "Security Guard",
        "Night Watchman",
        "Building Watchmen",
        "Bank Security",
        "Personal Security",
      ],
    ),
    CategoryItem(
      title: "Transportation & Delivery",
      icon: Icons.local_shipping,
      subCategories: [
        "Delivery Boy",
        "Driver",
        "Helper",
      ],
    ),
    CategoryItem(
      title: "Hotel & Restaurant Staff",
      icon: Icons.restaurant,
      subCategories: [
        "Chef / Cook",
        "Waiter / Server",
        "Housekeeping",
        "Cleaner",
        "Security",
        "Driver",
      ],
    ),
    CategoryItem(
      title: "Stone & Marble Work",
      icon: Icons.architecture,
      subCategories: [
        "Stone Mistry",
        "Stone Helper",
        "Marble Mistry",
        "Marble Helper",
        "Marble Half Mason",
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


  Widget _buildHomeScreen() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Categories",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                return _CategoryCard(category: categories[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      _buildHomeScreen(),
      const FindJobTab(),
      const Center(child: Text("Applied Jobs")),
      const Center(child: Text("My Request Jobs")),
      const AccountScreen(),
    ];
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          _getTitle(),
          style: const TextStyle(color: AppColors.white),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textPrimary,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Find a Job"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Applied"),
          BottomNavigationBarItem(icon: Icon(Icons.request_page), label: "My Request Jobs"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
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

class _CategoryCard extends StatelessWidget {
  final CategoryItem category;

  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SubCategoryScreen(category: category),
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
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(category.icon, size: 40, color: AppColors.primary),
            const SizedBox(height: 12),
            Text(
              category.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
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
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              disabledBackgroundColor: AppColors.primary,
              disabledForegroundColor: AppColors.white,
            ),
            onPressed: selectedSubCategory == null
                ? null
                : () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      "Selected: $selectedSubCategory"),
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

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: widget.category.subCategories.map((subCategory) {
            final isSelected = selectedSubCategory == subCategory;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedSubCategory = subCategory;
                });
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(
                    vertical: 14, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.white, // Always white background
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
                    ),
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
          }).toList(),
        ),
      ),
    );
  }
}