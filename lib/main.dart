import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'pages/splash/splash_app.dart';
import 'theme/theme_app.dart';
import 'pages/providers/theme_provider.dart';
import 'pages/providers/locale_provider.dart';
import 'pages/settings/settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa providers y carga preferencias antes de runApp
  final themeProvider = ThemeProvider();
  await themeProvider.loadThemeFromPrefs();

  final localeProvider = LocaleProvider();
  await localeProvider.loadLocaleFromPrefs();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>.value(value: themeProvider),
        ChangeNotifierProvider<LocaleProvider>.value(value: localeProvider),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProv = Provider.of<ThemeProvider>(context);
    final localeProv = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      title: 'flutter App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProv.themeMode,
      locale: localeProv.locale,
      supportedLocales: const [Locale('es'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // Mantén tu Splash como home (y desde el splash o el home puedes navegar a /settings)
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/settings': (_) => const SettingsPage(),
        // añade aquí otras rutas si quieres
      },
    );
  }
}
