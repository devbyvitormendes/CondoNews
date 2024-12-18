import 'package:condo_news/presenter/ui/condo_news_nav_global_key.dart';
import 'package:condo_news/presenter/ui/screens/home_screen.dart';
import 'package:condo_news/presenter/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CondoNewsApp extends StatelessWidget {
  const CondoNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Condo News',
          // theme: FamplayTheme.themeData,
          navigatorKey: CondoNewsNavGlobalKey.instance.navKey,
          routes: {
            '/': (_) => const SplashScreen(),
            // '/auth/login': (_) => const LoginScreen(),
            // '/auth/register/user': (_) => const UserRegisterScreen(),
            '/home': (_) => const HomeScreen(),
          },
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('pt', 'BR')],
          locale: const Locale('pt', 'BR'),
        
    );
  }
}
