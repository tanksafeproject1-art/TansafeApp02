import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomTankFormScreen extends StatefulWidget {
  final String? prefilledNeckId;
  final String? prefilledCapType;

  const CustomTankFormScreen({
    super.key,
    this.prefilledNeckId,
    this.prefilledCapType,
  });

  @override
  State<CustomTankFormScreen> createState() => _CustomTankFormScreenState();
}

class _CustomTankFormScreenState extends State<CustomTankFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Vehicle Details
  final _vehicleMakeController = TextEditingController();
  final _vehicleModelController = TextEditingController();
  final _yearController = TextEditingController();
  
  // Tank Specifications
  final _tankVolumeController = TextEditingController();
  final _internalDiameterController = TextEditingController();
  final _externalDiameterController = TextEditingController();
  final _neckLengthController = TextEditingController();
  
  String selectedCapType = '';
  
  // Company Details
  final _companyNameController = TextEditingController();
  final _contactPersonController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  final List<String> capTypeOptions = [
    '2-lug',
    '3-lug', 
    '4-lug',
    'Screw Thread',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.prefilledNeckId != null) {
      _internalDiameterController.text = widget.prefilledNeckId!;
    }
    if (widget.prefilledCapType != null) {
      selectedCapType = widget.prefilledCapType!;
    }
  }

  @override
  void dispose() {
    _vehicleMakeController.dispose();
    _vehicleModelController.dispose();
    _yearController.dispose();
    _tankVolumeController.dispose();
    _internalDiameterController.dispose();
    _externalDiameterController.dispose();
    _neckLengthController.dispose();
    _companyNameController.dispose();
    _contactPersonController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && selectedCapType.isNotEmpty) {
      _sendEmail();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _sendEmail() async {
    final String emailBody = '''
TankSafe Tank Neck Survey Form
==============================

VEHICLE DETAILS:
- Make: ${_vehicleMakeController.text}
- Model: ${_vehicleModelController.text}
- Year of Manufacture: ${_yearController.text}

TANK SPECIFICATIONS:
- Tank Volume: ${_tankVolumeController.text} litres
- Internal Diameter: ${_internalDiameterController.text} mm
- External Diameter: ${_externalDiameterController.text} mm
- Cap Type: $selectedCapType
- Neck Length: ${_neckLengthController.text} mm

COMPANY DETAILS:
- Company Name: ${_companyNameController.text}
- Contact Person: ${_contactPersonController.text}
- Email: ${_emailController.text}
- Phone: ${_phoneController.text}
- Address: ${_addressController.text}

---
Submitted via TankSafe Mobile App
Date: ${DateTime.now().toLocal().toString().split(' ')[0]}
    ''';

    final String subject = 'Tank Neck Survey - ${_companyNameController.text}';
    final String recipients = 'Cathy.Gilmour@tanksafe.co.za,Kenny.Naidoo@tanksafe.co.za,Sithule.mbambo@tanksafe.co.za';
    
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: recipients,
      queryParameters: {
        'subject': subject,
        'body': emailBody,
      },
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
        _showSuccessDialog();
      } else {
        throw 'Could not launch email client';
      }
    } catch (e) {
      _showErrorDialog();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 64,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Survey Submitted!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Thank you for submitting your tank survey. Our technical team will analyze your specifications and get back to you with a device recommendation.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B00),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Done'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 64,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Email Error',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Unable to send email automatically. Please contact us directly:',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'info@tanksafe.co.za\n031 566 2919',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B00),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tank Neck Survey',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFF6B00),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF6B00),
              Color(0xFF1A1A1A),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tank Neck Survey Form',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Fill in your tank details and we\'ll recommend the correct anti-siphon device.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Vehicle Details Section
                        _buildSectionTitle('Vehicle Details'),
                        const SizedBox(height: 16),
                        
                        _buildTextField(
                          controller: _vehicleMakeController,
                          label: 'Vehicle Make',
                          hint: 'e.g., DAF, Volvo, Mercedes',
                          required: true,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildTextField(
                          controller: _vehicleModelController,
                          label: 'Vehicle Model',
                          hint: 'e.g., XF 480, FH 440',
                          required: true,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildTextField(
                          controller: _yearController,
                          label: 'Year of Manufacture',
                          hint: 'e.g., 2023',
                          keyboardType: TextInputType.number,
                          required: true,
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Tank Specifications Section
                        _buildSectionTitle('Tank Specifications'),
                        const SizedBox(height: 16),
                        
                        _buildTextField(
                          controller: _tankVolumeController,
                          label: 'Tank Volume (litres)',
                          hint: 'e.g., 400',
                          keyboardType: TextInputType.number,
                          required: false,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildTextField(
                          controller: _internalDiameterController,
                          label: 'Internal Diameter (mm)',
                          hint: 'e.g., 80',
                          keyboardType: TextInputType.number,
                          required: false,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildTextField(
                          controller: _externalDiameterController,
                          label: 'External Diameter (mm)',
                          hint: 'e.g., 95',
                          keyboardType: TextInputType.number,
                          required: true,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildDropdown(
                          label: 'Cap Type',
                          value: selectedCapType.isEmpty ? null : selectedCapType,
                          items: capTypeOptions,
                          onChanged: (value) {
                            setState(() {
                              selectedCapType = value ?? '';
                            });
                          },
                          hint: 'Select cap type',
                          required: true,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildTextField(
                          controller: _neckLengthController,
                          label: 'Neck Length (mm)',
                          hint: 'e.g., 50',
                          keyboardType: TextInputType.number,
                          required: true,
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Company Details Section
                        _buildSectionTitle('Company Details'),
                        const SizedBox(height: 16),
                        
                        _buildTextField(
                          controller: _companyNameController,
                          label: 'Company Name',
                          hint: 'Your company name',
                          required: true,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildTextField(
                          controller: _contactPersonController,
                          label: 'Contact Person',
                          hint: 'Your name',
                          required: true,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildTextField(
                          controller: _emailController,
                          label: 'Email Address',
                          hint: 'your@email.com',
                          keyboardType: TextInputType.emailAddress,
                          required: true,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildTextField(
                          controller: _phoneController,
                          label: 'Phone Number',
                          hint: '+27 123 456 7890',
                          keyboardType: TextInputType.phone,
                          required: true,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildTextField(
                          controller: _addressController,
                          label: 'Company Address',
                          hint: 'Your company address',
                          maxLines: 2,
                          required: true,
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Submit Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _submitForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF6B00),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 2,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.send, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Submit Survey',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Footer
                  const Center(
                    child: Text(
                      'Fuel\'s Only Safe When It\'s TankSafe®',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFF6B00),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType? keyboardType,
    bool required = false,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
            ),
            children: required
                ? const [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red),
                    ),
                  ]
                : null,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFFF6B00), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          validator: required
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                }
              : null,
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required String hint,
    bool required = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
            ),
            children: required
                ? const [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red),
                    ),
                  ]
                : null,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              hint: Text(
                hint,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),
              isExpanded: true,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Color(0xFFFF6B00),
              ),
            ),
          ),
        ),
      ],
    );
  }
}