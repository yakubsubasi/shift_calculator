// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import 'package:shift_calculator/model/shift_model.dart';
import 'package:shift_calculator/state/shift_state.dart';

// a page that ask how many people will work today and how many working places exist. Page places 2 small textfield in the middle of page to ask questions. Then it directs to other page

class CustomFormPage extends StatelessWidget {
  List<Widget> children;

  CustomFormPage({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: context.isSmallScreen
            ? const EdgeInsets.all(40.0)
            : const EdgeInsets.all(80.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      ),
    );
  }
}
