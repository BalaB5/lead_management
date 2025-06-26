// lead_model.dart
import 'package:hive/hive.dart';

part 'lead_model.g.dart';

@HiveType(typeId: 0)
class LeadModel {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String name;
  
  @HiveField(2)
  final String phone;
  
  @HiveField(3)
  final String city;
  
  @HiveField(4)
  final String state;
  
  @HiveField(5)
  final String type;
  
  @HiveField(6)
  final String notes;
  
  @HiveField(7)
  final DateTime createdAt;
  
  @HiveField(8)
  final bool isActive;

  LeadModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.city,
    required this.state,
    required this.type,
    required this.notes,
    required this.createdAt,
    this.isActive = true,
  });
}