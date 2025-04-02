import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:rock_scanner/screens/account.dart';
import 'package:rock_scanner/screens/home_screen.dart';
import 'package:rock_scanner/service/dependency_injection.dart';
import 'package:rock_scanner/theme/light_dark_theme.dart';
import 'package:rock_scanner/viewmodels/account_viewmodel.dart';
import 'package:rock_scanner/viewmodels/login_viewmodel.dart';
import 'package:rock_scanner/viewmodels/register_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter is ready before Firebase
  await dotenv.load(fileName: "assets/.env"); // Load environment variables
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => AccountView()),
      ],
      child: const MyApp(),
    ),
  );
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(ThemeData.dark()),
      home: HomeScreen(),
    );
  }
}
