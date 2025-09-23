import 'package:flutter/material.dart';
import 'package:tanksafe/data/truck_database.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  String selectedAction = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Panel',
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
                              Icons.admin_panel_settings,
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
                                  'Database Management',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1A1A1A),
                                  ),
                                ),
                                Text(
                                  'Manage truck and device information',
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
                      
                      // Action Selection
                      const Text(
                        'Select Action:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      
                      const SizedBox(height: 12),
                      
                      _buildActionCard(
                        'Add New Truck Make and Model',
                        'Add a new truck with device specifications',
                        Icons.add_circle,
                        Colors.green,
                        () => _showAddTruckDialog(),
                      ),
                      
                      const SizedBox(height: 12),
                      
                      _buildActionCard(
                        'Edit Existing Truck Information',
                        'Modify existing truck specifications',
                        Icons.edit,
                        Colors.blue,
                        () => _showEditTruckDialog(),
                      ),
                      
                      const SizedBox(height: 12),
                      
                      _buildActionCard(
                        'View Database Statistics',
                        'Show current database information',
                        Icons.analytics,
                        Colors.purple,
                        () => _showDatabaseStats(),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Database Overview
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
                        'Current Database Overview',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildStatsRow('Total Makes:', '${TankSafeDatabase.database.keys.length}'),
                      const SizedBox(height: 8),
                      _buildStatsRow('Total Models:', _getTotalModels().toString()),
                      const SizedBox(height: 8),
                      _buildStatsRow('Total Entries:', _getTotalEntries().toString()),
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
    );
  }

  Widget _buildActionCard(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: color,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  int _getTotalModels() {
    int total = 0;
    for (var make in TankSafeDatabase.database.values) {
      total += make.keys.length;
    }
    return total;
  }

  int _getTotalEntries() {
    int total = 0;
    for (var make in TankSafeDatabase.database.values) {
      for (var model in make.values) {
        total += model.keys.length;
      }
    }
    return total;
  }

  void _showAddTruckDialog() {
    final makeController = TextEditingController();
    final modelController = TextEditingController();
    final yearController = TextEditingController();
    final shieldController = TextEditingController();
    final optimumController = TextEditingController();
    final drainSafeController = TextEditingController();
    final senderSafeController = TextEditingController();
    final notesController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            padding: const EdgeInsets.all(24),
            constraints: const BoxConstraints(maxHeight: 600),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Add New Truck',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  _buildDialogTextField(makeController, 'Make', 'e.g., Volvo'),
                  const SizedBox(height: 12),
                  _buildDialogTextField(modelController, 'Model', 'e.g., FH 440'),
                  const SizedBox(height: 12),
                  _buildDialogTextField(yearController, 'Year', 'e.g., 2023'),
                  const SizedBox(height: 12),
                  _buildDialogTextField(shieldController, 'Shield Device', 'e.g., TISS006'),
                  const SizedBox(height: 12),
                  _buildDialogTextField(optimumController, 'Optimum Device', 'e.g., TISS500'),
                  const SizedBox(height: 12),
                  _buildDialogTextField(drainSafeController, 'DrainSafe', 'e.g., M22x1.5'),
                  const SizedBox(height: 12),
                  _buildDialogTextField(senderSafeController, 'SenderSafe', 'e.g., SS-Large'),
                  const SizedBox(height: 12),
                  _buildDialogTextField(notesController, 'Notes', 'Additional information', maxLines: 2),
                  
                  const SizedBox(height: 24),
                  
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Here you would implement the actual database update
                            // For now, just show a success message
                            Navigator.pop(context);
                            _showSuccessDialog('Truck added successfully!\n\nNote: This is a demo. In a real app, this would update the database.');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF6B00),
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Add Truck'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showEditTruckDialog() {
    // Show make selection first
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
                const Text(
                  'Select Truck Make',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                SizedBox(
                  height: 300,
                  child: ListView(
                    children: TankSafeDatabase.database.keys.map((make) {
                      return ListTile(
                        title: Text(make),
                        subtitle: Text('${TankSafeDatabase.database[make]!.keys.length} models'),
                        onTap: () {
                          Navigator.pop(context);
                          _showModelSelection(make);
                        },
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      );
                    }).toList(),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showModelSelection(String make) {
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
                Text(
                  '$make Models',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                SizedBox(
                  height: 300,
                  child: ListView(
                    children: TankSafeDatabase.database[make]!.keys.map((model) {
                      return ListTile(
                        title: Text(model),
                        subtitle: Text('${TankSafeDatabase.database[make]![model]!.keys.length} years'),
                        onTap: () {
                          Navigator.pop(context);
                          _showEditForm(make, model);
                        },
                        trailing: const Icon(Icons.edit, size: 16),
                      );
                    }).toList(),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showEditForm(String make, String model) {
    // This would show the actual edit form
    _showSuccessDialog('Edit Form for $make $model\n\nNote: This is a demo. In a real app, this would show an edit form with current values pre-filled.');
  }

  void _showDatabaseStats() {
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
                const Text(
                  'Database Statistics',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                _buildStatItem('Total Makes', '${TankSafeDatabase.database.keys.length}'),
                _buildStatItem('Total Models', '${_getTotalModels()}'),
                _buildStatItem('Total Entries', '${_getTotalEntries()}'),
                
                const SizedBox(height: 16),
                
                const Text(
                  'Top Makes by Model Count:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                const SizedBox(height: 8),
                
                ...(TankSafeDatabase.database.entries
                    .map((e) => MapEntry(e.key, e.value.keys.length))
                    .toList()
                  ..sort((a, b) => b.value.compareTo(a.value)))
                    .take(5)
                    .map((entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(entry.key),
                          Text('${entry.value} models'),
                        ],
                      ),
                    )),
                
                const SizedBox(height: 20),
                
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF6B00),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDialogTextField(
    TextEditingController controller,
    String label,
    String hint, {
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
      ],
    );
  }

  void _showSuccessDialog(String message) {
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
                  Icons.info,
                  color: Color(0xFFFF6B00),
                  size: 48,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  message,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B00),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}