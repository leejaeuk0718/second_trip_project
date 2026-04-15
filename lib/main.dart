import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loging/screens/list/accommodation_list_screen.dart';
import 'loging/theme/app_theme.dart';
import 'providers/accommodation_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // .env 파일 로드 (API 키 가져오기)
  await dotenv.load(fileName: '.env');

  // SharedPreferences 초기화 (찜 목록 저장용)
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '숙소 찾기',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const AccommodationListScreen(),
    );
  }
}