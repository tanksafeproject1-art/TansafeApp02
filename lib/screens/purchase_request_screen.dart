import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PurchaseRequestScreen extends StatefulWidget {
  final String? prefilledDevice;

  const PurchaseRequestScreen({
    super.key,
    this.prefilledDevice,
  });

  @override
  State<PurchaseRequestScreen> createState() => _PurchaseRequestScreenState();
}

class _PurchaseRequestScreenState extends State<PurchaseRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Device Details
  final _deviceCodeController = TextEditingController();
  final _quantityController = TextEditingController();
  
  // Company Details
  final _companyNameController = TextEditingController();
  final _contactPersonController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _specialRequestsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.prefilledDevice != null) {
      _deviceCodeController.text = widget.prefilledDevice!;
    }
    _quantityController.text = '1';
  }

  @override
  void dispose() {
    _deviceCodeController.dispose();
    _quantityController.dispose();
    _companyNameController.dispose();
    _contactPersonController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _specialRequestsController.dispose();
    super.dispose();
  }

  void _submitPurchaseRequest() {
    if (_formKey.currentState!.validate()) {
      _sendPurchaseEmail();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _sendPurchaseEmail() async {
    final String emailBody = '''
TankSafe Device Purchase Request
===============================

DEVICE DETAILS:
- Device Code: ${_deviceCodeController.text}
- Quantity: ${_quantityController.text}

COMPANY DETAILS:
- Company Name: ${_companyNameController.text}
- Contact Person: ${_contactPersonController.text}
- Email: ${_emailController.text}
- Phone: ${_phoneController.text}
- Company Address: ${_addressController.text}

SPECIAL REQUESTS:
${_specialRequestsController.text.isNotEmpty ? _specialRequestsController.text : 'None'}

---
Purchase request submitted via TankSafe Mobile App
Date: ${DateTime.now().toLocal().toString().split(' ')[0]}

Please provide quotation and delivery information for the requested device(s).
    ''';

    final String subject = 'Purchase Request - ${_deviceCodeController.text} - ${_companyNameController.text}';
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
                  'Purchase Request Sent!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Thank you for your purchase request. Our sales team will contact you shortly with pricing and delivery information.',
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
                  'Cathy.Gilmour@tanksafe.co.za\nKenny.Naidoo@tanksafe.co.za\nSithule.mbambo@tanksafe.co.za\n\n031 566 2919',
                  style: TextStyle(
                    fontSize: 14,
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
          'Purchase Request',
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
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF6B00),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Purchase TankSafe Device',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1A1A1A),
                                    ),
                                  ),
                                  Text(
                                    'Fill in your details for a quote',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Device Details Section
                        _buildSectionTitle('Device Details'),
                        const SizedBox(height: 16),
                        
                        _buildTextField(
                          controller: _deviceCodeController,
                          label: 'Device Code',
                          hint: 'e.g., TISS006, TISS063, TISS500',
                          required: true,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        _buildTextField(
                          controller: _quantityController,
                          label: 'Quantity',
                          hint: '1',
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
                        
                        const SizedBox(height: 16),
                        
                        _buildTextField(
                          controller: _specialRequestsController,
                          label: 'Special Requests',
                          hint: 'Any additional requirements or notes',
                          maxLines: 3,
                          required: false,
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Submit Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _submitPurchaseRequest,
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
                                  'Submit Purchase Request',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Info Card
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Colors.blue,
                                size: 24,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Our sales team will contact you within 24 hours with pricing, availability, and delivery information.',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Contact Information
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Contact TankSafe Directly',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildContactRow('Email:', 'info@tanksafe.co.za', () => _launchUrl('mailto:info@tanksafe.co.za')),
                        const SizedBox(height: 8),
                        _buildContactRow('Website:', 'www.tanksafe.co.za', () => _launchUrl('https://www.tanksafe.co.za')),
                        const SizedBox(height: 8),
                        _buildContactRow('Phone:', '031 566 2919', () => _launchUrl('tel:+27315662919')),
                        const SizedBox(height: 8),
                        _buildContactRow('Cathy Gilmour:', '083 254 4596', () => _launchUrl('tel:+27832544596')),
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
                  if (label == 'Email Address' && !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                }
              : null,
        ),
      ],
    );
  }

  Widget _buildContactRow(String label, String value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const Icon(
            Icons.open_in_new,
            color: Colors.white,
            size: 16,
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}