import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

 

void main() {

  runApp(MyApp());

}

 

class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      home: Scaffold(

        body: Padding(

          padding: EdgeInsets.all(16.0),

          child: FormBuilder(

            child: Column(

              children: [

                FormBuilderTextField(

                  name: 'email',

                  decoration: InputDecoration(labelText: 'Email'),

                  validator: (value) {

                    if (!RegExp(r'^[a-zA-Z0-9._%%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\$').hasMatch(value!)) {

                      return 'Невірний email';

                    }

                    return null;

                  },

                ),

                ElevatedButton(

                  onPressed: () {},

                  child: Text('Перевірити'),

                )

              ],

            ),

          ),

        ),

      ),

    );

  }

}