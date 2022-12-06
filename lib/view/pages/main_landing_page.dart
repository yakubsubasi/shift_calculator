// Make a main landing page for the app
// Components of page:
// - a button to go to the first form page
// - a header text that says "Shift Hesaplayıcı"
// - a subheader text that says "Shift Hesaplayıcı, çalışma saatlerinizi ve çalışma alanlarınızın isimlerini girerek, haftalık çalışma saatlerinizi ve haftalık çalışma alanlarınızın isimlerini gösteren bir tablo oluşturur."
// - a picture of the app

import 'package:flutter/material.dart';
import 'package:shift_calculator/state/shift_state.dart';
import 'package:shift_calculator/view/custom_components/custom_form_page.dart';
import 'package:shift_calculator/view/custom_components/custom_form_text_field.dart';

class MainLandingPage extends StatelessWidget {
  const MainLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // right corner has app logo, left corner has drawer icon
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo_app.png',
              fit: BoxFit.contain,
              height: 38,
              //add border radius
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shift Hesaplayıcı',
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Shift Hesaplayıcı, çalışma saatlerinizi ve çalışma alanlarınızın isimlerini girerek, günlük çalışma saatlerinizi ve alanlarınızı gösteren bir tablo oluşturur.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Image.asset(
                  '/Users/yakubsubasi/development/projects/shift_calc/shift_calculator/assets/images/landing_page_image.png',
                  width: 350,
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 20,
                ),
              ),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, 'first'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Başla'),
                      SizedBox(width: 10, height: 40),
                      Icon(Icons.arrow_forward)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
