import 'package:flutter/material.dart';
import 'package:sramik_app/core/constants/app_colors.dart';
import 'package:sramik_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:sramik_app/features/worker/presentation/screens/worker_home_screen.dart';
import 'package:sramik_app/features/contractor/presentation/screens/contractor_home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SramikApp());
}

class SramikApp extends StatelessWidget {
  const SramikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sramik App',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
        scaffoldBackgroundColor: AppColors.background,
      ),
      routes: {
        '/workerHome': (context) => const WorkerHomeScreen(),
        '/contractorHome': (context) => const ContractorHomeScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
