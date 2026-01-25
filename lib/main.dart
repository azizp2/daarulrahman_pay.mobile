import 'package:darul_rahman_app/routes/app_pages.dart';
import 'package:darul_rahman_app/theme/app_theme.dart';
import 'package:darul_rahman_app/widgets/global_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:darul_rahman_app/di/injector.dart';
import 'package:darul_rahman_app/routes/app_routes.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Injector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.light(),
      debugShowCheckedModeBanner: false,
      title: 'GetX Auth App',
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            const GlobalLoading(),
          ],
        );
      },
      initialRoute: AppRoutes.home,
      getPages: AppPages.routes,
    );
  }
}
