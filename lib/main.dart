import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/app_theme.dart';
import 'package:flutter_boilerplate/utils/strings.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'di/service_locator.dart';
import 'di/service_locator.dart' as di;
import 'feature/landing/splash_screen.dart';
import 'storage/shared_pref_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setUpServiceLocator();
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.app_name,
      theme: AppTheme.define(),
      home: const SplashScreen(),
    );
  }
}
