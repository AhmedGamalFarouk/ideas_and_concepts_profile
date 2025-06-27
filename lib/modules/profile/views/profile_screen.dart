import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideas_and_concepts_profile/core/constants/app_colors.dart';
import 'package:ideas_and_concepts_profile/modules/profile/controllers/profile_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ideas_and_concepts_profile/routes/app_routes.dart';

import '../../../data/models/user_model.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(color: AppColors.textBlack),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.user.value == null) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.user.value == null) {
          return const Center(child: Text('User not found.'));
        }
        final user = controller.user.value!;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              _buildProfileHeader(user),
              const SizedBox(height: 30),
              _buildActionTabs(),
              const SizedBox(height: 30),
              _buildProfileMenuList(),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildProfileHeader(UserModel user) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: AppColors.brownRosy,
          backgroundImage: user.profileImageUrl.isNotEmpty
              ? CachedNetworkImageProvider(user.profileImageUrl)
              : null,
          child: user.profileImageUrl.isEmpty
              ? const Icon(Icons.person, size: 50, color: Colors.white)
              : null,
        ),
        const SizedBox(height: 16),
        Text(
          user.name,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'ID: ${user.id}',
          style: const TextStyle(fontSize: 14, color: AppColors.grey),
        ),
      ],
    );
  }

  Widget _buildActionTabs() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.beige,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _actionTab(label: 'Profile', isSelected: true),
          _actionTab(label: 'Wishlist', isSelected: false, onTap: () {}),
          _actionTab(
            label: 'My Orders',
            isSelected: false,
            onTap: () => Get.toNamed(AppRoutes.myOrders),
          ),
        ],
      ),
    );
  }

  Widget _actionTab({
    required String label,
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: isSelected
              ? BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                    ),
                  ],
                )
              : null,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: AppColors.textBlack,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileMenuList() {
    return Column(
      children: [
        _menuListItem(
          Icons.edit_outlined,
          'Edit Profile',
          () => Get.toNamed(AppRoutes.editProfile),
        ),
        _menuListItem(Icons.privacy_tip_outlined, 'Privacy Policy', () {}),
        _menuListItem(Icons.payment_outlined, 'Payment Methods', () {}),
        _menuListItem(Icons.notifications_outlined, 'Notification', () {}),
        _menuListItem(Icons.settings_outlined, 'Settings', () {}),
        _menuListItem(Icons.help_outline, 'Help', () {}),
        _menuListItem(
          Icons.logout,
          'Logout',
          () {},
          color: AppColors.terracotta,
        ),
      ],
    );
  }

  Widget _menuListItem(
    IconData icon,
    String title,
    VoidCallback onTap, {
    Color color = AppColors.textBlack,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
