import 'package:flutter/material.dart';
import 'package:to_do_list_squad/core/routes/app_routes.dart';
import 'package:to_do_list_squad/core/routes/navigation_service.dart';
import 'package:to_do_list_squad/core/utils/sqd_color.dart';

import 'src/to_do_list/presentation/screens/to_do_list_page.dart';

void main() {
  locator.registerSingleton(NavigationService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const ToDoListPage(),
      },
      theme: ThemeData(
        primaryColor: SQDColor.primary,
        appBarTheme: const AppBarTheme(
          backgroundColor: SQDColor.primary,
          elevation: 0,
        ),
      ),
    );
  }
}
