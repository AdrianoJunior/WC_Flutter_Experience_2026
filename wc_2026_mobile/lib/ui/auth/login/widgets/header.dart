import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';

import '../../../core/shared/app_assets.dart';
import '../../../core/theme/theme.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 320,
      child: Stack(
        fit: .expand,
        children: [
          SvgPicture.asset(
            AppAssets.patterns.paniniArcHeaderLoginSvg,
            fit: .cover,
            alignment: .topCenter,
          ),
          Align(
            alignment: .bottomCenter,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: .topCenter,
                  end: .bottomCenter,
                  colors: [AppColors.cream.withValues(alpha: 0), AppColors.cream],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
