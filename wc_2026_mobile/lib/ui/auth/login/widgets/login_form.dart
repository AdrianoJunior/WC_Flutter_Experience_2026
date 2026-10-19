import 'package:material_ui/material_ui.dart';
import 'package:validatorless/validatorless.dart';
import 'package:wc_2026_mobile/ui/core/shared/labeled_field.dart';

import '../../../core/theme/theme.dart';

class const LoginForm({
  super.key,
  required final TextEditingController emailController,
  required final TextEditingController passwordController,
  final VoidCallback? onSubmit,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .fromLTRB(30, 32, 30, 26),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimens.borderRadiusXl,
        boxShadow: AppShadows.lg,
      ),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Container(
            padding: .symmetric(horizontal: 18, vertical: 9),
            decoration: ShapeDecoration(
              shape: StadiumBorder(),
              color: AppColors.red,
            ),
            child: Text(
              'ENTRAR',
              style: AppTextStyles.overline.copyWith(color: AppColors.white),
            ),
          ),
          SizedBox(height: 16),
          Text('BEM-VINDO', style: AppTextStyles.display),
          Text(
            'DE VOLTA.',
            style: AppTextStyles.display.copyWith(color: AppColors.red),
          ),
          SizedBox(height: 8),
          Text(
            'Continue montando seu álbum oficial.',
            style: AppTextStyles.body.copyWith(color: AppColors.grayText),
          ),
          SizedBox(height: 24),
          LabeledField(
            label: 'E-MAIL',
            hint: 'voce@exemplo.com',
            keyboardType: .emailAddress,
            inputAction: .next,
            required: true,
            controller: emailController,
            validator: Validatorless.required('E-mail obrigatório'),
          ),
          SizedBox(height: 16),
          LabeledField.password(
            label: 'SENHA',
            hint: '••••••••',
            required: true,
            inputAction: .done,
            controller: passwordController,
            validator: Validatorless.required('Senha obrigatória'),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: .zero,
              textStyle: AppTextStyles.caption,
            ),
            child: Text('Esqueci minha senha →'),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onSubmit,
              style: AppTheme.darkButton,
              child: Text('ENTRAR NO ÁLBUM  →'),
            ),
          ),
        ],
      ),
    );
  }
}
