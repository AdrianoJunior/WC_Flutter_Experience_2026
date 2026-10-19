import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/routing/routes.dart';
import 'package:wc_2026_mobile/ui/welcome/widgets/status_bar.dart';

import '../core/shared/app_assets.dart';
import '../core/shared/licensed_badge.dart';
import '../core/shared/logo_card.dart';
import '../core/theme/theme.dart';

class const WelcomeScreen({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: .expand,
        children: [
          SvgPicture.asset(
            AppAssets.patterns.paniniArcSplashSvg,
            fit: BoxFit.cover,
          ),
          ColoredBox(color: AppColors.cream.withValues(alpha: 0.35)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.paddingHorizontal,
              ),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  LicensedBadge(),
                  SizedBox(height: 40),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 380, maxWidth: 290),
                    child: LogoCard(),
                  ),
                  SizedBox(height: 36),
                  Text('SEU ÁLBUM', style: AppTextStyles.display),
                  Text(
                    'OFICIAL.',
                    style: AppTextStyles.display.copyWith(color: AppColors.red),
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 72, child: StatusBar()),
                  SizedBox(height: 20),
                  FilledButton(
                    onPressed: () {
                      context.go(Routes.login);
                    },
                    child: Text('COMEÇAR A COLECIONAR  →'),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.ink,
                      textStyle: AppTextStyles.body,
                    ),
                    onPressed: () {},
                    child: Text('Já tenho conta · Entrar'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}