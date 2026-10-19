import 'package:material_ui/material_ui.dart';

import '../../../core/shared/app_assets.dart';
import '../../../core/theme/theme.dart';

class const Emblem({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: CircleBorder(),
        color: AppColors.white,
        shadows: AppShadows.md,
      ),
      width: 88,
      height: 88,
      alignment: .center,
      child: SizedBox(
        width: 54,
        height: 64,
        child: Image.asset(AppAssets.images.logoFifaWc26, fit: .contain),
      ),
    );
  }
}
