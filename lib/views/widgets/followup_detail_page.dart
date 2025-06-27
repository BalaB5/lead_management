// lib/presentation/followups/views/followup_detail_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_theme.dart';
import '../../core/lead_repository.dart';
import '../../models/followup_model.dart';
import '../../models/lead_model.dart';

class FollowUpDetailPage extends StatelessWidget {
  final FollowUpModel followUp;
  final LeadModel? lead;

  const FollowUpDetailPage({
    super.key,
    required this.followUp,
    this.lead,
  });

  @override
  Widget build(BuildContext context) {
    final lead = this.lead ?? Get.find<LeadRepository>().getLeadById(followUp.leadId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Follow Up Details', style: AppTextStyles.heading),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (lead != null) ...[
              Text('Lead Information', style: AppTextStyles.subtitle),
              const SizedBox(height: 8),
              ListTile(
                title: Text(lead.name),
                subtitle: Text(lead.phone),
              ),
              const Divider(),
            ],
            Text('Follow Up Details', style: AppTextStyles.subtitle),
            const SizedBox(height: 8),
            _buildDetailItem('Reason', followUp.reason),
            _buildDetailItem('Status', followUp.status),
            _buildDetailItem('Date', 
                '${followUp.followUpDate.day}/${followUp.followUpDate.month}/${followUp.followUpDate.year}'),
            _buildDetailItem('Time', 
                '${followUp.followUpDate.hour}:${followUp.followUpDate.minute.toString().padLeft(2, '0')}'),
            if (followUp.notes.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text('Notes', style: AppTextStyles.subtitle),
              const SizedBox(height: 8),
              Text(followUp.notes),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}