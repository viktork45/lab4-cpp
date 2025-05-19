import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Форма валідації')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                // Email field
                FormBuilderTextField(
                  name: 'email',
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email є обов’язковим';
                    }
                    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value)) {
                      return 'Невірний email';
                    }
                    return null;
                  },
                ),

                // Date field
                FormBuilderTextField(
                  name: 'date',
                  decoration: InputDecoration(labelText: 'Дата (DD.MM.YYYY)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Дата є обов’язковою';
                    }
                    if (!RegExp(r'^(0[1-9]|[12][0-9]|3[01])\.(0[1-9]|1[0-2])\.(19|20)\d\d$')
                        .hasMatch(value)) {
                      return 'Невірний формат дати';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      final formData = _formKey.currentState!.value;
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Успіх'),
                          content: Text('Дані коректні:\n${formData.toString()}'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Форма містить помилки')),
                      );
                    }
                  },
                  child: Text('Перевірити'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}