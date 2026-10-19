import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_colors.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_dimens.dart';

import '../theme/app_shadows.dart';
import '../theme/app_text_styles.dart';
import 'app_assets.dart';

class const LogoCard({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimens.borderRadiusLg,
        boxShadow: AppShadows.lg,
      ),
      child: Stack(
        fit: .expand,
        children: [
          Align(
            alignment: .topLeft,
            child: SizedBox(height: 10, width: 10, child: _CornerMark(0)),
          ),
          Align(
            alignment: .topRight,
            child: SizedBox(height: 10, width: 10, child: _CornerMark(1)),
          ),
          Align(
            alignment: .bottomLeft,
            child: SizedBox(height: 10, width: 10, child: _CornerMark(3)),
          ),
          Align(
            alignment: .bottomRight,
            child: SizedBox(height: 10, width: 10, child: _CornerMark(2)),
          ),

          Column(
            children: [
              SizedBox(height: 20),
              Text('— FIFA WORLD CUP 26™ —', style: AppTextStyles.overline),
              SizedBox(height: 3),
              Text(
                'PANINI STICKER ALBUM',
                style: AppTextStyles.overline.copyWith(
                  color: AppColors.grayText,
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 140,
                child: Image.asset(AppAssets.images.logoFifaWc26, fit: .cover),
              ),
              SizedBox(height: 20),
              Text('USA · CANADÁ · MÉXICO', style: AppTextStyles.overline),
              SizedBox(height: 10),
              Text(
                '11 JUN — 19 JUL 2026',
                style: AppTextStyles.overline.copyWith(
                  color: AppColors.grayText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class const _CornerMark(final int quarterTurns) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.ink, width: 1.5),
            left: BorderSide(color: AppColors.ink, width: 1.5),
          ),
        ),
      ),
    );
  }
}
