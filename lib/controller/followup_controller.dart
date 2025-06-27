// // followup_controller.dart
// import 'package:get/get.dart';

// import '../core/followup_repository.dart';
// import '../core/lead_repository.dart';
// import '../models/followup_model.dart';
// import '../models/lead_model.dart';

// class FollowUpController extends GetxController {
//   final FollowUpRepository _followUpRepository = Get.find();
//   final LeadRepository _leadRepository = Get.find();
  
//   final RxList<FollowUpModel> followUps = <FollowUpModel>[].obs;
//   final RxList<FollowUpModel> todayFollowUps = <FollowUpModel>[].obs;
//   final RxString searchQuery = ''.obs;
//   final RxString selectedStatus = 'All'.obs;

//   @override
//   void onInit() {
//     loadFollowUps();
//     loadTodayFollowUps();
//     super.onInit();
//   }

//   void loadFollowUps() {
//     followUps.value = _followUpRepository.getAllFollowUps();
//   }

//   void loadTodayFollowUps() {
//     todayFollowUps.value = _followUpRepository.getTodayFollowUps();
//   }

//   void searchFollowUps(String query) {
//     searchQuery.value = query;
//     if (query.isEmpty && selectedStatus.value == 'All') {
//       loadFollowUps();
//     } else if (query.isEmpty) {
//       followUps.value = _followUpRepository.filterFollowUpsByStatus(selectedStatus.value);
//     } else if (selectedStatus.value == 'All') {
//       followUps.value = _followUpRepository.searchFollowUps(query);
//     } else {
//       followUps.value = _followUpRepository
//           .filterFollowUpsByStatus(selectedStatus.value)
//           .where((fu) => fu.reason.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//   }

//   void filterByStatus(String status) {
//     selectedStatus.value = status;
//     if (status == 'All') {
//       loadFollowUps();
//     } else {
//       followUps.value = _followUpRepository.filterFollowUpsByStatus(status);
//     }
//   }

//   Future<void> addFollowUp(FollowUpModel followUp) async {
//     await _followUpRepository.addFollowUp(followUp);
//     loadFollowUps();
//     loadTodayFollowUps();
//   }

//   Future<void> updateFollowUp(FollowUpModel followUp) async {
//     await _followUpRepository.updateFollowUp(followUp);
//     loadFollowUps();
//     loadTodayFollowUps();
//   }

//   Future<void> deleteFollowUp(String followUpId) async {
//     await _followUpRepository.deleteFollowUp(followUpId);
//     loadFollowUps();
//     loadTodayFollowUps();
//   }

//   List<LeadModel> searchLeadsForFollowUp(String query) {
//     return _leadRepository.searchLeads(query);
//   }
// }