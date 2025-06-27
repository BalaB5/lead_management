// app_binding.dart
import 'package:get/get.dart';

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