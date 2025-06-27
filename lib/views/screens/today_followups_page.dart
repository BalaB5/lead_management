// // today_followups_page.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../controller/followup_controller.dart';
// import '../../core/app_theme.dart';
// import '../widgets/app_text_field.dart';
// import '../widgets/empty_state.dart';
// import '../widgets/followup_card.dart';
// import '../widgets/followup_detail_page.dart';

// class TodayFollowUpsPage extends GetView<FollowUpController> {
//   const TodayFollowUpsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Today's Followups", style: AppTextStyles.heading),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 AppTextField(
//                   hintText: 'Search followups...',
//                   prefixIcon: Icons.search,
//                   onChanged: controller.searchFollowUps,
//                 ),
//                 const SizedBox(height: 12),
//                 Obx(() => DropdownButtonFormField<String>(
//                   value: controller.selectedStatus.value,
//                   items: ['All', 'Scheduled', 'Completed', 'Cancelled', 'Postponed'].map((status) {
//                     return DropdownMenuItem<String>(
//                       value: status,
//                       child: Text(status),
//                     );
//                   }).toList(),
//                   onChanged: (value) => controller.filterByStatus(value!),
//                   decoration: InputDecoration(
//                     labelText: 'Filter by status',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 )),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Obx(() {
//               if (controller.todayFollowUps.isEmpty) {
//                 return EmptyState(
//                   icon: Icons.calendar_today,
//                   title: 'No Followups Today',
//                   subtitle: 'All caught up! No followups scheduled for today',
//                 );
//               }
//               return RefreshIndicator(
//                 onRefresh: () async => controller.loadTodayFollowUps(),
//                 child: ListView.builder(
//                   padding: const EdgeInsets.only(bottom: 16),
//                   itemCount: controller.todayFollowUps.length,
//                   itemBuilder: (context, index) {
//                     final followUp = controller.todayFollowUps[index];
//                     return FollowUpCard(
//                       followUp: followUp,
//                       onTap: () => Get.to(() => FollowUpDetailPage(followUp: followUp)),
//                     );
//                   },
//                 ),
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }