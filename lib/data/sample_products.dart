import '../models/product.dart';

final featuredImages = [
  'assets/images/featured/feat1.png',
  'assets/images/featured/feat2.png',
  'assets/images/featured/feat3.png',
];

final products = List<Product>.generate(
  4,
  (i) => Product(
    id: 'p$i',
    title: 'Product ${i + 1}',
    image: 'assets/images/products/p${(i % 4) + 1}.png',
  ),
);

final hotOffers = List.generate(
  3,
  (i) => {
    'image': 'assets/images/offers/o${(i % 3) + 1}.png',
    'desc': 'Amazing offer number ${i + 1} with great value!',
  },
);
