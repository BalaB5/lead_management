// app_binding.dart
import 'package:get/get.dart';
import 'package:lead_management/app/data/repositories/followup_repository.dart';
import 'package:lead_management/app/data/repositories/lead_repository.dart';
import 'package:lead_management/app/presentation/followups/controllers/followup_controller.dart';
import 'package:lead_management/app/presentation/leads/controllers/lead_controller.dart';

import '../controller/followup_controller.dart';
import '../controller/lead_controller.dart';
import 'followup_repository.dart';
import 'lead_repository.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    // Register repositories
    Get.lazyPut(() => LeadRepository(), fenix: true);
    Get.lazyPut(() => FollowUpRepository(), fenix: true);
    
    // Register controllers
    Get.lazyPut(() => LeadController(), fenix: true);
    Get.lazyPut(() => FollowUpController(), fenix: true);
  }
}