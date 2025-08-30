import 'package:flutter/material.dart';

class OfferItem extends StatelessWidget {
  final String image, desc;
  const OfferItem({super.key, required this.image, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Image.asset(image, width: 80, height: 80, fit: BoxFit.cover),
            const SizedBox(width: 12),
            Expanded(child: Text(desc)),
          ],
        ),
      ),
    );
  }
}
