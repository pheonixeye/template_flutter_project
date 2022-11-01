import 'package:go_router/go_router.dart';
import 'package:khalednabil_cpanel/r_first_screen/first_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return FirstScreen(
          key: state.pageKey,
        );
      },
      routes: const [],
    ),
  ],
);
