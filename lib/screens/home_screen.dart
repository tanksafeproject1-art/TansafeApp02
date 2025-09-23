import 'package:flutter/material.dart';
import 'package:tanksafe/screens/truck_lookup_screen.dart';
import 'package:tanksafe/screens/custom_tank_form_screen.dart';
import 'package:tanksafe/screens/neck_specs_screen.dart';
import 'package:tanksafe/screens/about_us_screen.dart';
import 'package:tanksafe/screens/device_info_screen.dart';
import 'package:tanksafe/screens/fitment_guides_screen.dart';
import 'package:tanksafe/screens/admin_panel_screen.dart';
import 'package:tanksafe/screens/purchase_request_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://raw.githubusercontent.com/tanksafe/assets/main/tanksafe-logo-square.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.local_gas_station,
                    color: Color(0xFFFF6B00),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'TankSafe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFFF6B00),
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => _launchUrl('mailto:info@tanksafe.co.za'),
                  child: const Text(
                    'info@tanksafe.co.za',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _launchUrl('https://www.tanksafe.co.za'),
                  child: const Text(
                    'www.tanksafe.co.za',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Text(
                  '031 566 2919 | 083 254 4596',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFF6B00), Colors.transparent],
              stops: [0, 0.01]),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // TankSafe Logo Section
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4))
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFFF6B00),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            'icons/dreamflow_icon.jpg',
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                              Icons.local_gas_station,
                              size: 60,
                              color: Colors.white,
                            ),
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'TankSafe',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const Text(
                        'Safety. Protection. Prevention.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Main Action Buttons
                Expanded(
                  child: Column(
                    children: [
                      _buildMainButton(
                        context,
                        'Find My Anti-Siphon Device',
                        'Search by truck make, model & year',
                        Icons.search,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TruckLookupScreen()),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildMainButton(
                        context,
                        'Enter Tank Specifications',
                        'Find device by neck diameter & cap type',
                        Icons.engineering,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NeckSpecsScreen()),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildMainButton(
                        context,
                        'Custom Tank Survey',
                        'Submit unknown tank details for analysis',
                        Icons.assignment,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CustomTankFormScreen()),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildMainButton(
                        context,
                        'Purchase TankSafe Device',
                        'Buy directly from us with company details',
                        Icons.shopping_cart,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PurchaseRequestScreen()),
                        ),
                      ),
                    ],
                  ),
                ),

                // Footer
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Fuel\'s Only Safe When It\'s TankSafe®',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainButton(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF1A1A1A),
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFF6B00),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFFF6B00),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFFFF6B00),
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://raw.githubusercontent.com/tanksafe/assets/main/tanksafe-logo-square.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.local_gas_station,
                        color: Color(0xFFFF6B00),
                        size: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TankSafe',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Safety. Protection. Prevention.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading:
                      const Icon(Icons.info_outline, color: Color(0xFFFF6B00)),
                  title: const Text('About Us'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutUsScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.devices, color: Color(0xFFFF6B00)),
                  title: const Text('Device Information'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DeviceInfoScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.build, color: Color(0xFFFF6B00)),
                  title: const Text('Fitment Guides'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FitmentGuidesScreen()),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.admin_panel_settings,
                      color: Color(0xFFFF6B00)),
                  title: const Text('Admin Panel'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminPanelScreen()),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.web, color: Color(0xFFFF6B00)),
                  title: const Text('Visit TankSafe.co.za'),
                  onTap: () => _launchUrl('https://www.tanksafe.co.za'),
                ),
                ListTile(
                  leading: const Icon(Icons.email, color: Color(0xFFFF6B00)),
                  title: const Text('Email Us'),
                  onTap: () => _launchUrl('mailto:info@tanksafe.co.za'),
                ),
                ListTile(
                  leading: const Icon(Icons.phone, color: Color(0xFFFF6B00)),
                  title: const Text('Call: 031 566 2919'),
                  onTap: () => _launchUrl('tel:+27315662919'),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Fuel\'s Only Safe When It\'s TankSafe®',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
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
