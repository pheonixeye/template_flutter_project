import 'package:flutter/material.dart';
import 'package:khalednabil_cpanel/core/localization/app_localizations.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}
