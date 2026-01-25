import 'package:get/get.dart';

import 'package:darul_rahman_app/core/middleware/auth_middleware.dart';
import 'package:darul_rahman_app/routes/app_routes.dart';

import 'package:darul_rahman_app/features/auth/presentation/pages/login_page.dart';
import 'package:darul_rahman_app/features/home/home_page.dart';
import 'package:darul_rahman_app/features/merchant/presentation/bindings/merchant_binding.dart';
import 'package:darul_rahman_app/features/merchant/presentation/pages/merchant_form_page.dart';
import 'package:darul_rahman_app/features/merchant/presentation/pages/merchant_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: MerchantBinding(),
    ),
    GetPage(
      name: AppRoutes.merchant,
      page: () => const MerchantPage(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: AppRoutes.fromMerchant,
      page: () => MerchantFormPage(),
      binding: MerchantBinding(),
    ),
  ];
}
