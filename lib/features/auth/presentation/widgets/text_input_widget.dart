import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';

class TextInputWidget extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final String? Function(String?)? validator;

  const TextInputWidget({
    super.key,
    required this.hint,
    required this.iconData,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppTheme.inverseTextColor,
        hintText: hint,
        hintStyle: TextStyle(color: AppTheme.lightTextColor),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        prefixIcon: Icon(iconData, color: AppTheme.lightTextColor),
      ),
      validator: validator,
    );
  }
}
