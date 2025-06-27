import 'package:get/get.dart';
import 'package:ideas_and_concepts_profile/modules/profile/bindings/profile_binding.dart';
import 'package:ideas_and_concepts_profile/modules/profile/views/edit_profile_screen.dart';
import 'package:ideas_and_concepts_profile/modules/profile/views/my_orders_screen.dart';
import 'package:ideas_and_concepts_profile/modules/profile/views/profile_screen.dart';
import 'package:ideas_and_concepts_profile/routes/app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.profile;

  static final routes = [
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(name: AppRoutes.myOrders, page: () => const MyOrdersScreen()),
  ];
}
