import 'package:flutter/material.dart';
import 'package:nuclone/app/feature/home/presentation/pages/home_page.dart';
import 'app/core/dependency_injection/injector.dart';
import 'app/core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjector();

  runApp(const NuCloneApp());
}

class NuCloneApp extends StatelessWidget {
  const NuCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NuClone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
