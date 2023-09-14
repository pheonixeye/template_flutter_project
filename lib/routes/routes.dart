import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khalednabil_cpanel/providers/px_locale.dart';
import 'package:khalednabil_cpanel/shell_route/main_shell_route.dart';
import 'package:khalednabil_cpanel/views/home_page/home_page.dart';
import 'package:khalednabil_cpanel/views/loading_screen/loading_screen.dart';
import 'package:provider/provider.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  refreshListenable: PxLocale(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return MainShellRoute(
          key: state.pageKey,
        );
      },
      redirect: (context, state) {
        if (state.fullPath == "/") {
          return "/en";
        }
        return null;
      },
      routes: [
        GoRoute(
          path: ":lang",
          builder: (context, state) {
            final lang = state.pathParameters["lang"] as String;
            context.read<PxLocale>().setLang(lang);
            final langKey = ValueKey(lang);
            return LoadingScreen(
              key: langKey,
            );
          },
          routes: [
            GoRoute(
              path: "home",
              name: "homePage",
              builder: (context, state) {
                return HomePage(
                  key: state.pageKey,
                );
              },
              routes: const [
                //TODO: Add subroutes to homepage
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
