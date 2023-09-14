import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khalednabil_cpanel/exports/exports.dart';
import 'package:khalednabil_cpanel/providers/px_locale.dart';
import 'package:khalednabil_cpanel/providers/px_theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  _switchLanguage(BuildContext context) {
    final location =
        GoRouter.of(context).routeInformationProvider.value.uri.path;
    final paths = location.split(RegExp('/'));
    paths.removeAt(0);
    paths.removeAt(0);
    final whereToGo = paths.join('/');
    if (context.read<PxLocale>().locale.languageCode == 'en') {
      GoRouter.of(context).go('/ar/$whereToGo');
    } else {
      GoRouter.of(context).go('/en/$whereToGo');
    }
  }

  _switchTheme(BuildContext context) {
    context.read<PxTheme>().switchTheme(context);
  }

  _refreshThemes(BuildContext context) {
    context.read<PxTheme>().refreshThemes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.loc.home),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                heroTag: "lang-btn",
                onPressed: () {
                  _switchLanguage(context);
                },
                child: Text(
                    context.watch<PxLocale>().locale.languageCode == "en"
                        ? "ar"
                        : "en"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                heroTag: "theme-btn",
                onPressed: () {
                  _switchTheme(context);
                },
                child: Icon(
                  context.watch<PxTheme>().mode == ThemeMode.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  color: context.watch<PxTheme>().mode == ThemeMode.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                heroTag: "theme-refresh-btn",
                onPressed: () {
                  _refreshThemes(context);
                },
                child: const Icon(Icons.refresh),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
