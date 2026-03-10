import 'package:flutter/material.dart';
import 'package:sramik_app/core/constants/app_colors.dart';
import 'completed_projects_screen.dart';
import 'future_projects_screen.dart';
import 'create_project_screen.dart';

class ProjectsTab extends StatefulWidget {
  const ProjectsTab({super.key});

  @override
  State<ProjectsTab> createState() =>
      _ContractorProjectsScreenState();
}

class _ContractorProjectsScreenState extends State<ProjectsTab> {

  String selectedFilter = "Current";

  final List<Map<String, String>> projects = [
    {
      "category": "Construction",
      "subcategory": "Mason",
      "location": "Hyderabad",
      "business": "Raju Constructions",
      "posted": "10/03/2026",
      "start": "15/03/2026",
      "end": "20/03/2026",
      "days": "5",
      "hiring": "1",
      "payout": "₹900"
    }
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
        title: const Text(
          "Projects",
          style: TextStyle(color: AppColors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const Text(
              "List of Projects Posted by Contractor",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(child: _filterButton("Previous")),
                const SizedBox(width: 8),
                Expanded(child: _filterButton("Current")),
                const SizedBox(width: 8),
                Expanded(child: _filterButton("Future")),
              ],
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateProjectScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Create Project",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {

                  final project = projects[index];

                  return _projectCard(project);

                },
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _filterButton(String title) {

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),

      onPressed: () {

        if (title == "Previous") {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CompletedProjectsScreen(),
            ),
          );

        } else if (title == "Future") {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FutureProjectsScreen(),
            ),
          );

        }

      },

      child: Text(title),
    );
  }

  Widget _projectCard(Map<String, String> project) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          _infoRow("Category", project["category"]),
          _infoRow("Subcategory", project["subcategory"]),
          _infoRow("Location", project["location"]),
          _infoRow("Business", project["business"]),
          _infoRow("Posted On", project["posted"]),

          const SizedBox(height: 6),

          _infoRow(
            "Duration",
            "${project["start"]}  →  ${project["end"]}",
          ),

          _infoRow("No. of Days", project["days"]),
          _infoRow("Total Hiring", project["hiring"]),

          const SizedBox(height: 6),

          _infoRow(
            "Expected Payout / Day",
            project["payout"],
            valueBold: true,
          ),

          const SizedBox(height: 12),

          Align(
            alignment: Alignment.centerRight,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              onPressed: () {},
              child: const Text(
                "View Details",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
Widget _infoRow(String label, String? value, {bool valueBold = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),

    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(
          width: 130,
          child: Text(
            "$label :",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        Expanded(
          child: Text(
            value ?? "",
            style: TextStyle(
              fontWeight: valueBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),

      ],
    ),
  );
}