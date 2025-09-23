import 'package:flutter/material.dart';
import 'package:tanksafe/data/truck_database.dart';
import 'package:tanksafe/screens/result_screen.dart';

class TruckLookupScreen extends StatefulWidget {
  const TruckLookupScreen({super.key});

  @override
  State<TruckLookupScreen> createState() => _TruckLookupScreenState();
}

class _TruckLookupScreenState extends State<TruckLookupScreen> {
  String selectedMake = '';
  String selectedModel = '';
  String selectedYear = '';

  List<String> get availableMakes => TankSafeDatabase.database.keys.toList()..sort();

  List<String> get availableModels {
    if (selectedMake.isEmpty) return [];
    return TankSafeDatabase.database[selectedMake]?.keys.toList() ?? [];
  }

  List<String> get availableYears {
    if (selectedMake.isEmpty || selectedModel.isEmpty) return [];
    return TankSafeDatabase.database[selectedMake]?[selectedModel]?.keys.toList() ?? [];
  }

  void _resetSelections() {
    setState(() {
      selectedModel = '';
      selectedYear = '';
    });
  }

  void _resetYearSelection() {
    setState(() {
      selectedYear = '';
    });
  }

  void _searchTruck() {
    if (selectedMake.isEmpty || selectedModel.isEmpty || selectedYear.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select Make, Model, and Year'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final truckData = TankSafeDatabase.database[selectedMake]?[selectedModel]?[selectedYear];
    
    if (truckData != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            make: selectedMake,
            model: selectedModel,
            year: selectedYear,
            truckData: truckData,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No data found for selected truck'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Find Your Device',
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
                        'Select Your Truck',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Choose your truck make, model and year to find the correct TankSafe anti-siphon device.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Make Dropdown
                      _buildDropdown(
                        label: 'Truck Make',
                        value: selectedMake.isEmpty ? null : selectedMake,
                        items: availableMakes,
                        onChanged: (value) {
                          setState(() {
                            selectedMake = value ?? '';
                            _resetSelections();
                          });
                        },
                        hint: 'Select truck manufacturer',
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Model Dropdown
                      _buildDropdown(
                        label: 'Truck Model',
                        value: selectedModel.isEmpty ? null : selectedModel,
                        items: availableModels,
                        onChanged: selectedMake.isEmpty ? null : (value) {
                          setState(() {
                            selectedModel = value ?? '';
                            _resetYearSelection();
                          });
                        },
                        hint: selectedMake.isEmpty 
                            ? 'Select make first' 
                            : 'Select truck model',
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Year Dropdown
                      _buildDropdown(
                        label: 'Year',
                        value: selectedYear.isEmpty ? null : selectedYear,
                        items: availableYears,
                        onChanged: selectedModel.isEmpty ? null : (value) {
                          setState(() {
                            selectedYear = value ?? '';
                          });
                        },
                        hint: selectedModel.isEmpty 
                            ? 'Select model first' 
                            : 'Select year',
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Search Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _searchTruck,
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
                                'Find My Device',
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
                
                // Info Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Can\'t find your truck?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Use our Custom Tank Survey or Tank Specifications features to find the right device.',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.9),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
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
    required ValueChanged<String?>? onChanged,
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
            color: onChanged == null ? Colors.grey.withValues(alpha: 0.1) : Colors.white,
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
              icon: Icon(
                Icons.arrow_drop_down,
                color: onChanged == null ? Colors.grey : const Color(0xFFFF6B00),
              ),
            ),
          ),
        ),
      ],
    );
  }
}