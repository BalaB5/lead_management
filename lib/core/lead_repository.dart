// lead_repository.dart
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/lead_model.dart';

class LeadRepository {
  final Box<LeadModel> _leadBox = Hive.box<LeadModel>('leads');

  Future<void> addLead(LeadModel lead) async {
    await _leadBox.put(lead.id, lead);
  }

  Future<void> updateLead(LeadModel lead) async {
    await _leadBox.put(lead.id, lead);
  }

  Future<void> deleteLead(String leadId) async {
    await _leadBox.delete(leadId);
  }

  List<LeadModel> getAllLeads() {
    return _leadBox.values.toList();
  }

  List<LeadModel> searchLeads(String query) {
    return _leadBox.values
        .where((lead) => lead.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  List<LeadModel> filterLeadsByType(String type) {
    return _leadBox.values
        .where((lead) => lead.type == type)
        .toList();
  }

  LeadModel? getLeadById(String leadId) {
    return _leadBox.get(leadId);
  }
}