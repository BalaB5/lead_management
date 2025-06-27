// add_lead_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/lead_controller.dart';
import '../../core/app_theme.dart';
import '../../models/lead_model.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class AddLeadPage extends StatefulWidget {
  const AddLeadPage({super.key});

  @override
  State<AddLeadPage> createState() => _AddLeadPageState();
}

class _AddLeadPageState extends State<AddLeadPage> {
  final LeadController _controller = Get.find();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  String _selectedType = 'Hot';
  String _selectedCity = '';
  String _selectedState = '';

  final List<String> _cities = ['New York', 'Los Angeles', 'Chicago', 'Houston'];
  final List<String> _states = ['NY', 'CA', 'IL', 'TX'];
  final List<String> _leadTypes = ['Hot', 'Warm', 'Cold'];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final newLead = LeadModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        phone: _phoneController.text,
        city: _selectedCity,
        state: _selectedState,
        type: _selectedType,
        notes: _notesController.text,
        createdAt: DateTime.now(),
      );

      await _controller.addLead(newLead);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Lead', style: AppTextStyles.heading),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextField(
                controller: _nameController,
                labelText: 'Lead Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter lead name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _phoneController,
                labelText: 'Phone Number',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCity.isNotEmpty ? _selectedCity : null,
                items: _cities.map((city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedCity = value!),
                decoration: InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a city';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedState.isNotEmpty ? _selectedState : null,
                items: _states.map((state) {
                  return DropdownMenuItem<String>(
                    value: state,
                    child: Text(state),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedState = value!),
                decoration: InputDecoration(
                  labelText: 'State',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a state';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedType,
                items: _leadTypes.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedType = value!),
                decoration: InputDecoration(
                  labelText: 'Lead Type',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _notesController,
                labelText: 'Notes',
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              AppButton(
                text: 'Save Lead',
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}