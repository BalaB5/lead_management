// lead_controller.dart
import 'package:get/get.dart';

import '../core/lead_repository.dart';
import '../models/lead_model.dart';

class LeadController extends GetxController {
  final LeadRepository _leadRepository = Get.find();
  final RxList<LeadModel> leads = <LeadModel>[].obs;
  final RxString searchQuery = ''.obs;
  final RxString selectedType = 'All'.obs;

  @override
  void onInit() {
    loadLeads();
    super.onInit();
  }

  void loadLeads() {
    leads.value = _leadRepository.getAllLeads();
  }

  void searchLeads(String query) {
    searchQuery.value = query;
    if (query.isEmpty && selectedType.value == 'All') {
      loadLeads();
    } else if (query.isEmpty) {
      leads.value = _leadRepository.filterLeadsByType(selectedType.value);
    } else if (selectedType.value == 'All') {
      leads.value = _leadRepository.searchLeads(query);
    } else {
      leads.value = _leadRepository
          .filterLeadsByType(selectedType.value)
          .where((lead) => lead!.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void filterByType(String type) {
    selectedType.value = type;
    if (type == 'All') {
      loadLeads();
    } else {
      leads.value = _leadRepository.filterLeadsByType(type);
    }
  }

  Future<void> addLead(LeadModel lead) async {
    await _leadRepository.addLead(lead);
    loadLeads();
  }

  Future<void> updateLead(LeadModel lead) async {
    await _leadRepository.updateLead(lead);
    loadLeads();
  }

  Future<void> deleteLead(String leadId) async {
    await _leadRepository.deleteLead(leadId);
    loadLeads();
  }
}