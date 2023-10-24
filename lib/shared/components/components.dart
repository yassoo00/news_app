import 'package:flutter/material.dart';

Widget separator()=>
    Container(
      width: double.infinity,
      height: 1.0,
      decoration: BoxDecoration(
        color: Colors.grey[600],
      ),
    );


void navigateTo(context, widget)=>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>widget,
      ),
    );


Widget defaultTextField({
  required TextEditingController control,
  TextInputType? type,
  bool scuredText = false,
  required String text,
  IconData? prefix,
  IconData? suffix,
  bool readOnly = false,
  ValueChanged? onChange,
  VoidCallback? suffixFunction,
  FormFieldValidator? validate,
  VoidCallback? onTap,
}) =>
    TextFormField(
      onTap: onTap,
      validator: validate,
      onChanged: onChange,
      readOnly: readOnly,
      controller: control,
      keyboardType: type,
      obscureText: scuredText,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(
            15.0,
          ),
        ),
        labelText: text,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixFunction,
          icon: Icon(
            suffix,
          ),
        )
            : null,
      ),
    );