// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/app_binding.dart';
import 'core/app_pages.dart';
import 'core/app_theme.dart';
import 'models/followup_model.dart';
import 'models/lead_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await Hive.initFlutter();
  
  // Register Hive adapters
  Hive.registerAdapter(LeadModelAdapter());
  Hive.registerAdapter(FollowUpModelAdapter());
  
  // Open Hive boxes
  await Hive.openBox<LeadModel>('leads');
  await Hive.openBox<FollowUpModel>('followups');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lead Management',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LEADS,
       initialBinding: AppBinding(),
      getPages: AppPages.pages,
    );
  }
}