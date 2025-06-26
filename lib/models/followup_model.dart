// followup_model.dart
import 'package:hive/hive.dart';

part 'followup_model.g.dart';

@HiveType(typeId: 1)
class FollowUpModel {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String leadId;
  
  @HiveField(2)
  final DateTime followUpDate;
  
  @HiveField(3)
  final String reason;
  
  @HiveField(4)
  final String status; // Scheduled, Completed, Cancelled, Postponed
  
  @HiveField(5)
  final String notes;
  
  @HiveField(6)
  final DateTime createdAt;

  FollowUpModel({
    required this.id,
    required this.leadId,
    required this.followUpDate,
    required this.reason,
    required this.status,
    required this.notes,
    required this.createdAt,
  });
}