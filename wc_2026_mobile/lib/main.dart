import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:wc_2026_mobile/config/app_bindings.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_theme.dart';

import 'core/logging/app_logger.dart';
import 'core/logging/log_output.dart';

void main() {
  AppLogger.configure(
    level: kDebugMode ? Level.ALL : Level.INFO,
    outputs: const [ConsoleLogOutput()],
  );
  runApp(const AppBindings(child: MainApp()));
}

class const MainApp({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light,
      builder: (context, child) {
        // ignore: deprecated_member_use
        return MaterialUiCompatibilityBridge(child: child!);
      },
      routerConfig: context.read<GoRouter>(),
    );
  }
}
