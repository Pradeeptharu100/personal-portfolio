import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'features/home/providers/home_provider.dart';
import 'features/routes/app_routes.dart';
import 'features/terminal/providers/terminal_provider.dart';
import 'features/themes/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TerminalProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(1920, 1080),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Pradeep Tharu - Flutter Developer',
            debugShowCheckedModeBanner: false,
            theme: AppThemes.darkTheme,
            routerConfig: AppRoutes.router,
          );
        },
      ),
    );
  }
}
