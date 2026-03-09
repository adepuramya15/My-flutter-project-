import 'package:flutter/material.dart';
import 'package:sramik_app/core/constants/app_colors.dart';
import 'worker_details_screen.dart';
import 'package:sramik_app/core/widgets/invite_success_popup.dart';

class WorkerListScreen extends StatelessWidget {
  const WorkerListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> workers = [
      {
        "name": "Ravi Kumar",
        "id": "ID123",
        "location": "Hyderabad",
        "rating": 4.5
      },
      {
        "name": "Suresh",
        "id": "ID456",
        "location": "Bangalore",
        "rating": 4.2
      },
      {
        "name": "Mahesh",
        "id": "ID789",
        "location": "Chennai",
        "rating": 4.8
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          "List of Workers",
          style: TextStyle(color: AppColors.white),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: workers.length,
        itemBuilder: (context, index) {

          final worker = workers[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 6,
                )
              ],
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const CircleAvatar(
                  radius: 28,
                  child: Icon(Icons.person),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        worker["name"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text("ID: ${worker["id"]}"),

                      const SizedBox(height: 4),

                      Text("Location: ${worker["location"]}"),

                      const SizedBox(height: 4),

                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.orange, size: 18),
                          const SizedBox(width: 4),
                          Text(worker["rating"].toString()),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [

                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => WorkerDetailsScreen(
                                      worker: worker,
                                      amenity: "Food",
                                    ),
                                  ),
                                );

                              },
                              child: const Text("View Details"),
                            ),
                          ),
                          const SizedBox(width: 10),

                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                showInviteSuccess(context, worker["name"]);
                              },
                              child: const Text("Invite"),
                            ),
                          ),

                        ],
                      )

                    ],
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}