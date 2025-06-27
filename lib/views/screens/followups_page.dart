// followups_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/followup_controller.dart';
import '../../core/app_theme.dart';
import '../../models/followup_model.dart';
import '../widgets/app_text_field.dart';
import '../widgets/empty_state.dart';
import '../widgets/followup_card.dart';
import '../widgets/followup_detail_page.dart';

class FollowUpsPage extends GetView<FollowUpController> {
  const FollowUpsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Followups', style: AppTextStyles.heading),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppTextField(
              hintText: 'Search followups...',
              prefixIcon: Icons.search,
              onChanged: controller.searchFollowUps,
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.followUps.isEmpty) {
                return EmptyState(
                  icon: Icons.calendar_today,
                  title: 'No Followups',
                  subtitle: 'Add your first followup to get started',
                );
              }
              
              // Group followups by date
              final Map<DateTime, List<FollowUpModel>> groupedFollowUps = {};
              for (var followUp in controller.followUps) {
                final date = DateTime(
                  followUp.followUpDate.year,
                  followUp.followUpDate.month,
                  followUp.followUpDate.day,
                );
                
                if (groupedFollowUps.containsKey(date)) {
                  groupedFollowUps[date]!.add(followUp);
                } else {
                  groupedFollowUps[date] = [followUp];
                }
              }
              
              // Sort dates
              final sortedDates = groupedFollowUps.keys.toList()
                ..sort((a, b) => b.compareTo(a));
              
              return RefreshIndicator(
                onRefresh: () async => controller.loadFollowUps(),
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 16),
                  itemCount: sortedDates.length,
                  itemBuilder: (context, index) {
                    final date = sortedDates[index];
                    final followUps = groupedFollowUps[date]!;
                    
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                          child: Text(
                            '${date.day}/${date.month}/${date.year}',
                            style: AppTextStyles.subtitle.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ...followUps.map((FollowUpModel followUp    ) => FollowUpCard(
                          followUp: followUp,
                          onTap: () => Get.to(() => FollowUpDetailPage(followUp: followUp)),
                        )),
                      ],
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}