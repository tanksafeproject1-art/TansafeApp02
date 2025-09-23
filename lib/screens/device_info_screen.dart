import 'package:flutter/material.dart';

class DeviceInfoScreen extends StatelessWidget {
  const DeviceInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Device Information',
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
                // Optimum Device Info
                _buildDeviceCard(
                  'TankSafe Optimum',
                  'For fleets that demand 100% protection',
                  '''How it works:
A unique float-valve allows fuel to flow into the tank during the filling process and then 'locks' the tank once filling is complete.

The pressure of the flowing fuel pushes the float ball down while it enters. However, when filling is complete, the float ball rises up to lock off the tank. In this way, no fuel can be siphoned, not even the top few centimeters. The float-valve lock process also prevents overfilling and spills, which alleviates a lot of Health & Safety as well as environmental concerns.

Benefits:
• Compatible with the OEM diesel cap
• 100% protection from fuel siphonage
• 100% protection from fuel skimming
• Prevents overfilling and therefore wastage
• Tamper proof protection for the float-valve
• The unique patented undercut design conceals and protects the gasket between the anti-siphon head and tank neck preventing attack and water ingress
• Fast filling security device (tested at 140 litres per minute)
• Easy DIY fitment

100% FUEL PROTECTION
Patented Float Valve ensures chamber remains empty so no fuel can be skimmed

DID YOU KNOW?
• 50L Diesel theft per week can add up to a R55k loss per year
• TankSafe have sold over 3.1 Million units worldwide
• TankSafe® has a 3-year warranty''',
                  Colors.orange,
                  'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=300&fit=crop',
                ),
                
                const SizedBox(height: 20),
                
                // Shield Device Info
                _buildDeviceCard(
                  'TankSafe Shield',
                  'Affordable diesel anti-siphon solution',
                  '''How it works:
It restricts the amount of fuel that can be skimmed from inside the anti-siphon chamber. This is largely thanks to its short neck and 4mm thick, solid aluminium 'attack proof' dome base, leaving only a minimal amount of fuel exposed.

Recommended for small and medium truck tanks that have an elongated neck so the anti-siphon is not sitting submerged in diesel when the tank is full.

Benefits:
• Compatible with the OEM diesel cap
• The unique patented undercut design conceals and protects the gasket between the anti-siphon head and tank neck preventing attack and water ingress
• Attack proof 6mm thick patented solid dome base
• Short chamber offers 75% more protection than its nearest competitors
• Does not impact flow rate (tested at 120+ litres per minute)
• Flow apertures with teeth prevent 6mm+ siphoning tubes from bypassing the device
• Easy DIY fitment
• Highly competitively priced solution

DID YOU KNOW?
• 50L Diesel theft per week can add up to a R55k loss per year
• TankSafe have sold over 3.1 Million units worldwide
• TankSafe® has a 3-year warranty''',
                  Colors.blue,
                  'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=300&fit=crop',
                ),
                
                const SizedBox(height: 20),
                
                // SenderSafe Info
                _buildSecondaryDeviceCard(
                  'SenderSafe',
                  'Fuel sender protection system',
                  '''SenderSafe Benefits:
• Prevents tampering or removal of the fuel sender and pipes
• Produced from 304 Stainless Steel
• Fits under tank straps
• Available in various sizes

SenderSafe protects your fuel sender units from theft and tampering, ensuring accurate fuel readings and preventing unauthorized access to your fuel system.''',
                  const Color(0xFF4CAF50),
                ),
                
                const SizedBox(height: 16),
                
                // DrainSafe Info
                _buildSecondaryDeviceCard(
                  'DrainSafe',
                  'Anti-siphon drain plug protection',
                  '''DrainSafe Benefits:
• Prevents unauthorized draining of the fuel tank
• Anti-tamper bolt replaces the original drain plug bolt
• Requires a special security tool to unscrew the bolt
• Tool sold separately

DrainSafe prevents thieves from draining your fuel through the tank's drain plug, providing complete fuel protection when used with TankSafe devices.''',
                  const Color(0xFF2196F3),
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

  Widget _buildDeviceCard(
    String title,
    String subtitle,
    String description,
    Color color,
    String imageUrl,
  ) {
    return Container(
      width: double.infinity,
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
          // Header with icon and title
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.shield,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Device Image
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.local_gas_station,
                      size: 64,
                      color: color,
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Description
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondaryDeviceCard(
    String title,
    String subtitle,
    String description,
    Color color,
  ) {
    return Container(
      width: double.infinity,
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
          // Header with icon and title
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.security,
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
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
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Description
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}