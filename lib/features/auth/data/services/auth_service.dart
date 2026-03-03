// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AuthService {
//   static const String baseUrl = "http://10.0.2.2:5000/api";
//
//   // SEND OTP
//   static Future<bool> sendOtp(String whatsappNumber, String role) async {
//     try {
//       final response = await http.post(
//         Uri.parse("$baseUrl/auth/send-otp"),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           "whatsappNumber": whatsappNumber,
//           "role": role,
//         }),
//       );
//
//       // return response.statusCode == 200;
//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         print("Error: ${response.body}");
//         return false;
//       }
//     } catch (e){
//       print("Exception: $e");
//       return false;
//     }
//   }
//
//   // VERIFY OTP
//   static Future<bool> verifyOtp(String whatsappNumber, String otp) async {
//     final response = await http.post(
//       Uri.parse("$baseUrl/auth/verify-otp"),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({
//         "whatsappNumber": whatsappNumber,
//         "otp": otp,
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//
//       // Save token if backend returns it
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString("accessToken", data["accessToken"]);
//       await prefs.setString("refreshToken", data["refreshToken"]);
//
//       return true;
//     } else {
//       print("Verify OTP Error: ${response.body}");
//       return false;
//     }
//   }
// }
