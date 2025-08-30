import 'package:flutter/material.dart';
import '../data/sample_products.dart';
import '../widgets/product_card.dart';
import '../widgets/offer_item.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? onToggleLang;
  const HomeScreen({super.key, this.onToggleLang});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: Text(isArabic ? 'منتجاتنا' : 'Our Products')),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.teal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.account_circle, size: 48, color: Colors.white),
                    SizedBox(height: 8),
                    Text(
                      'Menu',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.language),
                title: Text('Switch Language'),
                onTap: () {
                  Navigator.pop(context);
                  if (onToggleLang != null) onToggleLang!();
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('User Info'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/userinfo');
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer first
                  Navigator.of(
                    context,
                  ).pushNamedAndRemoveUntil('/', (route) => false);
                },
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 160,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: featuredImages.length,
                itemBuilder: (_, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(featuredImages[i], fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .72,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: products.length,
                itemBuilder: (_, i) => ProductCard(product: products[i]),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                isArabic ? 'العروض الساخنة' : 'Hot Offers',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: hotOffers.length,
                itemBuilder: (_, i) => OfferItem(
                  image: hotOffers[i]['image']!,
                  desc: hotOffers[i]['desc']!,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
