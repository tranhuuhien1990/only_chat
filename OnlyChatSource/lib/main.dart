import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

// Lưu ý: Bạn cần chạy `flutterfire configure` để tạo file này
// Hoặc tự cấu hình Firebase cho từng nền tảng.
// import 'firebase_options.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Khởi tạo Firebase
  // Nếu đã chạy flutterfire configure, hãy bỏ comment dòng dưới và import firebase_options.dart
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  // Tạm thời khởi tạo mặc định (sẽ báo lỗi nếu chưa cấu hình native)
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Firebase initialization error: $e");
    print("Vui lòng cấu hình Firebase cho project của bạn.");
  }

  runApp(
    const ProviderScope(
      child: OnlyChatApp(),
    ),
  );
}

class OnlyChatApp extends ConsumerWidget {
  const OnlyChatApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'OnlyChat',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
