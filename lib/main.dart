import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:khalednabil_cpanel/core/localization/app_localizations.dart';
import 'package:khalednabil_cpanel/providers/px_locale.dart';
import 'package:khalednabil_cpanel/providers/providers.dart';
import 'package:khalednabil_cpanel/providers/px_theme.dart';
import 'package:khalednabil_cpanel/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      builder: (context, child) {
        return Consumer<PxLocale>(
          builder: (context, l, c) {
            return Consumer<PxTheme>(
              builder: (context, t, c) {
                return MaterialApp.router(
                  title: 'PROJECT_NAME',
                  debugShowCheckedModeBanner: false,
                  theme: t.lightTheme,
                  darkTheme: t.darkTheme,
                  themeMode: t.mode,
                  routeInformationProvider: router.routeInformationProvider,
                  routeInformationParser: router.routeInformationParser,
                  routerDelegate: router.routerDelegate,
                  builder: (context, child) {
                    child = EasyLoading.init()(context, child);

                    return child;
                  },
                  locale: l.locale,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                );
              },
            );
          },
        );
      },
    );
  }
}
