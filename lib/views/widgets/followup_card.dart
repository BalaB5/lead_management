// followup_card.dart
import 'package:flutter/material.dart';

import '../../core/app_theme.dart';
import '../../models/followup_model.dart';

class FollowUpCard extends StatelessWidget {
  final FollowUpModel followUp;
  final VoidCallback onTap;

  const FollowUpCard({super.key, required this.followUp, required this.onTap});

  Color _getStatusColor() {
    switch (followUp.status) {
      case 'Completed':
        return AppColors.success;
      case 'Cancelled':
        return AppColors.error;
      case 'Postponed':
        return AppColors.warning;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    followUp.leadId,
                    style: AppTextStyles.subtitle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor().withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: _getStatusColor(), width: 1),
                    ),
                    child: Text(
                      followUp.status,
                      style: AppTextStyles.caption.copyWith(
                        color: _getStatusColor(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Date: ${followUp.followUpDate.day}/${followUp.followUpDate.month}/${followUp.followUpDate.year}',
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 8),
              Text(
                'Time: ${followUp.followUpDate.hour}:${followUp.followUpDate.minute.toString().padLeft(2, '0')}',
                style: AppTextStyles.body,
              ),
              if (followUp.notes.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  followUp.notes,
                  style: AppTextStyles.body.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
