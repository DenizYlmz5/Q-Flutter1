//uygulamada sayfaları ve navigasyon işlemlerini burada tanımlıcaz
import 'package:flutter_app/main.dart';
import 'package:flutter_app/screens/favori_screen.dart';
import 'package:flutter_app/screens/profile_screen.dart';
import 'package:flutter_app/screens/search_screen.dart';
import 'package:flutter_app/screens/settings_screen.dart';
import 'package:flutter_app/screens/voice_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';

// Router yapılandırması
final router = GoRouter(
  initialLocation: '/', // Başlangıç rotası
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(path: '/Settings', builder: (context, state) => SettingsPage()),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (contex, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/voice',
      builder: (contex, state) => const VoiceScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (contex, state) => const SearchScreen(),
    )
  ],
);
