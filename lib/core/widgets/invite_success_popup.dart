import 'package:flutter/material.dart';

void showInviteSuccess(BuildContext context, String workerName) {

  ScaffoldMessenger.of(context).showSnackBar(

    SnackBar(
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),

      content: Row(
        children: [

          const Icon(Icons.check_circle, color: Colors.white),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              "Invitation successfully sent to $workerName",
              style: const TextStyle(color: Colors.white),
            ),
          ),

          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: const Icon(Icons.close, color: Colors.white),
          )

        ],
      ),
    ),

  );
}