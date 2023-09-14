import 'package:khalednabil_cpanel/providers/px_locale.dart';
import 'package:khalednabil_cpanel/providers/px_theme.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => PxLocale()),
  ChangeNotifierProvider(create: (context) => PxTheme()),
];
