import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/routes/routes.dart';
import 'components/theme/theme.dart';
import 'components/theme/theme_manger.dart';
import 'services/navigation_service.dart';
import 'services/network_service.dart';
import 'models/user/user_repo.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  // Global Init
  WidgetsFlutterBinding.ensureInitialized();

  // Init EasyLocalization
  await EasyLocalization.ensureInitialized();

  // Init navigation services
  await NavigationService.init();

  // Init Networkservices
  NetworkService.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeManegerProvider>(
          create: (_) => ThemeManegerProvider(),
        ),
      ],
      child: Consumer<ThemeManegerProvider>(
        builder: (context, theme, _) {
          return StreamProvider<User?>.value(
            value: UserRepo().userData,
            initialData: null,
            child: MaterialApp(
              routes: Routes.routes,
              initialRoute: Routes.splashRoute,
              scaffoldMessengerKey: scaffoldMessengerKey,
              navigatorKey: NavigationService.navKey,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: theme.themeMode,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
            ),
          );
        },
      ),
    );
  }
}
