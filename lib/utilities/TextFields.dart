import 'package:flutter/material.dart';
import 'package:roadmap/utilities/AppTheme.dart';

Widget textFormField(
    {BuildContext context,
      Function validator,
      Function onChanged,
      String labelText,
      int maxLines,
      bool obscureText,
      TextInputType textInputType,
      TextEditingController controller}) {
  return Padding(
    padding: const EdgeInsets.only(right: 25, left: 25),
    child: TextFormField(
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines??1,
      controller: controller??null,
      keyboardType: textInputType??TextInputType.text,
      obscureText: obscureText??false,
      style: TextStyle(

          color: AppTheme.cardColor,
          fontWeight: FontWeight.bold,
          fontSize: 15),
      decoration: InputDecoration(
        errorStyle: TextStyle(
           color: Colors.red,
          fontSize: 14,
        ),
        contentPadding:
        EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        fillColor: Colors.transparent,
        enabled: true,
        labelText: labelText,
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          backgroundColor: Colors.transparent,
          fontSize: 12,
        ),
      ),
    ),
  );
}
