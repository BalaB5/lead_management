// lib/presentation/leads/views/lead_detail_page.dart
import 'package:flutter/material.dart';

import '../../core/app_theme.dart';
import '../../models/lead_model.dart';

class LeadDetailPage extends StatelessWidget {
  final LeadModel lead;

  const LeadDetailPage({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lead Details', style: AppTextStyles.heading),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailItem('Name', lead.name),
            _buildDetailItem('Phone', lead.phone),
            _buildDetailItem('Location', '${lead.city}, ${lead.state}'),
            _buildDetailItem('Type', lead.type),
            _buildDetailItem('Created', 
                '${lead.createdAt.day}/${lead.createdAt.month}/${lead.createdAt.year}'),
            if (lead.notes.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text('Notes', style: AppTextStyles.subtitle),
              const SizedBox(height: 8),
              Text(lead.notes),
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