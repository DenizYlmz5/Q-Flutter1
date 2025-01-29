import 'package:flutter/material.dart';
import 'core/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/screens/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
/*void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter widget'larını başlat
  runApp(const MyApp());
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeNotifier = ThemeNotifier();
  await themeNotifier.loadTheme();
  runApp(
    ChangeNotifierProvider(
      create: (context) => themeNotifier,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp.router(
      title: 'Flutter App',
      theme: themeNotifier.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      routerConfig: router, // go_router yapılandırmamızı kullan
      debugShowCheckedModeBanner: false, // Debug bandını kaldır
    );
  }
}

class ThemeNotifier extends ChangeNotifier {
  bool isDarkMode = false;

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('darkMode') ?? false;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    isDarkMode = !isDarkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', isDarkMode);
    notifyListeners();
  }
}
