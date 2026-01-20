import 'package:flutter/material.dart';
import 'package:shoper/core/thems/MyColors.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.myapp,
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [


            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: Column(
                children: const [
                  Icon(Icons.privacy_tip_outlined,
                      size: 60, color: Mycolors.buttons),
                  SizedBox(height: 10),
                  Text(
                    "Your Privacy Matters",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "We are committed to protecting your personal data",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            _section(
              icon: Icons.info_outline,
              title: "Introduction",
              content:
              "We value your privacy. This page explains how we collect, use, "
                  "and protect your information when you use our app.",
            ),

            _section(
              icon: Icons.storage_outlined,
              title: "Data We Collect",
              content:
              "• Personal Information (Name, Email, Phone Number)\n"
                  "• Payment Information (if applicable)\n"
                  "• Usage Data (app behavior, logs, interactions)",
            ),

            _section(
              icon: Icons.settings_outlined,
              title: "How We Use Your Data",
              content:
              "• Process orders and deliveries\n"
                  "• Personalize user experience\n"
                  "• Send promotional communications (with opt-in)\n"
                  "• Improve the app using analytics",
            ),

            _section(
              icon: Icons.share_outlined,
              title: "Sharing Your Data",
              content:
              "• With payment processors for transactions\n"
                  "• With delivery partners for order fulfillment\n"
                  "• When required by law",
            ),

            _section(
              icon: Icons.verified_user_outlined,
              title: "Your Rights",
              content:
              "• View or edit your personal data\n"
                  "• Request deletion of your account\n"
                  "• Opt-out of marketing communications",
            ),

            _section(
              icon: Icons.contact_support_outlined,
              title: "Contact",
              content:
              "If you have any questions or concerns regarding your privacy, "
                  "you can contact us at support@yourapp.com.",
            ),

            const SizedBox(height: 20),

            Text(
              "© 2026 Shoper • Privacy & Trust",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Section Card
  Widget _section({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Mycolors.buttons),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(fontSize: 16, height: 1.6),
          ),
        ],
      ),
    );
  }
}
