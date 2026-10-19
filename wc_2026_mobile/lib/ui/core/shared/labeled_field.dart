import 'package:material_ui/material_ui.dart';

import '../theme/theme.dart';
import './required_text.dart';

class const LabeledField({
  super.key,
  required final String label,
  final String? hint,
  final TextInputType? keyboardType,
  final TextEditingController? controller,
  final FormFieldValidator<String>? validator,
  final TextInputAction? inputAction,
  final TextCapitalization textCapitalization = .none,
  final bool obscureText = false,
  final bool required = false,
  final AutovalidateMode validateMode = .onUserInteraction,
}) extends StatefulWidget {
  const LabeledField.password({
    required String label,
    required String hint,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
    TextInputAction? inputAction,
    bool required = false,
    AutovalidateMode validateMode = .onUserInteraction,
    Key? key,
  }) : this(
         label: label,
         hint: hint,
         controller: controller,
         validator: validator,
         inputAction: inputAction,
         required: required,
         validateMode: validateMode,
         obscureText: true,
         key: key,
       );

  @override
  LabeledFieldState createState() => LabeledFieldState();
}

class LabeledFieldState extends State<LabeledField> {
  late final _obscured = ValueNotifier<bool>(widget.obscureText);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 6,
      children: [
        RequiredText(text: widget.label, required: widget.required),
        ValueListenableBuilder(
          valueListenable: _obscured,
          builder: (_, obscured, _) {
            return TextFormField(
              decoration: InputDecoration(
                hintText: widget.hint,
                suffixIcon: widget.obscureText
                    ? IconButton(
                        icon: Icon(
                          obscured ? Icons.visibility : Icons.visibility_off,
                          size: 18, color: AppColors.grayText,
                        ),
                        tooltip: obscured ? 'Mostrar senha' : 'Ocultar senha',
                        onPressed: () {
                          _obscured.value = !obscured;
                        },
                      )
                    : null,
              ),
              controller: widget.controller,
              validator: widget.validator,
              autovalidateMode: widget.validateMode,
              keyboardType: widget.keyboardType,
              textInputAction: widget.inputAction,
              textCapitalization: widget.textCapitalization,
              obscureText: obscured,
            );
          },
        ),
      ],
    );
  }
}
