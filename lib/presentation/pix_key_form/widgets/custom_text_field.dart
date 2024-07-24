import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool autofocus;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.onTap,
    this.readOnly = false,
    this.inputFormatters,
    this.validator,
    this.autofocus = false,
    this.focusNode,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return BaseWidgetBuilder(
      builder: (context, textTheme, colorScheme, _, __) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: textTheme.titleMedium,
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            focusNode: focusNode,
            autofocus: autofocus,
            textInputAction: textInputAction,
            inputFormatters: inputFormatters,
            validator: validator,
            onTap: onTap ?? () {},
            readOnly: readOnly,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              filled: true,
              fillColor: colorScheme.secondaryContainer.withAlpha(100),
              hintText: hintText,
              hintStyle: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              suffixIcon: suffixIcon,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
