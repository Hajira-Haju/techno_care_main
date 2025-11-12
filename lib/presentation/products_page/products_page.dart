import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final List<Product> products = [
    Product(
      name: 'Association 365',
      description: 'Comprehensive association management solution',
      imagePath: 'assets/Association-365-PNG.png',
    ),
    Product(
      name: 'Crew Suit',
      description: 'Professional crew management system',
      imagePath: 'assets/Crew-Suit-PNG.png',
    ),
    Product(
      name: 'Easy Trade',
      description: 'Simplified trading platform for businesses',
      imagePath: 'assets/Easy-Trade-PNG.png',
    ),
    Product(
      name: 'Feed Bee',
      description: 'Social media management and analytics tool',
      imagePath: 'assets/Feed-Bee-PNG.png',
    ),
    Product(
      name: 'HR Pro',
      description: 'Human resources management software',
      imagePath: 'assets/HR-Pro-PNG.png',
    ),
    Product(
      name: 'Info Realtor',
      description: 'Real estate information and management system',
      imagePath: 'assets/Info-Realtor-PNG.png',
    ),
    Product(
      name: 'Ingate',
      description: 'Entry management and security solution',
      imagePath: 'assets/Ingate-PNG.png',
    ),
    Product(
      name: 'Online Store',
      description: 'E-commerce platform for online businesses',
      imagePath: 'assets/Online-Store-PNG.png',
    ),
    Product(
      name: 'Pepper',
      description: 'Spice and ingredient management system',
      imagePath: 'assets/Pepper-PNG.png',
    ),
    Product(
      name: 'Show Board',
      description: 'Digital display and presentation tool',
      imagePath: 'assets/Show-Board-PNG.png',
    ),
    Product(
      name: 'Skak One',
      description: 'Unified platform for business operations',
      imagePath: 'assets/Skak-One-PNG.png',
    ),
    Product(
      name: 'Treasure',
      description: 'Asset and wealth management solution',
      imagePath: 'assets/Treasure-PNG.png',
    ),
    Product(
      name: 'Up Bin',
      description: 'Waste management and recycling system',
      imagePath: 'assets/Up-Bin-PNG.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f9fa),
      body: CustomScrollView(
        slivers: [
          // Header Section - Similar to Services Page
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Our Products',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black45,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF7c4c9d),
                      Color(0xFFe3a446),
                    ],
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      size: 60,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Innovative Products for Your Needs',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: const Color(0xFF7c4c9d),
          ),

          // Products List Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What We Build',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Discover our comprehensive range of software solutions designed to transform your business operations',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF666666),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          // Products List
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ProductCard(product: products[index]),
                );
              },
              childCount: products.length,
            ),
          ),

          // Bottom Spacing
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Handle product tap
            Get.snackbar(
              product.name,
              'Product details coming soon!',
              backgroundColor: const Color(0xFFe3a446),
              colorText: Colors.white,
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFFf8f9fa),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      product.imagePath,
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFe3a446),
                                Color(0xFF7c4c9d),
                              ],
                            ),
                          ),
                          child: const Icon(
                            Icons.image_not_supported,
                            color: Colors.white,
                            size: 30,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Product Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF666666),
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFe3a446).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'View Details',
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color(0xFFe3a446),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final String imagePath;

  Product({
    required this.name,
    required this.description,
    required this.imagePath,
  });
}

// Controller for GetX (if needed for future enhancements)
class ProductsController extends GetxController {
  // Add your controller logic here if needed
}