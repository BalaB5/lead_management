// lead_card.dart
import 'package:flutter/material.dart';

import '../../core/app_theme.dart';
import '../../models/lead_model.dart';

class LeadCard extends StatelessWidget {
  final LeadModel lead;
  final VoidCallback onTap;

  const LeadCard({
    super.key,
    required this.lead,
    required this.onTap,
  });

  Color _getTypeColor() {
    switch (lead.type) {
      case 'Hot':
        return AppColors.error;
      case 'Warm':
        return AppColors.warning;
      case 'Cold':
        return AppColors.info;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
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
                    lead.name,
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
                      color: _getTypeColor().withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: _getTypeColor(),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      lead.type,
                      style: AppTextStyles.caption.copyWith(
                        color: _getTypeColor(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                lead.phone,
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 8),
              Text(
                '${lead.city}, ${lead.state}',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.grey,
                ),
              ),
              if (lead.notes.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  lead.notes,
                  style: AppTextStyles.body.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 8),
              Text(
                'Created: ${lead.createdAt.day}/${lead.createdAt.month}/${lead.createdAt.year}',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}