import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rock_scanner/model/igneous_model.dart';
import 'package:rock_scanner/model/metamorphic_model.dart';
import 'package:rock_scanner/model/mineral_model.dart';
import 'package:rock_scanner/model/save_history.dart';
import 'package:rock_scanner/screens/account.dart';
import 'package:rock_scanner/screens/home_screen.dart';
import 'package:rock_scanner/service/dependency_injection.dart';
import 'package:rock_scanner/theme/light_dark_theme.dart';
import 'package:rock_scanner/viewmodels/account_viewmodel.dart';
import 'package:rock_scanner/viewmodels/details_viewmodel.dart';
import 'package:rock_scanner/viewmodels/loading_provide.dart';
import 'package:rock_scanner/viewmodels/login_viewmodel.dart';
import 'package:rock_scanner/viewmodels/register_viewmodel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rock_scanner/widgets/details/mineral_rock.dart';

import 'model/sedimeted_model.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter is ready before Firebase
  await dotenv.load(fileName: "assets/.env"); // Load environment variables
  await Firebase.initializeApp(); // Initialize Firebase
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.initFlutter();
  Hive.registerAdapter(SedmentedRockModelAdapter());
  Hive.registerAdapter(MetamorphicRockModelAdapter());
  Hive.registerAdapter(IgneousRockModelAdapter());
  Hive.registerAdapter(MineralRockModelAdapter());
  Hive.registerAdapter(SaveHistoryAdapter());

  await Hive.openBox<SedmentedRockModel>('rocks');
  await Hive.openBox<MetamorphicRockModel>('MetamorphicRocks');
  await Hive.openBox<IgneousRockModel>('IgneousRocks');
  await Hive.openBox<MineralRockModel>('MineralRocks');
  await Hive.openBox<SaveHistory>('History');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => AccountView()),
        ChangeNotifierProvider(create: (_) => DetailsView()),
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
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
