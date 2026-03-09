import 'package:flutter/material.dart';
import 'package:sramik_app/core/constants/app_colors.dart';
import 'package:sramik_app/core/widgets/invite_success_popup.dart';

class WorkerDetailsScreen extends StatelessWidget {

  final Map<String, dynamic> worker;
  final String amenity;

  const WorkerDetailsScreen({
    super.key,
    required this.worker,
    required this.amenity,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          "Worker Details",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 6,
                  )
                ],
              ),

              child: Row(
                children: [

                  const CircleAvatar(
                    radius: 35,
                    child: Icon(Icons.person, size: 35),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          worker["name"],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text("ID: ${worker["id"]}"),

                        const SizedBox(height: 6),

                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.orange, size: 18),
                            const SizedBox(width: 4),
                            Text(worker["rating"].toString()),
                          ],
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Worker Information",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 12),

            _infoTile(Icons.location_on, "Location", worker["location"]),
            _infoTile(Icons.phone, "WhatsApp", "+91 9876543210"),
            _infoTile(Icons.currency_rupee, "Expected Payout", "₹800 / day"),
            _infoTile(Icons.access_time, "Working Hours", "8 hours / day"),

            const SizedBox(height: 20),

            const Text(
              "Amenity Provided",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 10),

            Chip(
              label: Text(
                amenity,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 25),


            SizedBox(
              width: double.infinity,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),

                onPressed: () {

                  showInviteSuccess(context, worker["name"]);
                },

                child: const Text(
                  "Invite",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Contractor Feedback",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 12),

            _feedbackCard(
              contractor: "Ramesh Contractor",
              feedback:
              "Very hardworking worker. Completed work on time.",
            ),

            _feedbackCard(
              contractor: "Suresh Contractor",
              feedback:
              "Good experience working with this worker.",
            ),

          ],
        ),
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String value) {

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [

          Icon(icon, color: AppColors.primary),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),

              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

            ],
          )

        ],
      ),
    );
  }

  Widget _feedbackCard({
    required String contractor,
    required String feedback,
  }) {

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            contractor,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(feedback),

        ],
      ),
    );
  }
}