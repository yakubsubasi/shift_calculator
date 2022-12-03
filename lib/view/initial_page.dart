import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calculator/model/shift_model.dart';
import 'package:shift_calculator/state/shift_state.dart';

// a page that ask how many people will work today and how many working places exist. Page places 2 small textfield in the middle of page to ask questions. Then it directs to other page

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shift = Shift(
        startTime: DateTime(2020, 1, 1, 8, 30),
        numberOfWorkers: 9,
        numberOfWorkingPlaces: 4);

    final shiftController = context.read<ShiftController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Shift'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Kaç kişi çalışacak?',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                  expands: false,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value != '') {
                      shiftController.setNumberOfWorkers = int.parse(value);
                    } else {
                      shiftController.setNumberOfWorkers = 0;
                    }
                  },
                )),
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
            Consumer<ShiftController>(
              builder: (context, shiftController, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,

                    // make short field
                    expands: false,

                    keyboardType: TextInputType.number,

                    onChanged: (value) {
                      // execption
                      if (value != '') {
                        shiftController.setNumberOfWorkingPlaces =
                            int.parse(value);
                      } else {
                        shiftController.setNumberOfWorkingPlaces = 0;
                      }
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (shiftController.numberOfWorkers >=
                    shiftController.numberOfWorkingPlaces) {
                  // worker listesi oluşturuluyor
                  shiftController.workers.addAll(List.generate(
                      shiftController.numberOfWorkers, (index) => ''));
                  print(shiftController.workers);
                  Navigator.pushNamed(context, 'naming');
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
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
