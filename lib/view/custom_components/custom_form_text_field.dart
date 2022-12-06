// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomFormTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final InputDecoration decoration;
  final TextAlign textAlign;
  final TextStyle? style;

  const CustomFormTextField(
      {Key? key,
      required this.onChanged,
      this.keyboardType = TextInputType.number,
      this.decoration = const InputDecoration(),
      this.textAlign = TextAlign.center,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: this.decoration,
      style: style ?? Theme.of(context).textTheme.headline5,
      textAlign: textAlign,
      expands: false,
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}
