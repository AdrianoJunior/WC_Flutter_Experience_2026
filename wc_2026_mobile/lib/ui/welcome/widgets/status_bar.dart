import 'package:material_ui/material_ui.dart';

import '../../core/theme/theme.dart';

class const StatusBar({super.key}) extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.ink,
        borderRadius: AppDimens.borderRadiusMd,
      ),
      child: Row(
        children: [
          Expanded(child: _Stats('48', 'SELEÇÕES')),
          _StatDivider(),
          Expanded(child: _Stats('980', 'FIGURINHAS')),
          _StatDivider(),
          Expanded(child: _Stats('16', 'CIDADES')),
        ],
      ),
    );
  }
}

class const _Stats(final String value, final String label) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      mainAxisSize: .min,
      children: [
        Text(
          value,
          style: AppTextStyles.heading.copyWith(color: AppColors.gold),
        ),
        Text(
          label,
          style: AppTextStyles.overline.copyWith(color: AppColors.cream),
        ),
      ],
    );
  }
}


class const _StatDivider() extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      color: AppColors.white.withValues(alpha: 0.15),
      thickness: 1,
      indent: 15,
      endIndent: 15,
    );
  }
}
