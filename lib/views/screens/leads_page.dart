// leads_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/lead_controller.dart';
import '../../core/app_theme.dart';
import '../widgets/lead_card.dart';
import 'add_lead_page.dart';

class LeadsPage extends GetView<LeadController> {
  const LeadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leads', style: AppTextStyles.heading),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Get.to(() => const AddLeadPage()),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AppTextField(
                  hintText: 'Search leads...',
                  prefixIcon: Icons.search,
                  onChanged: controller.searchLeads,
                ),
                const SizedBox(height: 12),
                Obx(() => DropdownButtonFormField<String>(
                  value: controller.selectedType.value,
                  items: ['All', 'Hot', 'Warm', 'Cold'].map((type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (value) => controller.filterByType(value!),
                  decoration: InputDecoration(
                    labelText: 'Filter by type',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.leads.isEmpty) {
                return EmptyState(
                  icon: Icons.people_alt_outlined,
                  title: 'No Leads Found',
                  subtitle: 'Add your first lead to get started',
                );
              }
              return RefreshIndicator(
                onRefresh: () async => controller.loadLeads(),
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 16),
                  itemCount: controller.leads.length,
                  itemBuilder: (context, index) {
                    final lead = controller.leads[index];
                    return LeadCard(
                      lead: lead,
                      onTap: () => Get.to(() => LeadDetailPage(lead: lead)),
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