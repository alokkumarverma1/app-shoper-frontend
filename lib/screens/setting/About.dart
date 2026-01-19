import 'package:flutter/material.dart';
import 'package:shoper/core/thems/MyColors.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 240, 235),
      appBar: AppBar(
        title: const Text("About Shoper"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            // 🔹 App Logo / Header
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
                  Icon(Icons.storefront, size: 70, color: Mycolors.buttons),
                  SizedBox(height: 10),
                  Text(
                    "Shoper",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Open • Manage • Buy • Connect",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 🔹 About Card
            _infoCard(
              title: "What is Shoper?",
              icon: Icons.info_outline,
              child: const Text(
                "Shoper is a modern e-commerce platform that allows anyone to "
                    "open their own online shop in just 1 minute. "
                    "Shop owners can easily manage products, while customers "
                    "can discover nearby shops, browse categories, and shop instantly.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
            ),

            // 🔹 Features
            _infoCard(
              title: "Key Features",
              icon: Icons.star_outline,
              child: Column(
                children: const [
                  _Feature(text: "Open your online shop in just 1 minute",),
                  _Feature(text: "Add, edit, and manage products easily"),
                  _Feature(text: "Buy products and add them to cart"),
                  _Feature(text: "Browse all categories in one place"),
                  _Feature(text: "Discover nearby shops and their products"),
                  _Feature(text: "Chat directly with shop owners"),
                  _Feature(text: "Secure & fast shopping experience"),
                  _Feature(text: "Clean, simple & user-friendly design"),
                ],
              ),
            ),

            // 🔹 For Users
            _infoCard(
              title: "For Customers",
              icon: Icons.shopping_cart_outlined,
              child: const Text(
                "Customers can explore all categories, find nearby shops, "
                    "compare products, chat with sellers, add items to cart, "
                    "and enjoy a smooth online shopping experience.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
            ),

            // 🔹 For Shop Owners
            _infoCard(
              title: "For Shop Owners",
              icon: Icons.store_outlined,
              child: const Text(
                "Shop owners can quickly create their shop, manage inventory, "
                    "update product details, track sales, and connect directly "
                    "with customers — all from one app.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Footer
            Text(
              "© 2026 Shoper • Built for local businesses",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Card Widget
  static Widget _infoCard({
    required String title,
    required IconData icon,
    required Widget child,
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
              Icon(icon, color: Colors.deepOrange),
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
          child,
        ],
      ),
    );
  }
}

// 🔹 Feature Bullet
class _Feature extends StatelessWidget {
  final String text;
  const _Feature({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle,
            size: 18,
            color: Mycolors.buttons, // ✅ same color for all icons
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text, // ✅ text now visible
              style: const TextStyle(
                fontSize: 16,
                height: 1.4,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
