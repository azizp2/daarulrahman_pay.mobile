import 'package:darul_rahman_app/core/storage/auth_storage.dart';
import 'package:darul_rahman_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!AuthStorage.isLoggedIn) {
      return const RouteSettings(name: AppRoutes.login);
    }

    return null;
  }
}
