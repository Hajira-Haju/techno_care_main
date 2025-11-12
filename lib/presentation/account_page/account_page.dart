import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_screen/login_screen.dart';
import 'controller/account_controller.dart';
import 'model/account_data.dart';
import 'model/account_model.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  final AccountController authController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoggedIn = authController.isLoggedIn.value;
      final user = authController.currentUser.value;

      return Scaffold(
        backgroundColor: const Color(0xFFf8f9fa),
        floatingActionButton: !isLoggedIn
            ? FloatingActionButton.extended(
          onPressed: () {
            Get.to(() => LoginScreen());
          },
          backgroundColor: const Color(0xFF7c4c9d),
          foregroundColor: Colors.white,
          icon: const Icon(Icons.login),
          label: const Text('Login'),
          elevation: 8,
        )
            : null,
        body: CustomScrollView(
          slivers: [
            // Header Section
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  isLoggedIn ? 'My Account' : 'Account',
                  style: const TextStyle(
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
                      colors: [Color(0xFF7c4c9d), Color(0xFFe3a446)],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isLoggedIn ? Icons.person : Icons.person_outline,
                        size: 60,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        isLoggedIn
                            ? 'Manage your account and preferences'
                            : 'Access your personalized dashboard',
                        style: const TextStyle(
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

            // Profile Section (Only show when logged in)
            if (isLoggedIn)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      // Profile Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Profile Image - Using network image for logged in user
                            _ProfileImageWidget(
                              profileImage: user?.profileImage,
                              isLoggedIn: isLoggedIn,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              user?.name ?? 'User',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF333333),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              user?.email ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF666666),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              user?.phone ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF666666),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Support Section (Show different support options based on login status)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Support',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: (isLoggedIn ? loggedInSupportOptions : guestSupportOptions)
                            .map((option) => _buildSupportItem(option))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Logout Button (Only show when logged in)
            if (isLoggedIn)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _showLogoutConfirmation(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout, size: 20),
                        SizedBox(width: 10),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      );
    });
  }

  Widget _buildSupportItem(SupportOption option) {
    return ListTile(
      leading: Icon(option.icon, color: const Color(0xFF7c4c9d)),
      title: Text(
        option.title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color(0xFF333333),
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Color(0xFF7c4c9d)),
      onTap: () {
        Get.snackbar(
          option.title,
          '${option.title} support coming soon!',
          backgroundColor: const Color(0xFFe3a446),
          colorText: Colors.white,
        );
      },
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
                authController.logout();
                Get.snackbar(
                  'Logged Out',
                  'You have been successfully logged out',
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}

// Updated Profile Image Widget for network images
class _ProfileImageWidget extends StatefulWidget {
  final String? profileImage;
  final bool isLoggedIn;

  const _ProfileImageWidget({
    required this.profileImage,
    required this.isLoggedIn,
  });

  @override
  State<_ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<_ProfileImageWidget> {
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() {
    if (widget.isLoggedIn && widget.profileImage != null) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      });
    } else {
      _isLoading = false;
    }
  }

  @override
  void didUpdateWidget(covariant _ProfileImageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.profileImage != widget.profileImage ||
        oldWidget.isLoggedIn != widget.isLoggedIn) {
      setState(() {
        _isLoading = true;
        _hasError = false;
      });
      _loadImage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF7c4c9d), width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipOval(
        child: !widget.isLoggedIn
            ? _buildGuestPlaceholder()
            : _isLoading
            ? _buildLoadingPlaceholder()
            : _hasError || widget.profileImage == null
            ? _buildErrorPlaceholder()
            : Image.network(
          widget.profileImage!,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                setState(() {
                  _hasError = true;
                });
              }
            });
            return _buildErrorPlaceholder();
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return _buildLoadingPlaceholder();
          },
        ),
      ),
    );
  }

  Widget _buildGuestPlaceholder() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.grey, Color(0xFFCCCCCC)],
        ),
      ),
      child: const Icon(Icons.person_outline, size: 50, color: Colors.white),
    );
  }

  Widget _buildLoadingPlaceholder() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF7c4c9d), Color(0xFFe3a446)],
        ),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }

  Widget _buildErrorPlaceholder() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF7c4c9d), Color(0xFFe3a446)],
        ),
      ),
      child: const Icon(Icons.person, size: 50, color: Colors.white),
    );
  }
}






