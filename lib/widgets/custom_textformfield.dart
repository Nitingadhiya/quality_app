import 'dart:ffi';

import 'package:quality_app/packages/config_package.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController container;
  final String hint;
  final String hintText;
  final String labelText;
  final double radius;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextStyle style;
  final bool obscureText;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final double padding;
  final Color fillColor;
  final bool enabled;
  final int maxLines;

  const CustomTextFormField({
    Key key,
    this.container,
    this.hint,
    this.hintText,
    this.labelText,
    this.radius = 10.0,
    this.prefixIcon,
    this.style,
    this.obscureText = false,
    this.validator,
    this.padding = 10,
    this.fillColor,
    this.keyboardType,
    this.enabled = true,
    this.maxLines = 1,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: container,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth(10)),
                child: prefixIcon,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth(10)),
                child: suffixIcon,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius(radius)),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
        filled: true,
        fillColor: fillColor ?? Colors.white,
        contentPadding: EdgeInsets.all(screenWidth(padding)),
        hintText: hintText,
        hintStyle: bodyStyle5.copyWith(color: deactivateColor),
        labelText: labelText,
      ),
      style: style,
      obscureText: obscureText,
      validator: validator,
      enabled: enabled,
      keyboardType: keyboardType,
      maxLines: maxLines,
    );
  }
}
