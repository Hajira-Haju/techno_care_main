import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicePage extends StatelessWidget {
  ServicePage({super.key});

  final List<Service> services = [
    Service(
      title: 'Web Development',
      description: 'Custom web applications built with modern technologies for optimal performance and user experience.',
      icon: Icons.web,
      features: ['Responsive Design', 'SEO Optimization', 'Fast Loading', 'Secure'],
      color: const Color(0xFFe3a446),
    ),
    Service(
      title: 'Mobile App Development',
      description: 'Cross-platform mobile applications for iOS and Android using Flutter and React Native.',
      icon: Icons.phone_iphone,
      features: ['Cross-Platform', 'Native Performance', 'Offline Support', 'App Store Ready'],
      color: const Color(0xFF7c4c9d),
    ),
    Service(
      title: 'UI/UX Design',
      description: 'Beautiful and intuitive user interfaces that enhance user engagement and satisfaction.',
      icon: Icons.design_services,
      features: ['User Research', 'Wireframing', 'Prototyping', 'Design Systems'],
      color: const Color(0xFFe3a446),
    ),
    Service(
      title: 'Cloud Solutions',
      description: 'Scalable cloud infrastructure and deployment solutions for your growing business needs.',
      icon: Icons.cloud,
      features: ['AWS/Azure/GCP', 'Scalable Architecture', 'Cost Optimization', '24/7 Monitoring'],
      color: const Color(0xFF7c4c9d),
    ),
    Service(
      title: 'E-Commerce Solutions',
      description: 'Complete e-commerce platforms with secure payment integration and inventory management.',
      icon: Icons.shopping_cart,
      features: ['Payment Gateway', 'Inventory Management', 'Analytics', 'Multi-Vendor Support'],
      color: const Color(0xFFe3a446),
    ),
    Service(
      title: 'Digital Marketing',
      description: 'Comprehensive digital marketing strategies to boost your online presence and conversions.',
      icon: Icons.trending_up,
      features: ['SEO/SEM', 'Social Media', 'Content Marketing', 'Analytics'],
      color: const Color(0xFF7c4c9d),
    ),
    Service(
      title: 'Maintenance & Support',
      description: 'Ongoing maintenance and technical support to keep your applications running smoothly.',
      icon: Icons.support_agent,
      features: ['24/7 Support', 'Regular Updates', 'Bug Fixing', 'Performance Monitoring'],
      color: const Color(0xFFe3a446),
    ),
    Service(
      title: 'Consulting',
      description: 'Expert technology consulting to help you make informed decisions for your digital transformation.',
      icon: Icons.business_center,
      features: ['Tech Strategy', 'Digital Transformation', 'Cost Analysis', 'Implementation Planning'],
      color: const Color(0xFF7c4c9d),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f9fa),
      body: CustomScrollView(
        slivers: [
          // Header Section
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Our Services',
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
                      Icons.engineering,
                      size: 60,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Expert Solutions for Your Business',
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

          // Services Grid
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What We Offer',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Comprehensive digital solutions to transform your business and drive growth',
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

          // Services Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return ServiceCard(service: services[index]);
                },
                childCount: services.length,
              ),
            ),
          ),

          // Call to Action Section
          const SliverToBoxAdapter(
            child: SizedBox(height: 40),
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF7c4c9d),
                    Color(0xFFe3a446),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.contact_support,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Ready to Get Started?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Let\'s discuss how we can help transform your business with our expert services',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Get.snackbar(
                        'Contact Us',
                        'We\'ll get back to you soon!',
                        backgroundColor: Colors.white,
                        colorText: const Color(0xFF7c4c9d),
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF7c4c9d),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Get In Touch',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 40),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              service.color.withOpacity(0.1),
              service.color.withOpacity(0.05),
            ],
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Get.bottomSheet(
                ServiceDetailsBottomSheet(service: service),
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                isScrollControlled: true,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: service.color.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      service.icon,
                      color: service.color,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    service.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Text(
                      service.description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF666666),
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        'Learn More',
                        style: TextStyle(
                          fontSize: 12,
                          color: service.color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward,
                        color: service.color,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceDetailsBottomSheet extends StatelessWidget {
  final Service service;

  const ServiceDetailsBottomSheet({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: service.color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  service.icon,
                  color: service.color,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  service.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            service.description,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF666666),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Key Features:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: service.features.map((feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: service.color,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    feature,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF555555),
                    ),
                  ),
                ],
              ),
            )).toList(),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                'Service Selected',
                'We\'ll contact you about ${service.title}',
                backgroundColor: service.color,
                colorText: Colors.white,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: service.color,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              'Get This Service',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Service {
  final String title;
  final String description;
  final IconData icon;
  final List<String> features;
  final Color color;

  Service({
    required this.title,
    required this.description,
    required this.icon,
    required this.features,
    required this.color,
  });
}

// Controller for GetX (if needed for future enhancements)
class ServicesController extends GetxController {
  // Add your controller logic here if needed
}