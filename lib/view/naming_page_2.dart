import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shift_calculator/state/shift_state.dart';

class NamingPage extends StatelessWidget {
  const NamingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(padding: EdgeInsets.all(24), child: WorkerNameForm()),
      ),
    );
  }
}

class WorkerNameForm extends StatefulWidget {
  const WorkerNameForm({super.key});

  @override
  State<WorkerNameForm> createState() => _WorkerNameFormState();
}

class _WorkerNameFormState extends State<WorkerNameForm> {
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<ShiftController>().calcShift();
      Navigator.pushNamed(context, 'shift');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lütfen tüm isimleri giriniz'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'İsimleri giriniz',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: context.read<ShiftController>().numberOfWorkers,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen tüm isimleri giriniz!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: '${index + 1}. İsim',
                      ),
                      expands: false,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        context
                            .read<ShiftController>()
                            .setWorkerName(index, value);
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 70,
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: !context
                        .watch<ShiftController>()
                        .workers
                        .any((element) => element == '')
                    ? _submit
                    : null,
                child: Text('       Devam        '),
              ),
            ),
          ],
        ));
  }
}
