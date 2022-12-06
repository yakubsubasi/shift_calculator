// second form page that ask names of working places

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calculator/state/shift_state.dart';

import 'package:shift_calculator/view/custom_components/custom_form_page.dart';
import 'package:shift_calculator/view/custom_components/custom_form_text_field.dart';

class SecondFormPage extends StatelessWidget {
  const SecondFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFormPage(children: [
      Text(
        'Çalışma alanlarının isimlerini giriniz:',
        style: Theme.of(context).textTheme.headline6,
      ),
      SizedBox(
        height: 40,
      ),
      ...List.generate(
        context.watch<ShiftController>().numberOfWorkingPlaces,
        (index) => CustomFormTextField(
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            hintText: 'Çalışma alanı ${index + 1}',
          ),
          keyboardType: TextInputType.text,
          onChanged: (value) {
            context.read<ShiftController>().setWorkingPlaceName(index, value);
          },
        ),
      ),
      // a button to go to the next page
      SizedBox(
        height: 70,
      ),
      ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, 'naming'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Devam'),
              SizedBox(width: 10, height: 40),
              Icon(Icons.arrow_forward)
            ],
          ))
    ]);
  }
}
