// // followup_repository.dart
// import 'package:hive/hive.dart';

// import '../models/followup_model.dart';

// class FollowUpRepository {
//   final Box<FollowUpModel> _followUpBox = Hive.box<FollowUpModel>('followups');

//   Future<void> addFollowUp(FollowUpModel followUp) async {
//     await _followUpBox.put(followUp.id, followUp);
//   }

//   Future<void> updateFollowUp(FollowUpModel followUp) async {
//     await _followUpBox.put(followUp.id, followUp);
//   }

//   Future<void> deleteFollowUp(String followUpId) async {
//     await _followUpBox.delete(followUpId);
//   }

//   List<FollowUpModel> getAllFollowUps() {
//     return _followUpBox.values.toList();
//   }

//   List<FollowUpModel> getFollowUpsByLeadId(String leadId) {
//     return _followUpBox.values
//         .where((followUp) => followUp.leadId == leadId)
//         .toList();
//   }

//   List<FollowUpModel> getTodayFollowUps() {
//     final today = DateTime.now();
//     return _followUpBox.values
//         .where((followUp) => 
//             followUp.followUpDate.year == today.year &&
//             followUp.followUpDate.month == today.month &&
//             followUp.followUpDate.day == today.day)
//         .toList();
//   }

//   List<FollowUpModel> searchFollowUps(String query, {String? leadId}) {
//     return _followUpBox.values
//         .where((followUp) => 
//             (leadId == null || followUp.leadId == leadId) &&
//             followUp.reason.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }

//   List<FollowUpModel> filterFollowUpsByStatus(String status) {
//     return _followUpBox.values
//         .where((followUp) => followUp.status == status)
//         .toList();
//   }
// }