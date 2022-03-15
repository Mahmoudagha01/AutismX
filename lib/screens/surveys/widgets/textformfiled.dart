import 'package:flutter/material.dart';

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      validator: validate,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );