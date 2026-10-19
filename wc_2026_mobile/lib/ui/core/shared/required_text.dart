import 'package:material_ui/material_ui.dart';

import '../theme/theme.dart';

class const RequiredText({
  super.key,
  required final String text,
  final TextStyle? style,
  final bool required = true,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!required) return Text(text, style: style);

    return Text.rich(
      TextSpan(
        text: text,
        style: style,
        children: const [
          TextSpan(
            text: ' *',
            style: TextStyle(color: AppColors.red),
          ),
        ],
      ),
    );
  }
}
