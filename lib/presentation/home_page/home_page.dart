import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:technocare_app/presentation/home_page/widgets/home_page_widgets.dart';

import '../bottom_nav_page/bottom_nav_page.dart';
import 'controller/home_page_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeWidgets.buildAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HomeWidgets.buildPromotionalBanner(),
            const SizedBox(height: 20),
            HomeWidgets.buildTrendingProductsHeader(),
            HomeWidgets.buildTrendingProductsList(),
            const SizedBox(height: 20),
            HomeWidgets.buildProductsHeader(),
            HomeWidgets.buildCategorySection(),
            const SizedBox(height: 20),
            HomeWidgets.buildForYouHeader(),
            const SizedBox(height: 15),
            HomeWidgets.buildCaseStudyItem(
              day: 15,
              month: 'MAR',
              category: 'Web Development',
              title: 'E-commerce Platform Redesign',
              description: 'Complete redesign of a retail e-commerce platform with improved UX and 40% faster load times...',
              rating: 4.8,
              technologies: ['React', 'Node.js', 'MongoDB'],
            ),
            HomeWidgets.buildCaseStudyItem(
              day: 22,
              month: 'APR',
              category: 'Mobile App',
              title: 'Food Delivery App Development',
              description: 'Built a scalable food delivery app with real-time tracking and secure payment integration...',
              rating: 4.9,
              technologies: ['Flutter', 'Firebase', 'Stripe'],
            ),
            HomeWidgets.buildCaseStudyItem(
              day: 5,
              month: 'MAY',
              category: 'UI/UX Design',
              title: 'Banking Dashboard Redesign',
              description: 'Redesigned banking dashboard with improved user experience and accessibility features...',
              rating: 4.7,
              technologies: ['Figma', 'Adobe XD', 'Prototyping'],
            ),
            HomeWidgets.buildCaseStudyItem(
              day: 18,
              month: 'JUN',
              category: 'Cloud Solution',
              title: 'AWS Migration Project',
              description: 'Successfully migrated legacy systems to AWS cloud infrastructure with 99.9% uptime...',
              rating: 4.8,
              technologies: ['AWS', 'Docker', 'Kubernetes'],
            ),
            const SizedBox(height: 30),

            // Our Services Section
            HomeWidgets.buildServicesHeader(),
            const SizedBox(height: 15),
            HomeWidgets.buildServicesSection(),
            const SizedBox(height: 30),

            // Footer Section
            HomeWidgets.buildFooterSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}