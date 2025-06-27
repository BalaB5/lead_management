// lib/presentation/home/views/home_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lead Management'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildFeatureCard(
              context,
              icon: Icons.people,
              title: 'Leads',
              onTap: () => Get.toNamed(Routes.LEADS),
              color: Colors.blue,
            ),
            _buildFeatureCard(
              context,
              icon: Icons.calendar_today,
              title: "Today's Followups",
              onTap: () => Get.toNamed(Routes.TODAY_FOLLOWUPS),
              color: Colors.green,
            ),
            _buildFeatureCard(
              context,
              icon: Icons.history,
              title: 'All Followups',
              onTap: () => Get.toNamed(Routes.FOLLOWUPS),
              color: Colors.orange,
            ),
            _buildFeatureCard(
              context,
              icon: Icons.add_circle,
              title: 'Add New Lead',
              onTap: () => Get.toNamed(Routes.ADD_LEAD),
              color: Colors.purple,
            ),
            _buildFeatureCard(
              context,
              icon: Icons.note_add,
              title: 'Add Followup',
              onTap: () => Get.toNamed(Routes.ADD_FOLLOWUP),
              color: Colors.teal,
            ),
            _buildFeatureCard(
              context,
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {}, // Add your settings route here
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}