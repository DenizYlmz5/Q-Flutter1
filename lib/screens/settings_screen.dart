import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeMode = await ThemeManager.getThemeMode();
  runApp(MyApp(themeMode: themeMode));
}

class MyApp extends StatefulWidget {
  final ThemeMode themeMode;
  const MyApp({super.key, required this.themeMode});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _themeMode = widget.themeMode;
  }

  void _toggleTheme() async {
    final newTheme =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    setState(() => _themeMode = newTheme);
    await ThemeManager.saveThemeMode(newTheme);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gece Gündüz Modu',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: HomeScreen(toggleTheme: _toggleTheme),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  const HomeScreen({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gece Gündüz Modu")),
      body: Center(
        child: ElevatedButton(
          onPressed: toggleTheme,
          child: const Text("Modu Değiştir"),
        ),
      ),
    );
  }
}

class ThemeManager {
  static const String _key = "theme_mode";

  static Future<void> saveThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, mode == ThemeMode.dark ? 1 : 0);
  }

  static Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_key) ?? 0;
    return themeIndex == 1 ? ThemeMode.dark : ThemeMode.light;
  }
}
