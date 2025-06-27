// add_followup_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../controller/followup_controller.dart';
import '../../core/app_theme.dart';
import '../../models/followup_model.dart';
import '../../models/lead_model.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class AddFollowUpPage extends StatefulWidget {
  const AddFollowUpPage({super.key});

  @override
  State<AddFollowUpPage> createState() => _AddFollowUpPageState();
}

class _AddFollowUpPageState extends State<AddFollowUpPage> {
  final FollowUpController _controller = Get.find();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _leadSearchController = TextEditingController();
  
  String _selectedStatus = 'Scheduled';
  DateTime _selectedDate = DateTime.now();
  LeadModel? _selectedLead;

  final List<String> _statuses = [
    'Scheduled', 
    'Completed', 
    'Cancelled', 
    'Postponed'
  ];

  @override
  void dispose() {
    _reasonController.dispose();
    _notesController.dispose();
    _leadSearchController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate() && _selectedLead != null) {
      final newFollowUp = FollowUpModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        leadId: _selectedLead!.id,
        followUpDate: _selectedDate,
        reason: _reasonController.text,
        status: _selectedStatus,
        notes: _notesController.text,
        createdAt: DateTime.now(),
      );

      await _controller.addFollowUp(newFollowUp);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Follow Up', style: AppTextStyles.heading),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Select Lead',
                style: AppTextStyles.subtitle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              AppTextField(
                controller: _leadSearchController,
                hintText: 'Search lead...',
                prefixIcon: Icons.search,
                onChanged: (query) {
                  if (query.isEmpty) {
                    setState(() => _selectedLead = null);
                  }
                },
              ),
              const SizedBox(height: 8),
              if (_selectedLead == null)
                Obx(() {
                  final leads = _controller.searchLeadsForFollowUp(
                    _leadSearchController.text);
                  
                  if (leads.isEmpty && _leadSearchController.text.isNotEmpty) {
                    return const Text('No leads found');
                  }
                  
                  return Column(
                    children: leads.map((lead) => ListTile(
                      title: Text(lead.name),
                      subtitle: Text(lead.phone),
                      onTap: () {
                        setState(() {
                          _selectedLead = lead;
                          _leadSearchController.text = lead.name;
                        });
                      },
                    )).toList(),
                  );
                }),
              if (_selectedLead != null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _selectedLead!.name,
                              style: AppTextStyles.subtitle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  _selectedLead = null;
                                  _leadSearchController.clear();
                                });
                              },
                            ),
                          ],
                        ),
                        Text(_selectedLead!.phone),
                        Text('${_selectedLead!.city}, ${_selectedLead!.state}'),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 16),
              Text(
                'Follow Up Date',
                style: AppTextStyles.subtitle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                child: SfDateRangePicker(
                  initialSelectedDate: _selectedDate,
                  minDate: DateTime.now(),
                  selectionMode: DateRangePickerSelectionMode.single,
                  onSelectionChanged: (args) {
                    if (args.value is DateTime) {
                      setState(() => _selectedDate = args.value);
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedStatus,
                items: _statuses.map((status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedStatus = value!),
                decoration: InputDecoration(
                  labelText: 'Status',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _reasonController,
                labelText: 'Reason',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter reason';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _notesController,
                labelText: 'Notes',
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              AppButton(
                text: 'Save Follow Up',
                onPressed: _submitForm,
                enabled: _selectedLead != null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}