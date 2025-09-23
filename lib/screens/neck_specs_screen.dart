import 'package:flutter/material.dart';
import 'package:tanksafe/data/truck_database.dart';
import 'package:tanksafe/screens/custom_tank_form_screen.dart';

class NeckSpecsScreen extends StatefulWidget {
  const NeckSpecsScreen({super.key});

  @override
  State<NeckSpecsScreen> createState() => _NeckSpecsScreenState();
}

class _NeckSpecsScreenState extends State<NeckSpecsScreen> {
  String selectedNeckId = '';
  String selectedLugType = '';

  final List<String> neckIdOptions = [
    '35mm',
    '40mm',
    '48mm',
    '50mm',
    '60mm',
    '65mm',
    '70mm',
    '80mm',
    '90mm',
  ];

  final List<String> lugTypeOptions = [
    '2',
    '3',
    '4',
    'Internal Screw Thread',
    'External Screw Thread',
  ];

  void _findDevice() {
    if (selectedNeckId.isEmpty || selectedLugType.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select both neck diameter and cap type'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final deviceRecommendation = TankSafeDatabase.getDeviceBySpecs(selectedNeckId, selectedLugType);
    
    if (deviceRecommendation['shield']!.isEmpty && deviceRecommendation['optimum']!.isEmpty) {
      // No device found, show custom form
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomTankFormScreen(
            prefilledNeckId: selectedNeckId,
            prefilledCapType: selectedLugType == '2' ? '2-lug' : 
                               selectedLugType == '3' ? '3-lug' : 
                               selectedLugType == '4' ? '4-lug' : 
                               selectedLugType,
          ),
        ),
      );
    } else {
      _showDeviceResult(deviceRecommendation);
    }
  }

  void _showDeviceResult(Map<String, List<String>> deviceRecommendation) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        'Device Found!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                Text(
                  'For $selectedNeckId neck with $selectedLugType cap:',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                if (deviceRecommendation['shield']!.isNotEmpty) ...[
                  const Text(
                    'TankSafe Shield:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  ...deviceRecommendation['shield']!.map((device) => Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      device,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                  const SizedBox(height: 12),
                ],
                
                if (deviceRecommendation['optimum']!.isNotEmpty) ...[
                  const Text(
                    'TankSafe Optimum:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF6B00),
                    ),
                  ),
                  ...deviceRecommendation['optimum']!.map((device) => Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF6B00).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      device,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                ],
                
                const SizedBox(height: 24),
                
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _contactForPurchase();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6B00),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Purchase'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _contactForPurchase() {
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
                  Icons.contact_phone,
                  color: Color(0xFFFF6B00),
                  size: 48,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Contact TankSafe',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Email: info@tanksafe.co.za',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Website: www.tanksafe.co.za',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Phone: 031 566 2919',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Cathy Gilmour: 083 254 4596',
                  style: TextStyle(fontSize: 16),
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
          'Tank Specifications',
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                        'Tank Neck Specifications',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Select your tank\'s neck internal diameter and cap type to find the correct anti-siphon device.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Neck ID Dropdown
                      _buildDropdown(
                        label: 'Neck Internal Diameter',
                        value: selectedNeckId.isEmpty ? null : selectedNeckId,
                        items: neckIdOptions,
                        onChanged: (value) {
                          setState(() {
                            selectedNeckId = value ?? '';
                          });
                        },
                        hint: 'Select neck diameter',
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Lug Type Dropdown
                      _buildDropdown(
                        label: 'Cap Type',
                        value: selectedLugType.isEmpty ? null : selectedLugType,
                        items: lugTypeOptions,
                        onChanged: (value) {
                          setState(() {
                            selectedLugType = value ?? '';
                          });
                        },
                        hint: 'Select cap type',
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Find Device Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _findDevice,
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
                              Icon(Icons.search, size: 24),
                              SizedBox(width: 8),
                              Text(
                                'Find Compatible Device',
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
                
                const SizedBox(height: 24),
                
                // Device Reference Chart
                Container(
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
                        'Quick Reference',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildReferenceRow('35mm + 2-Lug', 'TISS083/TISS084'),
                      _buildReferenceRow('40mm + 2-Lug', 'TISS047'),
                      _buildReferenceRow('70mm + 2-Lug', 'TISS063'),
                      _buildReferenceRow('80mm + 2-Lug', 'TISS006/TISS500'),
                      _buildReferenceRow('80mm + 3-Lug', 'TISS016/TISS520'),
                      _buildReferenceRow('90mm + 3-Lug', 'TISS066/TISS560'),
                    ],
                  ),
                ),
                
                const Spacer(),
                
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
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
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

  Widget _buildReferenceRow(String spec, String device) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              spec,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Text(
              device,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}