import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calculator/model/shift_model.dart';
import 'package:shift_calculator/state/shift_state.dart';
import 'package:kartal/kartal.dart';
import 'package:shift_calculator/view/custom_components/custom_form_page.dart';
import 'package:shift_calculator/view/custom_components/custom_form_text_field.dart';

class FirstFormPage extends StatelessWidget {
  const FirstFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    var shiftController = context.watch<ShiftController>();
    return CustomFormPage(
      children: [
        Text(
          'Kaç kişi çalışacak?',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 20,
        ),
        CustomFormTextField(
          onChanged: (value) {
            if (value != '') {
              try {
                shiftController.setNumberOfWorkers = int.parse(value);
              } catch (e) {
                // if value is not a number show a pop up to enter a valid number
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('Lütfen geçerli bir sayı giriniz'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Tamam'))
                          ],
                        ));
              }
            } else {
              shiftController.setNumberOfWorkers = 0;
            }
          },
        ),
        SizedBox(
          height: 70,
        ),
        Text(
          'Kaç çalışma alanı var?',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,

          // make short field
          expands: false,

          keyboardType: TextInputType.number,

          onChanged: (value) {
            // execption
            if (value != '') {
              shiftController.setNumberOfWorkingPlaces = int.parse(value);
            } else {
              shiftController.setNumberOfWorkingPlaces = 0;
            }
          },
        ),
        SizedBox(
          height: 40,
        ),
        ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Devam'),
              SizedBox(
                height: 40,
                width: 10,
              ),
              Icon(Icons.arrow_forward),
            ],
          ),
          // next icon button

          onPressed: shiftController.numberOfWorkers == 0 ||
                  shiftController.numberOfWorkingPlaces == 0
              ? null
              : () {
                  if (shiftController.numberOfWorkers >=
                      shiftController.numberOfWorkingPlaces) {
                    // State'te boş workers listesi oluşturuluyor
                    shiftController.workers.addAll(List.generate(
                        shiftController.numberOfWorkers, (index) => ''));
                    // State'te boş workingPlaces listesi oluşturuluyor
                    shiftController.workingPlaces.addAll(List.generate(
                        shiftController.numberOfWorkingPlaces,
                        (index) => '${index + 1}. alan '));
                    print(shiftController.workers);
                    Navigator.pushNamed(context, 'second');
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Hata'),
                            content: Text(
                                'Çalışma yeri sayısı çalışan sayısından fazla olamaz'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Tamam'))
                            ],
                          );
                        });
                  }
                },
        ),
      ],
    );
  }
}
