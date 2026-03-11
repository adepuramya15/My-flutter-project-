import 'package:flutter/material.dart';
import 'package:sramik_app/core/constants/app_colors.dart';
import 'package:sramik_app/features/contractor/presentation/screens/worker_details_screen.dart';

class RequestsTab extends StatefulWidget {
  const RequestsTab({super.key});

  @override
  State<RequestsTab> createState() => _RequestsTabState();
}

class _RequestsTabState extends State<RequestsTab> {

  String selectedRequestType = "Contractor";
  String selectedStatus = "Pending";

  int pendingCount = 1;
  int approvedCount = 2;
  int rejectedCount = 3;

  final List<Map<String, dynamic>> contractorRequests = [
    {
      "projectName": "Apartment Construction",
      "skill": "Mason",
      "workers": [
        {
          "name": "Ramesh",
          "experience": "5 Years",
          "skills": "Brick Work"
        },
        {
          "name": "Suresh",
          "experience": "4 Years",
          "skills": "Cement Work"
        },
      ]
    }

  ];

  final List<Map<String, dynamic>> workerRequests = [
    {
      "name": "Ravi Kumar",
      "id": "SRK102",
      "phone": "9876543210",
      "location": "Hyderabad",
      "rating": 4.5
    },
    {
      "name": "Mahesh",
      "id": "SRK245",
      "phone": "9123456789",
      "location": "Bangalore",
      "rating": 4.2
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
          "Requests",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Row(
              children: [

                Expanded(
                  child: _requestTypeButton("Contractor"),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: _requestTypeButton("Worker"),
                ),

              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [

                Expanded(
                  child: _statusButton("Pending", pendingCount),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: _statusButton("Approved", approvedCount),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: _statusButton("Rejected", rejectedCount),
                ),

              ],
            ),

            const SizedBox(height: 20),

            Expanded(
              child: selectedRequestType == "Contractor"
                  ? _buildContractorRequests()
                  : _buildWorkerRequests(),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildContractorRequests() {

    return ListView.builder(
      itemCount: contractorRequests.length,
      itemBuilder: (context, index) {

        final project = contractorRequests[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 15),

          child: Padding(
            padding: const EdgeInsets.all(12),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  project["projectName"],
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 5),

                Text("Required Skill: ${project["skill"]}"),

                const Divider(),

                ...project["workers"].map<Widget>((worker) {

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Name: ${worker["name"]}"),
                      Text("Experience: ${worker["experience"]}"),
                      Text("Skills: ${worker["skills"]}"),

                      const Divider(),

                    ],
                  );

                }).toList()

              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildWorkerRequests() {

    return ListView.builder(
      itemCount: workerRequests.length,
      itemBuilder: (context, index) {

        final worker = workerRequests[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 15),

          child: Padding(
            padding: const EdgeInsets.all(12),

            child: Row(
              children: [

                const CircleAvatar(
                  radius: 28,
                  child: Icon(Icons.person),
                ),

                const SizedBox(width: 12),

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

                      Text("ID: ${worker["id"]}"),
                      Text("WhatsApp: ${worker["phone"]}"),
                      Text("Location: ${worker["location"]}"),

                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.orange, size: 16),
                          const SizedBox(width: 4),
                          Text(worker["rating"].toString())
                        ],
                      ),

                    ],
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkerDetailsScreen(
                          worker: worker,
                          amenity: "Food",
                        ),
                      ),
                    );
                  },

                  child: const Text(
                    "View",
                    style: TextStyle(color: Colors.white),
                  ),
                )

              ],
            ),
          ),
        );
      },
    );
  }

  Widget _requestTypeButton(String type) {

    bool isSelected = selectedRequestType == type;

    return SizedBox(
      height: 40,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          backgroundColor:
          isSelected ? AppColors.primary : Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),

        onPressed: () {
          setState(() {
            selectedRequestType = type;
          });
        },

        child: Text(
          "$type Requests",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _statusButton(String status, int count) {

    bool isSelected = selectedStatus == status;

    return SizedBox(
      height: 70,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          backgroundColor:
          isSelected ? AppColors.primary : Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        onPressed: () {
          setState(() {
            selectedStatus = status;
          });
        },

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              status,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
